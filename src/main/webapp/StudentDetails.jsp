<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Details</title>
<%@include file="bootstrapSupport.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(to right, #dfe9f3, #ffffff);
}

.container {
	margin-top: 50px;
	display: flex;
	justify-content: center;
}

.card {
	width: 600px;
	padding: 20px;
	border-radius: 12px;
	background: white;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
}

.card h3 {
	text-align: center;
	font-weight: bold;
	color: #0056b3;
	margin-bottom: 20px;
}

.details {
	font-size: 18px;
	color: #002b5c;
}

.details p {
	margin-bottom: 10px;
}

.details span {
	font-weight: bold;
	color: #004085;
}

.btn-back {
	display: block;
	width: 100%;
	text-align: center;
	font-size: 16px;
	margin-top: 20px;
	padding: 10px;
	border-radius: 5px;
	background: #004085;
	color: white;
	font-weight: bold;
	text-decoration: none;
	transition: 0.3s;
}

.btn-back:hover {
	background: #002b5c;
}

.image-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 20px;
}

.image-container img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #004085;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

.line-hr {
    width: 80%;
    border: 1px solid red;
    opacity: 0.8;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.5);
}

</style>
</head>
<body>

	<%@include file="AdminNavBar.jsp"%>
					<%
    StudentDao sdao = new StudentDao(DatabaseConnection.connect());
    int studentId = Integer.parseInt(request.getParameter("id")); // Get student ID from request
    double attendancePercentage = sdao.getStudentAttendancePercentage(studentId);
%>
	<%
	StudentsEntities student = (StudentsEntities) request.getAttribute("student");

	if (student == null) {
	%>
	<div class="container">
		<div class="alert alert-danger text-center" role="alert">
			<h3>Student not found.</h3>
			<a href="StudentTable.jsp" class="btn-back">Back to Student List</a>
		</div>
	</div>
	<%
	} else {
	%>

	<div class="container">
		<div class="card">
			<div class="image-container">
				<img src="images/student-illustration.png"
					alt="Student Illustration" class="img-fluid">
				<h3>Student Details</h3>
				<hr class="line-hr">
			</div>



			<div class="details">
				<p>
					<span>ID:</span>
					<%=student.getId()%></p>
				<p>
					<span>First Name:</span>
					<%=student.getFirstName()%></p>
				<p>
					<span>Last Name:</span>
					<%=student.getLastName()%></p>
				<p>
					<span>Contact:</span>
					<%=student.getContact()%></p>
				<p>
					<span>Address:</span>
					<%=student.getAddress()%></p>
				<p>
					<span>Email:</span>
					<%=student.getEmail()%></p>
				<p>
					<span>Joining Date:</span>
					<%=student.getJoiningDate()%></p>
				<p>
					<span>Course:</span>
					<%=student.getCourse()%></p>

				<div class="stats-box">
					<span class="overall-attendance">Overall Attendance : </span> <%=String.format("%.2f", attendancePercentage)%> %
				</div>

			</div>
			<a href="DisplayStudent.jsp" class="btn-back">Back to Student
				List</a>
		</div>
	</div>

	<%
	}
	%>

</body>
</html>
