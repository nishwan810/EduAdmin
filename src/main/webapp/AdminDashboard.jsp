<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EduAdmin Dashboard</title>
<%@include file="bootstrapSupport.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background: #f8f9fa;
}

.dashboard-title {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 10px;
}

.stats-box {
	text-align: center;
	padding: 20px;
	background: white;
	border-radius: 8px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.stats-box h2 {
	color: #007bff;
	font-weight: bold;
	margin-bottom: 5px;
}

.stats-box p {
	font-weight: 500;
	color: #555;
}

.attendance-container {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.attendance-table {
	width: 48%;
	text-align: center;
	background: white;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.attendance-table h4 {
	color: #0056b3;
	margin-bottom: 15px;
}

.grid {
	display: grid;
	grid-template-columns: repeat(6, 1fr);
	gap: 5px;
}

.grid div {
	width: 100%;
	height: 25px;
	background: #ddd;
	border-radius: 3px;
}

.grid div.top {
	background: #555;
}

.courses {
	margin-top: 20px;
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.courses ul {
	columns: 4;
	list-style: none;
	padding: 0;
}

.courses ul li {
	font-size: 16px;
	margin-bottom: 5px;
}
</style>
</head>
<body>

	<%@include file="AdminNavBar.jsp"%>

	<main>
		<div class="container mt-4">
			<h1 class="dashboard-title">EduAdmin</h1>

			<h3 class="mt-3 text-primary">Dashboard</h3>
			<hr>

			<!-- Statistics Section -->
			<div class="row text-center">
				<div class="col-lg-3 col-md-6">
					<div class="stats-box">
						<h2>280</h2>
						<p>Total Students</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="stats-box">
						<h2>30</h2>
						<p>Total Staff</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="stats-box">
						<h2>5</h2>
						<p>Accountant</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="stats-box">
						<h2>+</h2>
						<p>Add User</p>
					</div>
				</div>
			</div>
			<h3 class="mt-4">
				Attendance <span id="currentDate" class="text-muted"
					style="font-size: 18px;"></span>
			</h3>
			<script>
				// JavaScript to insert the current date
				document.getElementById("currentDate").textContent = new Date()
						.toLocaleDateString();
			</script>
			<br>
			<hr>

			<!-- Attendance Section -->
			<div class="attendance-container">
				<div class="attendance-table">
					<h4>Staffs</h4>
					<div class="grid">
						<div class="top"></div>
						<div class="top"></div>
						<div class="top"></div>
						<div class="top"></div>
						<div class="top"></div>
						<div class="top"></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
				<div class="attendance-table">
					<h4>Students</h4>
					<div class="grid">
						<div class="top"></div>
						<div class="top"></div>
						<div class="top"></div>
						<div class="top"></div>
						<div class="top"></div>
						<div class="top"></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
			</div>

			<h3 class="mt-4">Courses</h3>
			<hr>

			<!-- Courses Section -->
			<div class="courses">
				<ul>
					<li>FY CS 2028</li>
					<li>FY ENTC 2028</li>
					<li>FY CHEM 2028</li>
					<li>SY CS 2027</li>
					<li>SY MECH 2027</li>
					<li>SY ENTC 2027</li>
					<li>SY CHEM 2027</li>
					<li>TY CS 2026</li>
					<li>TY MECH 2026</li>
					<li>TY ENTC 2026</li>
					<li>TY CHEM 2026</li>
					<li>B.TECH CS 2025</li>
					<li>B.TECH MECH 2025</li>
					<li>B.TECH ENTC 2025</li>
					<li>B.TECH CHEM 2025</li>
					<li>FY MECH 2028</li>

				</ul>
			</div>

		</div>

	</main>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
