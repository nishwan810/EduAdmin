<%@page import="java.sql.SQLException"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.FeeDao"%>
<%@page import="com.engisphere.dao.ExpenseDao"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accountant Dashboard</title>
    <%@include file="AccountantNavBar.jsp"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --success-color: #4cc9f0;
            --warning-color: #f8961e;
            --danger-color: #f94144;
            --light-color: #f8f9fa;
            --dark-color: #212529;
        }
        
        body { 
            background: #f8fafc; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .dashboard-container { 
            margin-top: 20px;
            padding: 0 15px;
        }
        
        .dashboard-header {
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e9ecef;
        }
        
        .card { 
            border: none;
            border-radius: 12px; 
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
            overflow: hidden;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .card-body {
            padding: 25px;
        }
        
        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            opacity: 0.8;
        }
        
        .card-title { 
            font-size: 16px; 
            font-weight: 600; 
            color: #6c757d;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .card-value { 
            font-size: 28px; 
            font-weight: 700; 
            margin-bottom: 15px;
        }
        
        .card-footer {
            background: rgba(0, 0, 0, 0.03);
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            padding: 10px 25px;
            font-size: 14px;
        }
        
        .quick-action-btn {
            border-radius: 10px;
            padding: 15px 10px;
            margin-bottom: 15px;
            transition: all 0.3s ease;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%;
            color: white;
            text-decoration: none;
        }
        
        .quick-action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            color: white;
        }
        
        .quick-action-icon {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .summary-card {
            border-left: 4px solid;
        }
        
        .fees-card {
            border-left-color: var(--primary-color);
        }
        
        .pending-card {
            border-left-color: var(--danger-color);
        }
        
        .expenses-card {
            border-left-color: var(--warning-color);
        }
        
        .balance-card {
            border-left-color: var(--success-color);
        }
        
        .recent-activity {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }
        
        .activity-item {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .chart-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            height: 100%;
        }
    </style>
</head>
<body>

<%-- <%
Connection con = null;
try {
    con = DatabaseConnection.connect();
    FeeDao feeDao = new FeeDao(con);
    ExpenseDao expenseDao = new ExpenseDao(con);
    
    int totalFees = feeDao.totalFeesCollection();
    BigDecimal totalExpenses = expenseDao.getTotalExpenses();
    BigDecimal availableBalance = BigDecimal.valueOf(totalFees).subtract(totalExpenses);
    
    // Store data in request scope
    request.setAttribute("totalFees", totalFees);
    request.setAttribute("totalExpenses", totalExpenses);
    request.setAttribute("availableBalance", availableBalance);
%> --%>

<div class="dashboard-container">
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <div>
            <h2 class="text-dark mb-0">Dashboard</h2>
            <p class="text-muted mb-0">Welcome back! Here's what's happening today.</p>
        </div>
        <div class="d-flex align-items-center">
            <span class="badge bg-light text-dark me-2"><i class="bi bi-calendar me-2"></i><%= new java.util.Date().toString().substring(0, 10) %></span>
        </div>
    </div>
    
    <div class="row">
        <!-- Summary Cards -->
        <div class="col-md-3">
            <div class="card summary-card fees-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="card-title">Total Fees Collected</h6>
      <%--                       <h2 class="card-value text-primary">₹<%= totalFees %></h2> --%>
                        </div>
                        <div class="card-icon text-primary">
                            <i class="bi bi-cash-stack"></i>
                        </div>
                    </div>
                    <div class="card-footer px-0 py-0 bg-transparent">
                        <small class="text-success"><i class="bi bi-arrow-up"></i> 12% from last month</small>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-3">
            <div class="card summary-card pending-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="card-title">Pending Payments</h6>
                            <h2 class="card-value text-danger">₹<%= request.getAttribute("totalPendingFees") != null ? request.getAttribute("totalPendingFees") : "0" %></h2>
                        </div>
                        <div class="card-icon text-danger">
                            <i class="bi bi-exclamation-triangle"></i>
                        </div>
                    </div>
                    <div class="card-footer px-0 py-0 bg-transparent">
                        <small class="text-danger"><i class="bi bi-arrow-up"></i> 3 unpaid invoices</small>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-3">
            <div class="card summary-card expenses-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="card-title">Total Expenses</h6>
                      <%--       <h2 class="card-value text-warning">₹<%= totalExpenses %></h2> --%>
                        </div>
                        <div class="card-icon text-warning">
                            <i class="bi bi-graph-down"></i>
                        </div>
                    </div>
                    <div class="card-footer px-0 py-0 bg-transparent">
                        <small class="text-warning"><i class="bi bi-arrow-up"></i> 8% from last month</small>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-3">
            <div class="card summary-card balance-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="card-title">Available Balance</h6>
                     <%--        <h2 class="card-value text-success">₹<%= availableBalance %></h2> --%>
                        </div>
                        <div class="card-icon text-success">
                            <i class="bi bi-wallet2"></i>
                        </div>
                    </div>
                    <div class="card-footer px-0 py-0 bg-transparent">
                        <small class="text-success"><i class="bi bi-arrow-up"></i> 5% from last month</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row mt-4">
        <!-- Quick Actions -->
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-3">
                    <a href="CollectFee.jsp" class="quick-action-btn bg-primary">
                        <i class="bi bi-cash quick-action-icon"></i>
                        <span>Collect Fees</span>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="ExpenseManagement.jsp" class="quick-action-btn bg-success">
                        <i class="bi bi-pie-chart quick-action-icon"></i>
                        <span>Manage Expenses</span>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="FinancialReports.jsp" class="quick-action-btn bg-info">
                        <i class="bi bi-file-earmark-text quick-action-icon"></i>
                        <span>View Reports</span>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="#" class="quick-action-btn bg-warning">
                        <i class="bi bi-people quick-action-icon"></i>
                        <span>Students</span>
                    </a>
                </div>
            </div>
            
            <!-- Recent Transactions Chart -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="chart-container">
                        <h5 class="mb-4">Monthly Financial Overview</h5>
                        <div style="height: 300px; background: #f8f9fa; border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                            <!-- This would be replaced with an actual chart (Chart.js, etc.) -->
                            <p class="text-muted">Monthly income vs expenses chart would display here</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Recent Activity -->
        <div class="col-md-4">
            <div class="recent-activity">
                <h5 class="mb-4">Recent Activity</h5>
                
                <div class="activity-item">
                    <div class="d-flex justify-content-between">
                        <span><i class="bi bi-check-circle-fill text-success me-2"></i> Fee collected</span>
                        <small class="text-muted">2 min ago</small>
                    </div>
                    <small class="text-muted">₹2,500 from Student #1042</small>
                </div>
                
                <div class="activity-item">
                    <div class="d-flex justify-content-between">
                        <span><i class="bi bi-receipt text-primary me-2"></i> New expense</span>
                        <small class="text-muted">1 hour ago</small>
                    </div>
                    <small class="text-muted">₹1,200 for office supplies</small>
                </div>
                
                <div class="activity-item">
                    <div class="d-flex justify-content-between">
                        <span><i class="bi bi-exclamation-triangle-fill text-warning me-2"></i> Payment reminder</span>
                        <small class="text-muted">3 hours ago</small>
                    </div>
                    <small class="text-muted">Sent to Student #1035</small>
                </div>
                
                <div class="activity-item">
                    <div class="d-flex justify-content-between">
                        <span><i class="bi bi-file-earmark-pdf text-danger me-2"></i> Report generated</span>
                        <small class="text-muted">Yesterday</small>
                    </div>
                    <small class="text-muted">Monthly financial statement</small>
                </div>
                
                <div class="activity-item">
                    <div class="d-flex justify-content-between">
                        <span><i class="bi bi-cash-stack text-success me-2"></i> Fee collected</span>
                        <small class="text-muted">Yesterday</small>
                    </div>
                    <small class="text-muted">₹3,000 from Student #1038</small>
                </div>
                
                <div class="text-center mt-3">
                    <a href="#" class="btn btn-sm btn-outline-primary">View All Activity</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- <%
} catch (Exception e) {
    e.printStackTrace();
    request.setAttribute("errorMessage", "Error loading dashboard: " + e.getMessage());
    request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
} finally {
    if (con != null) {
        try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
}
%> --%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
