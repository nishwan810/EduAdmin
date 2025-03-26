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
</head>
<body>
    <div class="container mt-4">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h2><i class="bi bi-cash-stack"></i> Expense Management</h2>
            </div>

            <div class="card-body">
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
                    
                    <button type="submit">Add Expense</button>
                </form>

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
                                    Delete
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

                <h5>Total Expenses: ₹<%= totalExpenses.setScale(2, BigDecimal.ROUND_HALF_UP) %></h5>
            </div>
        </div>
    </div>
</body>
</html>
