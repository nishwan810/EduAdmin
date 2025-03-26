<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@page import="java.util.List"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Collect Fees</title>
    <%@include file="AccountantNavBar.jsp" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .main-container {
            display: flex;
            gap: 20px;
            max-width: 1200px;
            margin: 2rem auto;
        }
        .message-container {
            width: 300px;
        }
        .form-container {
            flex: 1;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: white;
            height: fit-content;
        }
        .form-title {
            color: #2c3e50;
            position: relative;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        .form-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 3px;
            background: #4361ee;
        }
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
        }
        .form-control, .form-select {
            padding: 10px 15px;
            border-radius: 6px;
            margin-bottom: 5px;
        }
        .form-control:focus, .form-select:focus {
            border-color: #4361ee;
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }
        .submit-btn {
            background-color: #4361ee;
            border: none;
            padding: 12px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        .submit-btn:hover {
            background-color: #3a56d4;
            transform: translateY(-2px);
        }
        .alert-success {
            position: sticky;
            top: 20px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="main-container">
        <!-- Message Container (Left Side) -->
        <div class="message-container">
            <% if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i>
                    <strong>Success!</strong> Fee collected successfully.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
        </div>

        <!-- Form Container (Right Side) -->
        <div class="form-container">
            <h2 class="form-title">Collect Fees</h2>

            <!-- Form for Fee Collection -->
            <form action="CollectFeeController" method="post">
                <div class="mb-4">
                    <label for="studentId" class="form-label">
                        <i class="bi bi-person-fill me-2"></i>Select Student
                    </label>
                    <select class="form-select" id="studentId" name="studentId" required>
                        <option value="" selected disabled>-- Select Student --</option>
                        <%
                            StudentDao studentDao = new StudentDao(DatabaseConnection.connect());
                            List<StudentsEntities> studentsList = studentDao.getAllStudent();
                            for (StudentsEntities student : studentsList) {
                        %>
                        <option value="<%= student.getId() %>">
                            <%= student.getFirstName() + " " + student.getLastName() + " (ID: " + student.getId() + ")" %>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="amount" class="form-label">
                        <i class="bi bi-currency-dollar me-2"></i>Amount
                    </label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <input type="number" class="form-control" id="amount" name="amount" required step="0.01" min="0">
                    </div>
                </div>

                <div class="mb-4">
                    <label for="paymentMode" class="form-label">
                        <i class="bi bi-credit-card me-2"></i>Payment Mode
                    </label>
                    <select class="form-select" id="paymentMode" name="paymentMode" required>
                        <option value="Cash">Cash</option>
                        <option value="Credit Card">Credit Card</option>
                        <option value="Bank Transfer">Bank Transfer</option>
                        <option value="Online Payment">Online Payment</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="receiptNumber" class="form-label">
                        <i class="bi bi-receipt me-2"></i>Receipt Number
                    </label>
                    <input type="text" class="form-control" id="receiptNumber" name="receiptNumber" required>
                </div>

                <button type="submit" class="btn submit-btn w-100 mt-3">
                    <i class="bi bi-check-circle me-2"></i>Collect Fee
                </button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto-dismiss alert after 5 seconds
        setTimeout(function() {
            var alert = document.querySelector('.alert');
            if (alert) {
                var bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            }
        }, 5000);
    </script>
</body>
</html>