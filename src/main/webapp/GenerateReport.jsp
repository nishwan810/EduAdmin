<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Report | EngiSphere</title>
    <%@include file="AccountantNavBar.jsp"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .generate-report-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 800px;
        }
        .report-header {
            border-bottom: 2px solid #4361ee;
            padding-bottom: 1rem;
            margin-bottom: 2rem;
        }
        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container">
        <div class="generate-report-container">
            <div class="report-header">
                <h2><i class="bi bi-file-earmark-plus me-2"></i>Generate New Report</h2>
                <p class="text-muted">Create a new financial report</p>
            </div>
            
            <form action="GenerateReportServlet" method="post" enctype="multipart/form-data">
                <div class="mb-4">
                    <label for="reportName" class="form-label">Report Name</label>
                    <input type="text" class="form-control" id="reportName" name="reportName" required>
                </div>
                
                <div class="mb-4">
                    <label for="reportType" class="form-label">Report Type</label>
                    <select class="form-select" id="reportType" name="reportType" required>
                        <option value="">-- Select Report Type --</option>
                        <option value="Monthly">Monthly Financial Report</option>
                        <option value="Quarterly">Quarterly Financial Report</option>
                        <option value="Annual">Annual Financial Report</option>
                        <option value="Custom">Custom Report</option>
                    </select>
                </div>
                
                <div class="mb-4">
                    <label for="reportDate" class="form-label">Report Date</label>
                    <input type="date" class="form-control" id="reportDate" name="reportDate" 
                           value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>" required>
                </div>
                
                <div class="mb-4">
                    <label for="reportFile" class="form-label">Upload Report File</label>
                    <input type="file" class="form-control" id="reportFile" name="reportFile" accept=".pdf,.xlsx,.docx" required>
                    <small class="text-muted">Supported formats: PDF, Excel, Word</small>
                </div>
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="FinancialReports.jsp" class="btn btn-outline-secondary me-md-2">
                        <i class="bi bi-x-circle me-2"></i>Cancel
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save me-2"></i>Generate Report
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>