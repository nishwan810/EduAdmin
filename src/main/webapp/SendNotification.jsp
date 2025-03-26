<%@page import="com.engisphere.dao.NotificationDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Send Notification</title>
    <%@include file="bootstrapSupport.jsp"%>
    <style>
        body {
            background: #f4f4f4;
        }
        .container {
            margin-top: 50px;
            width: 50%;
        }
        .card {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

    <%@include file="AdminNavBar.jsp"%>

    <div class="container">
        <div class="card">
            <h3 class="text-center text-primary">Send Notification</h3>
            <hr>
            <form action="SendNotificationServlet" method="post">
                <div class="form-group">
                    <label for="message">Notification Message:</label>
                    <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                </div>
                <div class="form-group mt-3">
                    <label for="userType">Send To:</label>
                    <select class="form-control" id="userType" name="userType" required>
                        <option value="all">All</option>
                        <option value="students">Students Only</option>
                        <option value="staff">Staff Only</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary mt-3 w-100">Send Notification</button>
            </form>
        </div>
    </div>

</body>
</html>
