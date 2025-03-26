<%@page import="java.util.List"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Issue Receipt</title>
    <%@include file="AccountantNavBar.jsp"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .container { max-width: 600px; margin-top: 50px; }
        .form-container { background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); }
        .btn-generate { width: 100%; }
    </style>
</head>
<body class="bg-light">
    <div class="container">
        <div class="form-container">
            <h2 class="text-center">Issue Fee Receipt</h2>

            <%-- Success Message --%>
            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success alert-dismissible fade show">
                    <i class="bi bi-check-circle-fill me-2"></i>
                    Receipt issued successfully!
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>

            <%-- Error Message --%>
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    Error generating receipt. Please try again.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>

            <form action="ReceiptController" method="post">
                <label class="form-label">Select Student:</label>
                <select name="studentId" class="form-select" required>
                    <option value="" selected disabled>-- Select Student --</option>
                    <%
                        StudentDao studentDao = new StudentDao(DatabaseConnection.connect());
                        List<StudentsEntities> students = studentDao.getAllStudent();
                        for (StudentsEntities student : students) {
                    %>
                    <option value="<%= student.getId() %>">
                        <%= student.getFirstName() + " " + student.getLastName() %> (ID: <%= student.getId() %>)
                    </option>
                    <% } %>
                </select>

                <label class="form-label mt-3">Amount:</label>
                <input type="number" name="amount" class="form-control" step="0.01" min="0" required>

                <label class="form-label mt-3">Payment Mode:</label>
                <select name="paymentMode" class="form-select">
                    <option value="Cash">Cash</option>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Bank Transfer">Bank Transfer</option>
                    <option value="Online Payment">Online Payment</option>
                </select>

                <button type="submit" class="btn btn-primary btn-generate mt-3">Generate Receipt</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
