<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Student</title>
<%@include file="bootstrapSupport.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">

<style>
body {
	background-color: #f8f9fa;
}

.form-container {
	max-width: 800px;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
}

.form-group {
	margin-bottom: 15px;
}

.btn-submit {
	background-color: blue;
	color: white;
}

.btn-reset {
	background-color: red;
	color: white;
}
</style>
</head>
<body>
	<%@include file="AdminNavBar.jsp"%>

	<div class="container mt-5">
		<div class="form-container mx-auto">
			<h4 class="text-center text-white bg-success py-2 rounded">Edit
				Student</h4>
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			StudentDao sdao = new StudentDao(DatabaseConnection.connect());
			StudentsEntities s1 = sdao.getStudentById(id);
			%>


			<form action="EditStudentController" method="post">
				<input type="hidden" name="id" value="<%=s1.getId()%>">
				<div class="row">
					<!-- First Column -->
					<div class="col-md-6">
						<div class="form-group">
							<label>First Name</label> <input type="text" class="form-control"
								name="firstName" required tabindex="1"
								value="<%=s1.getFirstName()%>">
						</div>
						<div class="form-group">
							<label>Last Name</label> <input type="text" class="form-control"
								name="lastName" required tabindex="2"
								value="<%=s1.getLastName()%>">
						</div>
						<div class="form-group">
							<label>Contact</label> <input type="text" class="form-control"
								name="contact" required tabindex="3"
								value="<%=s1.getContact()%>">
						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" class="form-control"
								name="email" required tabindex="4" value="<%=s1.getEmail()%>">
						</div>
					</div>

					<!-- Second Column -->
					<div class="col-md-6">
						<div class="form-group">
							<label>Address</label> <input type="text" class="form-control"
								name="address" tabindex="5" value="<%=s1.getAddress()%>">
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password"
								class="form-control" name="password" required tabindex="6"
								value="<%=s1.getPassword()%>">
						</div>
						<div class="form-group">
							<label>Joining Date</label> <input type="date"
								class="form-control" name="joiningDate" tabindex="7"
								value="<%=s1.getJoiningDate()%>">
						</div>
						<div class="form-group">
							<label>Course</label> <select class="form-control" name="course"
								tabindex="8">
								<option>Select Branch</option>
								<option>BioTech</option>
								<option>Chemical</option>
								<option>IT</option>
								<option>Computer Science</option>
								<option>Electronics</option>
								<option>Mechanical</option>
								<option>Other</option>
							</select>
						</div>
					</div>
				</div>


				<%
				String successMessage = (String) session.getAttribute("success");
				String errorMessage = (String) session.getAttribute("error");
				%>
				<div id="messageBox">

					<%
					if (successMessage != null) {
					%>
					<div class="mt-3" style="color: green;" role="alert">
						<%=successMessage%>
					</div>
					<%
					session.removeAttribute("success"); // Remove success message after displaying
					%>
					<%
					}
					%>

					<%
					if (errorMessage != null) {
					%>
					<div class=" mt-3" style="color: red;" role="alert">
						<%=errorMessage%>
					</div>
					<%
					session.removeAttribute("error");
					%>
					<%
					}
					%>

				</div>

				<script>
					setTimeout(function() {
						var messageBox = document.getElementById("messageBox");
						if (messageBox) {
							messageBox.style.display = "none";
						}
					}, 4000);
				</script>



				<!-- Buttons -->
				<div class="text-center mt-3">
					<button type="submit" class="btn btn-submit" tabindex="9">Submit</button>
					<button type="reset" class="btn btn-reset ml-3" tabindex="10">Reset</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
