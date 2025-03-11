<%@page import="java.util.ArrayList"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.StaffDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.engisphere.entity.StaffEntities"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff List</title>
<%@include file="bootstrapSupport.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<%@include file="AdminNavBar.jsp"%>
<body class="bg-light">
	<div class="container mt-5">
		<h2 class="text-center mb-4">Staff List</h2>
		<table class="table table-bordered table-striped">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Contact</th>
					<th>Address</th>
					<th>Email</th>
					<th>Joining Date</th>
					<th>Job Profession</th>
					<th>Salary</th>
					<th>Work</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<% 
    StaffDao sdao = new StaffDao(DatabaseConnection.connect());
    ArrayList<StaffEntities> staffList = sdao.getAllStaff();
    for (StaffEntities s : staffList) {
%>
				<tr>
					<td><%= s.getId() %></td>
					<td><%= s.getFirstName() %></td>
					<td><%= s.getLastName() %></td>
					<td><%= s.getContact() %></td>
					<td><%= s.getAddress() %></td>
					<td><%= s.getEmail() %></td>
					<td><%= s.getJoiningDate() %></td>
					<td><%= s.getJobProfession() %></td>
					<td><%= s.getSalary() %></td>
					<td><%= s.getWork() %></td>
					<td><a href="EditStudent.jsp?id=<%=s.getId() %>"
						class="btn btn-sm btn-outline-primary">Edit</a> <a
						href="DeleteStudentController?id=<%= s.getId() %>"
						class="btn btn-sm btn-outline-danger">Delete</a></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>
