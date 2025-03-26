<%@page import="com.engisphere.entity.FinancialReport"%>
<%@page import="com.engisphere.dao.FinancialReportDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Financial Reports | EngiSphere</title>
    <%@include file="AccountantNavBar.jsp"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <style>
        .report-container {
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
        .table-responsive {
            overflow-x: auto;
        }
        .action-btn {
            margin-right: 5px;
        }
    </style>
</head>

<%-- Display success/error messages --%>
<% if (session.getAttribute("message") != null) { %>
    <div class="alert alert-<%= session.getAttribute("messageType") %> alert-dismissible fade show" role="alert">
        <%= session.getAttribute("message") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% 
        session.removeAttribute("message");
        session.removeAttribute("messageType");
    %>
<% } %>
<body class="bg-light">
    <div class="container-fluid">
        <div class="report-container">
            <div class="report-header d-flex justify-content-between align-items-center">
                <h2><i class="bi bi-file-earmark-text me-2"></i>Financial Reports</h2>
                <a href="GenerateReport.jsp" class="btn btn-primary">
                    <i class="bi bi-plus-circle me-2"></i>Generate New Report
                </a>
            </div>

            <div class="table-responsive">
                <table id="reportsTable" class="table table-striped table-hover">
                    <thead class="table-primary">
                        <tr>
                            <th>ID</th>
                            <th>Report Name</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            FinancialReportDao reportDao = new FinancialReportDao(DatabaseConnection.connect());
                            List<FinancialReport> reports = reportDao.getAllReports();
                            
                            for (FinancialReport report : reports) {
                        %>
                        <tr>
                            <td><%= report.getId() %></td>
                            <td><%= report.getReportName() %></td>
                            <td><%= report.getReportDate() %></td>
                            <td>
                                <a href="ViewReport.jsp?id=<%= report.getId() %>" class="btn btn-sm btn-outline-primary action-btn">
                                    <i class="bi bi-eye"></i> View
                                </a>
                                <a href="DownloadReport?id=<%= report.getId() %>" class="btn btn-sm btn-outline-success action-btn">
                                    <i class="bi bi-download"></i> Download
                                </a>
                                <a href="DeleteReport?id=<%= report.getId() %>" class="btn btn-sm btn-outline-danger action-btn" onclick="return confirm('Are you sure you want to delete this report?');">
                                    <i class="bi bi-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    
    <script>
        $(document).ready(function() {
            $('#reportsTable').DataTable({
                dom: '<"top"f>rt<"bottom"lip><"clear">',
                responsive: true,
                pageLength: 10,
                order: [[2, 'desc']] // Sort by date descending
            });
        });
    </script>
</body>
</html>