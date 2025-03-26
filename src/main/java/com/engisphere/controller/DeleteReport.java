package com.engisphere.controller;

import com.engisphere.dao.FinancialReportDao;
import com.engisphere.dao.DatabaseConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/DeleteReport")
public class DeleteReport extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int reportId = Integer.parseInt(request.getParameter("id"));
        FinancialReportDao reportDao = new FinancialReportDao(DatabaseConnection.connect());
        String filePath = reportDao.getReportById(reportId).getFilePath();
        
        // Delete from database
        boolean dbDeleted = deleteFromDatabase(reportId);
        
        // Delete the file
        boolean fileDeleted = false;
        if (dbDeleted) {
            File file = new File(filePath);
            if (file.exists()) {
                fileDeleted = file.delete();
            }
        }
        
        if (dbDeleted) {
            request.getSession().setAttribute("message", "Report deleted successfully");
            request.getSession().setAttribute("messageType", "success");
        } else {
            request.getSession().setAttribute("message", "Failed to delete report");
            request.getSession().setAttribute("messageType", "danger");
        }
        
        response.sendRedirect("FinancialReports.jsp");
    }
    
    private boolean deleteFromDatabase(int reportId) {
        String query = "DELETE FROM reports WHERE id = ?";
        try (Connection conn = DatabaseConnection.connect();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, reportId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}