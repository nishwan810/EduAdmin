<%@page import="java.sql.SQLException"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.FeeDao"%>
<%@page import="com.engisphere.dao.ExpenseDao"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Connection con = null;
    BigDecimal totalFees = BigDecimal.ZERO;
    BigDecimal totalExpenses = BigDecimal.ZERO;
    BigDecimal availableBalance = BigDecimal.ZERO;

    try {
        con = DatabaseConnection.connect();
        FeeDao feeDao = new FeeDao(con);
        ExpenseDao expenseDao = new ExpenseDao(con);

        // Fetch Total Fees Collected and Total Expenses
        totalFees = feeDao.getTotalCollectedFees();
        totalExpenses = expenseDao.getTotalExpenses();

        // Calculate Available Balance
        availableBalance = totalFees.subtract(totalExpenses);
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Error loading dashboard: " + e.getMessage());
    } finally {
        if (con != null) {
            try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accountant Dashboard</title>
    <%@include file="AccountantNavBar.jsp"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body { background: #f8fafc; }
        .dashboard-container { margin-top: 20px; padding: 0 15px; }
        .card { border-radius: 12px; transition: transform 0.3s ease, box-shadow 0.3s ease; margin-bottom: 20px; }
        .card:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); }
        .card-body { padding: 25px; }
        .card-title { font-size: 16px; font-weight: 600; color: #6c757d; text-transform: uppercase; }
        .card-value { font-size: 28px; font-weight: 700; }
        .summary-card { border-left: 4px solid; }
        .fees-card { border-left-color: #4361ee; }
        .expenses-card { border-left-color: #f8961e; }
        .balance-card { border-left-color: #4cc9f0; }
    
		.quick-action-btn {display: flex;flex-direction: column; align-items: center; justify-content: center; text-align: center;
		    color: white;font-size: 1.1rem;padding: 15px;border-radius: 10px; transition: all 0.3s ease; height: 100px; text-decoration: none;}
		.quick-action-btn:hover {transform: translateY(-5px); box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2); color: white;}
		.quick-action-icon {font-size: 2rem; margin-bottom: 8px;}
        
    </style>
</head>
<body>

<div class="dashboard-container">
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <h2 class="text-dark mb-0">Dashboard</h2>
        <span class="badge bg-light text-dark">
            <i class="bi bi-calendar me-2"></i><%= new java.util.Date().toString().substring(0, 10) %>
         
        </span>
    </div>
    <br>
    
    <div class="row">
        <!-- Total Fees Collected -->
        <div class="col-md-4">
            <div class="card summary-card fees-card">
                <div class="card-body">
                    <h6 class="card-title">Total Fees Collected</h6>
                    <h2 class="card-value text-primary">₹<%= totalFees.setScale(2, BigDecimal.ROUND_HALF_UP) %></h2>
                </div>
            </div>
        </div>

        <!-- Total Expenses -->
        <div class="col-md-4">
            <div class="card summary-card expenses-card">
                <div class="card-body">
                    <h6 class="card-title">Total Expenses</h6>
                    <h2 class="card-value text-warning">₹<%= totalExpenses.setScale(2, BigDecimal.ROUND_HALF_UP) %></h2>
                </div>
            </div>
        </div>

        <!-- Available Balance -->
        <div class="col-md-4">
            <div class="card summary-card balance-card">
                <div class="card-body">
                    <h6 class="card-title">Available Balance</h6>
                    <h2 class="card-value text-success">₹<%= availableBalance.setScale(2, BigDecimal.ROUND_HALF_UP) %></h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
       <!-- Quick Actions -->
    <div class="row mt-4">
        <div class="col-md-3">
            <a href="CollectFee.jsp" class="quick-action-btn bg-primary">
                <i class="bi bi-cash-coin quick-action-icon"></i>
                <span>Collect Fees</span>
            </a>
        </div>
        <div class="col-md-3">
            <a href="ExpenseManagement.jsp" class="quick-action-btn bg-warning">
                <i class="bi bi-credit-card quick-action-icon"></i>
                <span>Manage Expenses</span>
            </a>
        </div>
        <div class="col-md-3">
            <a href="FinancialReports.jsp" class="quick-action-btn bg-info">
                <i class="bi bi-bar-chart quick-action-icon"></i>
                <span>View Reports</span>
            </a>
        </div>
        <div class="col-md-3">
            <a href="DisplayStudent.jsp" class="quick-action-btn bg-dark">
                <i class="bi bi-people quick-action-icon"></i>
                <span>Students</span>
            </a>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
