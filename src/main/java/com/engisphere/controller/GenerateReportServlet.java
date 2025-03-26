package com.engisphere.controller;

import com.engisphere.dao.DatabaseConnection;
import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GenerateReportServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class GenerateReportServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "reports";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get form data
        String reportName = request.getParameter("reportName");
        String reportType = request.getParameter("reportType");
        String reportDateStr = request.getParameter("reportDate");
        Part filePart = request.getPart("reportFile");
        
        // Validate date
        java.sql.Date reportDate = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = sdf.parse(reportDateStr);
            reportDate = new java.sql.Date(parsedDate.getTime());
        } catch (ParseException e) {
            request.getSession().setAttribute("message", "Invalid date format");
            request.getSession().setAttribute("messageType", "danger");
            response.sendRedirect("GenerateReport.jsp");
            return;
        }
        
        // Get application path and construct upload directory
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        
        // Create upload folder if it doesn't exist
        File uploadFolder = new File(uploadFilePath);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }
        
        // Save the file
        String fileName = System.currentTimeMillis() + "_" + getFileName(filePart);
        String filePath = uploadFilePath + File.separator + fileName;
        filePart.write(filePath);
        
        // Save to database
        String relativeFilePath = UPLOAD_DIR + "/" + fileName;
        boolean success = saveToDatabase(reportName, reportType, reportDate, relativeFilePath);
        
        // Set response message
        if (success) {
            request.getSession().setAttribute("message", "Report generated successfully!");
            request.getSession().setAttribute("messageType", "success");
        } else {
            request.getSession().setAttribute("message", "Failed to generate report");
            request.getSession().setAttribute("messageType", "danger");
        }
        
        response.sendRedirect("FinancialReports.jsp");
    }
    
    private boolean saveToDatabase(String reportName, String reportType, java.sql.Date reportDate, String filePath) {
        String query = "INSERT INTO reports (report_name, report_date, file_path) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, reportName);
            stmt.setDate(2, reportDate);
            stmt.setString(3, filePath);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}