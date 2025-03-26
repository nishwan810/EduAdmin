<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@page import="java.util.List"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
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
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 20px;
            min-height: 100vh;
            max-width: 600px;
            margin: 0 auto;
        }

        .message-container {
            width: 100%;
            text-align: center;
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body class="bg-light">
    <div class="main-container">
        <!-- Message Container -->
        <div class="message-container">
            <%
                String success = request.getParameter("success");
                String error = request.getParameter("error");
            %>
            
            <%-- Success Message --%>
            <% if (success != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i>
                    <strong>Success!</strong> Fee collected successfully.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <%-- Error Messages --%>
            <% if (error != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    <strong>Error:</strong> 
                    <% if (error.equals("invalid_input")) { %>
                        Invalid input! Please enter valid data.
                    <% } else if (error.equals("database")) { %>
                        Database error! Could not process the payment.
                    <% } else if (error.equals("server")) { %>
                        Server error! Please try again later.
                    <% } else { %>
                        An unknown error occurred.
                    <% } %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
        </div>

        <!-- Form Container -->
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
                            try (Connection conn = DatabaseConnection.connect()) {
                                StudentDao studentDao = new StudentDao(conn);
                                List<StudentsEntities> studentsList = studentDao.getAllStudent();
                                for (StudentsEntities student : studentsList) {
                        %>
                        <option value="<%= student.getId() %>">
                            <%= student.getFirstName() + " " + student.getLastName() + " (ID: " + student.getId() + ")" %>
                        </option>
                        <% 
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
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

                <button type="submit" class="btn btn-primary submit-btn w-100 mt-3 d-flex align-items-center justify-content-center">
                    <i class="bi bi-check-circle me-2"></i> Collect Fee
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
