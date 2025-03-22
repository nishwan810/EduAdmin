<%@page import="com.engisphere.entity.StaffEntities"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Details</title>
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
	text-align: center;
}

.profile-pic {
	width: 150px;
	height: 150px;
	object-fit: cover;
	border-radius: 50%;
	border: 4px solid #004085;
	margin-bottom: 15px;
	justify-content: center;
}

.card h3 {
	font-weight: bold;
	color: #0056b3;
	margin-bottom: 10px;
}

.details {
	font-size: 18px;
	color: #002b5c;
	text-align: left;
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
    StaffEntities teacher = (StaffEntities) request.getAttribute("teacher");

    if (teacher == null) {
%>
	<div class="container">
		<div class="alert alert-danger text-center" role="alert">
			<h3>Teacher not found.</h3>
			<a href="DisplayStaff.jsp" class="btn-back">Back to Staff List</a>
		</div>
	</div>
	<%
    } else {
%>

	<div class="container">
		<div class="card">
			<div class="image-container">
				<img src="images/staff-illustration.png" alt="Staff Illustration"
					class="img-fluid rounded-circle"
					style="width: 100px; height: 100px;"> <br>
				<h3>Teacher Details</h3>

				<hr class="line-hr">
			</div>

			<div class="details">
				<p>
					<span>ID:</span>
					<%= teacher.getId() %></p>
				<p>
					<span>First Name:</span>
					<%= teacher.getFirstName() %></p>
				<p>
					<span>Last Name:</span>
					<%= teacher.getLastName() %></p>
				<p>
					<span>Contact:</span>
					<%= teacher.getContact() %></p>
				<p>
					<span>Address:</span>
					<%= teacher.getAddress() %></p>
				<p>
					<span>Email:</span>
					<%= teacher.getEmail() %></p>
				<p>
					<span>Joining Date:</span>
					<%= teacher.getJoiningDate() %></p>
				<p>
					<span>Job Profession:</span>
					<%= teacher.getJobProfession() %></p>
				<p>
					<span>Salary:</span>
					<%= teacher.getSalary() %></p>
				<p>
					<span>Work:</span>
					<%= teacher.getWork() %></p>
			</div>
			<a href="DisplayStaff.jsp" class="btn-back">Back to Staff List</a>
		</div>
	</div>

	<%
    }
%>

</body>
</html>
