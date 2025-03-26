<%@page import="java.math.BigDecimal"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.ExpenseDao"%>
<%@page import="com.engisphere.entity.ExpenseEntity"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection conn = DatabaseConnection.connect();
    ExpenseDao expenseDAO = new ExpenseDao(conn);
    List<ExpenseEntity> expenseList = expenseDAO.getAllExpenses();
    BigDecimal totalExpenses = expenseDAO.getTotalExpenses();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Expenses</title>
    <%@include file="AccountantNavBar.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        /* Page Styling */
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 900px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            font-size: 1.5rem;
            font-weight: bold;
        }

        /* Form Styling */
        form {
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        form label {
            font-weight: bold;
            margin-top: 10px;
        }

        form input, form select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        form button {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px;
            font-size: 1rem;
            width: 100%;
            border-radius: 5px;
            margin-top: 15px;
            transition: 0.3s;
        }

        form button:hover {
            background: #0056b3;
        }

        /* Table Styling */
        .table {
            margin-top: 20px;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background: #007bff;
            color: white;
            padding: 12px;
        }

        .table td {
            padding: 10px;
            border-bottom: 1px solid #dee2e6;
        }

        .table tr:hover {
            background: #f1f3f5;
        }

        /* Delete Button */
        .btn-danger {
            padding: 5px 10px;
            font-size: 0.9rem;
            border-radius: 5px;
            transition: 0.3s;
        }

        .btn-danger:hover {
            background: #c82333;
        }

        /* Total Expense Styling */
        .total-expense {
            font-size: 1.2rem;
            font-weight: bold;
            background: #f8f9fa;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h2><i class="bi bi-cash-stack"></i> Expense Management</h2>
            </div>

            <div class="card-body">
                <!-- Expense Form -->
                <form action="ExpenseController" method="post">
                    <input type="hidden" name="action" value="add">
                    
                    <label>Expense Name:</label>
                    <input type="text" name="expenseName" required>

                    <label>Category:</label>
                    <select name="category" required>
                        <option value="Office Supplies">Office Supplies</option>
                        <option value="Utilities">Utilities</option>
                        <option value="Salaries">Salaries</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="Other">Other</option>
                    </select>

                    <label>Amount (₹):</label>
                    <input type="number" name="amount" step="0.01" min="0" required>

                    <label>Date:</label>
                    <input type="date" name="expenseDate" required>

                    <button type="submit"><i class="bi bi-plus-circle"></i> Add Expense</button>
                </form>

                <!-- Expense Table -->
                <h4 class="mt-4">Expense Records</h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Amount</th>
                            <th>Category</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy");
                            if (!expenseList.isEmpty()) {
                                for (ExpenseEntity expense : expenseList) {
                        %>
                        <tr>
                            <td><%= expense.getId() %></td>
                            <td><%= expense.getExpenseName() %></td>
                            <td>₹<%= expense.getAmount().setScale(2, BigDecimal.ROUND_HALF_UP) %></td>
                            <td><%= expense.getCategory() %></td>
                            <td><%= dateFormat.format(expense.getExpenseDate()) %></td>
                            <td>
                                <a href="ExpenseController?action=delete&id=<%= expense.getId() %>" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this expense?')">
                                    <i class="bi bi-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                        <% 
                                }
                            } else { 
                        %>
                        <tr>
                            <td colspan="6" class="text-center">No expenses recorded yet.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

                <!-- Total Expenses -->
                <div class="total-expense">
                    <i class="bi bi-calculator"></i> Total Expenses: ₹<%= totalExpenses.setScale(2, BigDecimal.ROUND_HALF_UP) %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
