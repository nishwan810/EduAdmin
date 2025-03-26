<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<!-- Include Bootstrap -->
<%-- <%@include file="bootstrapSupport.jsp"%> --%>

<%@include file="bootstrapSupport.jsp"%>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
	rel="stylesheet">

<!-- Custom Styles -->
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: #f4f7f6;
}

.navbar {
	font-weight: 600;
	transition: 0.3s ease-in-out;
}

.navbar-brand {
	font-size: 22px;
	font-weight: 600;
}

.card {
	border-radius: 15px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
	border: none;
}

.card-header {
	background: linear-gradient(135deg, #28a745, #218838);
	color: white;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	padding: 15px;
}

.form-control {
	border-radius: 10px;
	padding: 12px;
}

.btn-primary {
	background-color: #28a745;
	border: none;
	border-radius: 10px;
	padding: 12px;
	font-size: 16px;
	transition: 0.3s;
}

.btn-primary:hover {
	background-color: #218838;
}
</style>
</head>
<body>

	<!-- Navbar Section -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">EngiSphere</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
		</div>
	</nav>

	<!-- Main Content -->
	<main>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 mt-5">
					<div class="card">
						<div class="card-header">Login Here</div>

						<div class="card-body">
							<form action="LoginValidateServlet" method="post">
								<div class="form-group mt-4">
									<label for="loginName">Login Name</label> <input type="text"
										class="form-control" id="loginName"
										placeholder="Enter Login Name" name="loginName">
								</div>

								<div class="form-group mt-4">
									<label for="password">Password</label> <input type="password"
										class="form-control" id="password"
										placeholder="Enter Password" name="password">
								</div>

								<div class="form-group mt-4">
									<label for="userType">USER TYPE</label> <select
										class="form-control" id="userType" name="userType">
										<option value="">Select</option>
										<option value="Admin">Admin</option>
										<option value="Teacher">Teacher</option>
										<option value="Accountant">Accountant</option>
										<option value="Student">Student</option>
									</select>
								</div>



								<%
								String errorMessage = (String) request.getAttribute("errorMessage");
								%>
								<%
								if (errorMessage != null) {
								%>
								<div class="mt-3" style="color: red;">
									<%=errorMessage%>
								</div>
								<%
								}
								%>

								<button type="submit" class="btn btn-primary w-100 mt-3">Login</button>
							</form>
						</div>
					</div>

					<p class="text-center mt-3">
						<a href="#" class="text-success"
							style="text-decoration: none; font-weight: 600;">Forgot
							Password?</a>
					</p>
				</div>
			</div>
		</div>
	</main>

</body>
</html>
