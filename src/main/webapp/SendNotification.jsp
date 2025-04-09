<%@page import="com.engisphere.dao.NotificationDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Notification</title>
    <%@include file="bootstrapSupport.jsp"%>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --dark-color: #2c3e50;
        }
        .notification-card {
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            border: none;
        }
        .notification-header {
            border-bottom: 2px solid rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-light">

    <%@include file="AdminNavBar.jsp"%>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="card notification-card">
                    <div class="card-header bg-white notification-header">
                        <h3 class="card-title text-center text-primary mb-0">
                            <i class="fas fa-bell me-2"></i>Send Notification
                        </h3>
                    </div>
                    <div class="card-body">
                        <form action="SendNotificationServlet" method="post">
                            <div class="mb-4">
                                <label for="message" class="form-label fw-semibold">Notification Message</label>
                                <textarea class="form-control" id="message" name="message" rows="5" 
                                    placeholder="Enter your notification message here..." required></textarea>
                            </div>
                            
                            <div class="mb-4">
                                <label for="userType" class="form-label fw-semibold">Send To</label>
                                <select class="form-select" id="userType" name="userType" required>
                                    <option value="all">All Users</option>
                                    <option value="students">Students Only</option>
                                    <option value="staff">Staff Only</option>
                                </select>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-paper-plane me-2"></i>Send Notification
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>