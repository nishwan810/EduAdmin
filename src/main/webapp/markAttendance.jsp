<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@page import="com.engisphere.entity.StaffEntities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.engisphere.dao.StaffDao"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mark Attendance</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<style>
.attendance-table {
	margin: 20px;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.attendance-table h3 {
	margin-bottom: 20px;
}

.attendance-table table {
	width: 100%;
	border-collapse: collapse;
}

.attendance-table th, .attendance-table td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

.attendance-table th {
	background-color: #f8f9fa;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="mt-4">Mark Attendance</h1>
		<form action="submitAttendance.jsp" method="post">
			<!-- Staff Attendance Section -->
			<div class="attendance-table">
				<h3>Staff Attendance</h3>
				<table>
					<thead>
						<tr>
							<th>Name</th>
							<th>Present</th>
							<th>Absent</th>
						</tr>
					</thead>
					<tbody>
						<%
						StaffDao staffDao = new StaffDao(DatabaseConnection.connect());
						ArrayList<StaffEntities> staffList = staffDao.getAllStaff();
						for (StaffEntities staff : staffList) {
						%>
						<tr>
							<td><%=staff.getFirstName()%> <%=staff.getLastName()%></td>
							<td><input type="radio" name="staff_<%=staff.getId()%>"
								value="Present" required></td>
							<td><input type="radio" name="staff_<%=staff.getId()%>"
								value="Absent" required></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>

			<!-- Student Attendance Section -->
			<div class="attendance-table">
				<h3>Student Attendance</h3>
				<table>
					<thead>
						<tr>
							<th>Name</th>
							<th>Present</th>
							<th>Absent</th>
						</tr>
					</thead>
					<tbody>
						<%
						StudentDao studentDao = new StudentDao(DatabaseConnection.connect());
						ArrayList<StudentsEntities> studentList = studentDao.getAllStudent();
						for (StudentsEntities student : studentList) {
						%>
						<tr>
							<td><%=student.getFirstName()%> <%=student.getLastName()%></td>
							<td><input type="radio" name="student_<%=student.getId()%>"
								value="Present" required></td>
							<td><input type="radio" name="student_<%=student.getId()%>"
								value="Absent" required></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>

			<!-- Submit Button -->
			<div class="mt-4">
				<button type="submit" class="btn btn-primary">Submit
					Attendance</button>
			</div>
		</form>
	</div>
</body>
</html>