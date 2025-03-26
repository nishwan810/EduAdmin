<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Dashboard</title>
</head>
<body>
<h1>Welcome to Student Dashboard</h1>







<!-- following code for showing notification  -->
<%-- 
<%@page import="com.engisphere.dao.NotificationDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="java.util.List"%>
<%@page import="com.engisphere.entity.NotificationEntity"%>

<%
    NotificationDao dao = new NotificationDao(DatabaseConnection.connect());
    List<NotificationEntity> notifications = dao.getNotifications("students");
%>

<div class="container mt-3">
    <h4 class="text-primary">Notifications</h4>
    <ul class="list-group">
        <% for (NotificationEntity n : notifications) { %>
            <li class="list-group-item">
                <%= n.getMessage() %> <small class="text-muted">(Posted on <%= n.getCreatedAt() %>)</small>
            </li>
        <% } %>
    </ul>
</div> --%>


</body>
</html>