<%@page import="com.engisphere.entity.StaffEntities"%>
<%@page import="com.engisphere.dao.StaffDao"%>
<%@page import="java.util.List"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher List</title>
    <%@include file="bootstrapSupport.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<%@include file="AdminNavBar.jsp"%>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Teacher List</h2>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Joining Date</th>
                    <th>Subject</th>
                    <th>Salary</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    StaffDao dao = new StaffDao(DatabaseConnection.connect());
                    List<StaffEntities> teacherList = dao.getAllStaff();
                    for (StaffEntities t : teacherList) {
                %>
                <tr>
                    <td><%= t.getId() %></td>
                    <td>
                        <a href="ViewTeacherController?id=<%= t.getId() %>">
                            <%= t.getFirstName() + " " + t.getLastName() %>
                        </a>
                    </td>
                    <td><%= t.getContact() %></td>
                    <td><%= t.getAddress() %></td>
                    <td><%= t.getEmail() %></td>
                    <td><%= t.getJoiningDate() %></td>
                    <td><%= t.getJobProfession() %></td>
                    <td><%= t.getSalary() %></td>
                    <td>
                        <a href="EditTeacher.jsp?id=<%= t.getId() %>" class="btn btn-sm btn-outline-primary">Edit</a>
                        <a href="DeleteTeacherController?id=<%= t.getId() %>" class="btn btn-sm btn-outline-danger">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
