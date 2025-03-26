<%@page import="com.engisphere.entity.FinancialReport"%>
<%@page import="com.engisphere.dao.FinancialReportDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Report | EngiSphere</title>
    <%@include file="AccountantNavBar.jsp"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .report-viewer-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin: 2rem auto;
        }
        .report-header {
            border-bottom: 2px solid #4361ee;
            padding-bottom: 1rem;
            margin-bottom: 2rem;
        }
        .report-iframe {
            width: 100%;
            height: 700px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container-fluid">
        <div class="report-viewer-container">
            <%
                int reportId = Integer.parseInt(request.getParameter("id"));
                FinancialReportDao reportDao = new FinancialReportDao(DatabaseConnection.connect());
                FinancialReport report = reportDao.getReportById(reportId);
                
                if (report != null) {
            %>
            <div class="report-header d-flex justify-content-between align-items-center">
                <div>
                    <h2><i class="bi bi-file-earmark-text me-2"></i><%= report.getReportName() %></h2>
                    <p class="text-muted mb-0">Generated on: <%= report.getReportDate() %></p>
                </div>
                <div>
                    <a href="DownloadReport?id=<%= report.getId() %>" class="btn btn-primary">
                        <i class="bi bi-download me-2"></i>Download
                    </a>
                    <a href="FinancialReports.jsp" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left me-2"></i>Back to Reports
                    </a>
                </div>
            </div>
            
            <div class="mt-4">
                <%
                    String filePath = report.getFilePath();
                    String fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toLowerCase();
                    
                    if (fileExtension.equals("pdf")) {
                %>
                <iframe src="<%= filePath %>" class="report-iframe"></iframe>
                <% } else if (fileExtension.equals("jpg") || fileExtension.equals("jpeg") || fileExtension.equals("png")) { %>
                <div class="text-center">
                    <img src="<%= filePath %>" alt="<%= report.getReportName() %>" class="img-fluid">
                </div>
                <% } else { %>
                <div class="alert alert-info">
                    <i class="bi bi-info-circle me-2"></i>
                    This file type cannot be previewed. Please download the report to view it.
                </div>
                <% } %>
            </div>
            <% } else { %>
            <div class="alert alert-danger">
                <i class="bi bi-exclamation-triangle me-2"></i>
                Report not found!
            </div>
            <a href="FinancialReports.jsp" class="btn btn-outline-primary mt-3">
                <i class="bi bi-arrow-left me-2"></i>Back to Reports
            </a>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>