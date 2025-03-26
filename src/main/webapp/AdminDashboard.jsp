<%@page import="com.engisphere.dao.StaffDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@page import="com.engisphere.entity.StaffEntities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

.present {
	color: green;
}

.absent {
	color: red;
}

.clickable {
	cursor: pointer;
	text-decoration: underline;
	color: blue;
}

.hidden {
	display: none;
}
</style>
</head>
<body>
	<%@include file="AdminNavBar.jsp"%>

	<main>
		<div class="container mt-4">
			<h1 class="dashboard-title">EduAdmin Dashboard</h1>

			<h3 class="mt-3 text-primary">Overview</h3>
			<hr>

			<%
			StudentDao sdao = new StudentDao(DatabaseConnection.connect());
			int totalStudents = sdao.TotalStudents();
			StaffDao sdao1 = new StaffDao(DatabaseConnection.connect());
			int totalTeacher = sdao1.getTotalTeachers();
			int totalAccountant = sdao1.getTotalAccountant();
			int totalStaff = totalAccountant + totalTeacher;

			// Fetch attendance data
			String currentDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
			List<Map<String, String>> studentAttendance = sdao.getStudentAttendance(currentDate);
			List<Map<String, String>> staffAttendance = sdao1.getStaffAttendance(currentDate);

			int totalPresentStudents = 0;
			int totalAbsentStudents = 0;
			int totalPresentStaff = 0;
			int totalAbsentStaff = 0;

			for (Map<String, String> attendance : studentAttendance) {
				if ("Present".equals(attendance.get("status"))) {
					totalPresentStudents++;
				} else {
					totalAbsentStudents++;
				}
			}

			for (Map<String, String> attendance : staffAttendance) {
				if ("Present".equals(attendance.get("status"))) {
					totalPresentStaff++;
				} else {
					totalAbsentStaff++;
				}
			}
			%>


			<div class="row text-center">
				<div class="col-lg-3 col-md-6 mb-3">
					<div class="stats-box">
						<h2><%=totalStudents%></h2>
						<p>Total Students</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 mb-3">
					<div class="stats-box">
						<h2><%=totalTeacher%></h2>
						<p>Total Teachers</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 mb-3">
					<div class="stats-box">
						<h2><%=totalAccountant%></h2>
						<p>Accountants</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 mb-3">
					<div class="stats-box">
						<h2><%=totalStaff%></h2>
						<p>Total Staff</p>
					</div>
				</div>
			</div>

			<h3 class="mt-4">
				Attendance <span id="currentDate" class="text-muted"
					style="font-size: 18px;"></span>
			</h3>
			<script>
				// current date
				document.getElementById("currentDate").textContent = new Date()
						.toLocaleDateString();
			</script>
			<br>
			<hr>

			<!-- Mark Attendance Button -->
			<div class="text-end mb-4">
				<a href="markAttendance.jsp" class="btn btn-primary">Mark
					Attendance</a>
			</div>

			<!-- Attendance Section -->
			<div class="attendance-container">
				<!-- Staff Attendance -->
				<div class="attendance-table">
					<h4>Staff Attendance</h4>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Name</th>
								<th>Job Profession</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Map<String, String> attendance : staffAttendance) {
							%>
							<tr>
								<td><%=attendance.get("firstName")%> <%=attendance.get("lastName")%></td>
								<td><%=attendance.get("jobProfession")%></td>
								<td>
									<%
									if ("Present".equals(attendance.get("status"))) {
									%> <i class="fas fa-check-circle present"></i> <%
 } else {
 %> <i class="fas fa-times-circle absent"></i> <%
 }
 %>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>

				<!-- Student Attendance -->
				<div class="attendance-table">
					<h4>Student Attendance</h4>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Name</th>
								<th>Course</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Map<String, String> attendance : studentAttendance) {
							%>
							<tr>
								<td><%=attendance.get("firstName")%> <%=attendance.get("lastName")%></td>
								<td><%=attendance.get("course")%></td>
								<td>
									<%
									if ("Present".equals(attendance.get("status"))) {
									%> <i class="fas fa-check-circle present"></i> <%
 } else {
 %> <i class="fas fa-times-circle absent"></i> <%
 }
 %>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Total Present and Absent -->
			<div class="row mt-4">
				<div class="col-md-3">
					<div class="stats-box">
						<h2 class="present"><%=totalPresentStaff%></h2>
						<p>Present Staff</p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stats-box">
						<h2 class="absent"><%=totalAbsentStaff%></h2>
						<p>Absent Staff</p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stats-box">
						<h2 class="present"><%=totalPresentStudents%></h2>
						<p>Present Students</p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stats-box">
						<h2 class="absent"><%=totalAbsentStudents%></h2>
						<p>Absent Students</p>
					</div>
				</div>
			</div>


			<%
			// Fetch student and staff data from database
			StudentDao sdao3 = new StudentDao(DatabaseConnection.connect());
			List<StudentsEntities> studentsList = sdao3.getAllStudent();

			StaffDao sdao2 = new StaffDao(DatabaseConnection.connect());
			List<StaffEntities> staffList = sdao2.getAllStaff();
			%>

			<div class="container mt-4">
				<!-- Button Group for Toggling Tables -->
				<div class="d-flex justify-content-center gap-3 mb-4">
					<button class="btn btn-primary"
						onclick="toggleTable('studentCard')">Display Students</button>
					<button class="btn btn-primary" onclick="toggleTable('staffCard')">Display
						Staff</button>
				</div>

				<div class="row">
					<!-- Student Table Card -->
					<div class="col-md-6">
						<div id="studentCard" class="card shadow-lg p-3 d-none">
							<div class="text-center" style="color: #0056b3">
								<h5>Student Table</h5>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table
										class="table table-striped table-hover table-bordered text-center align-middle">
										<thead class="table-dark">
											<tr>
												<th>Full Name</th>
												<th>Course</th>
											</tr>
										</thead>
										<tbody>
											<%
											for (StudentsEntities student : studentsList) {
											%>
											<tr>
												<td><a
													href="StudentDetailsController?id=<%=student.getId()%>"
													class="text-primary fw-bold"> <%=student.getFirstName()%>
														<%=student.getLastName()%>
												</a></td>
												<td><%=student.getCourse()%></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- Staff Table Card -->
					<div class="col-md-6">
						<div id="staffCard" class="card shadow-lg p-3 d-none">
							<div class="text-center" style="color: #0056b3">
								<h5>Staff Table</h5>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table
										class="table table-striped table-hover table-bordered text-center align-middle">
										<thead class="table-dark">
											<tr>
												<th>Full Name</th>
												<th>Job Profession</th>
											</tr>
										</thead>
										<tbody>
											<%
											for (StaffEntities staff : staffList) {
											%>
											<tr>
												<td><a
													href="ViewTeacherController?id=<%=staff.getId()%>"
													class="text-primary fw-bold"> <%=staff.getFirstName()%>
														<%=staff.getLastName()%>
												</a></td>
												<td><%=staff.getJobProfession()%></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<script>
				function toggleTable(tableId) {
					let table = document.getElementById(tableId);
					table.classList.toggle("d-none"); // Toggle visibility using Bootstrap's d-none class
				}
			</script>

			<!-- Courses Section -->
			<div class="courses mt-4">
				<h3>Courses</h3>
				<hr>
				<ul class="list-unstyled">
					<li><a
						href="https://www.shiksha.com/college/sinhgad-college-of-engineering-vadgaon-budruk-pune-52071/course-b-e-in-computer-engineering-278764">B.E.
							in Computer Engineering </a></li>
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

</body>
</html>