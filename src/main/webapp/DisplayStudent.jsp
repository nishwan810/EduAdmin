<%@page import="com.engisphere.entity.StudentsEntities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Table</title>
<%@include file="bootstrapSupport.jsp"%>
<style>
.navbar {
	padding: 15px 30px;
}

.navbar-nav {
	margin-left: 20px;
}

.navbar-brand {
	font-size: 22px;
	font-weight: bold;
	margin-left: 15px;
}

.navbar .form-inline {
	margin-left: auto;
}

.search-box {
	width: 280px;
	margin-right: 10px;
}

.container {
	margin-top: 30px;
}

.table-container {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
}

.table th, .table td {
	vertical-align: middle; /* Center content vertically */
}
</style>
</head>
<body>
	<%@include file="AdminNavBar.jsp"%>
	<div class="container">
		<div class="table-container mt-3 p-3 border rounded">
			<div class="d-flex justify-content-end mb-3">
				<input type="text" class="form-control search-box"
					placeholder="Search">
				<button type="button" class="btn btn-primary btn-sm mx-3">Search
					Student</button>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered table-striped">
					<thead class="thead-light">
						<tr>
							<th scope="col">SR No</th>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Contact</th>
							<th scope="col">Address</th>
							<th scope="col">Gmail</th>
							<th scope="col">Password</th>
							<th scope="col">Joining Date</th>
							<th scope="col">Course</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<%--  <tbody>
                        <%
                        StudentDao sdao = new StudentDao(DatabaseConnection.connect());
                        ArrayList<StudentsEntities> studentList = sdao.getAllStudent();
                        for (StudentsEntities s : studentList) {
                        %>
                        <tr>
                            <td scope="row"><%=s.getId()%></td>
                            <td><%=s.getFirstName()%></td>
                            <td><%=s.getLastName()%></td>
                            <td><%=s.getContact()%></td>
                            <td><%=s.getAddress()%></td>
                            <td><%=s.getEmail()%></td>
                            <td><%=s.getPassword()%></td>
                            <td><%=s.getJoiningDate()%></td>
                            <td><%=s.getCourse()%></td>
                            <td>
                                <a href="EditStudent.jsp?id=<%=s.getId() %>" class="btn btn-sm btn-outline-primary">Edit</a>
                                <a href="DeleteStudentController?id=<%= s.getId() %>" class="btn btn-sm btn-outline-danger">Delete</a>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody> --%>

					<tbody>
						<%
						StudentDao sdao = new StudentDao(DatabaseConnection.connect());
						ArrayList<StudentsEntities> studentList = sdao.getAllStudent();
						for (StudentsEntities s : studentList) {
						%>
						<tr>
							<td scope="row"><%=s.getId()%></td>
							<td><a
								href="<%=request.getContextPath()%>/StudentDetailsController?id=<%=s.getId()%>"
								class="text-primary"> <%=s.getFirstName()%>
							</a></td>
							<td><%=s.getLastName()%></td>
							<td><%=s.getContact()%></td>
							<td><%=s.getAddress()%></td>
							<td><%=s.getEmail()%></td>
							<td><%=s.getPassword()%></td>
							<td><%=s.getJoiningDate()%></td>
							<td><%=s.getCourse()%></td>
							<td><a href="EditStudent.jsp?id=<%=s.getId()%>"
								class="btn btn-sm btn-outline-primary">Edit</a> <a
								href="DeleteStudentController?id=<%=s.getId()%>"
								class="btn btn-sm btn-outline-danger">Delete</a></td>
						</tr>
						<%
						}
						%>
					</tbody>

				</table>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<div class="mt-3 p-3">
			<button type="button" class="btn btn-danger">Delete Table</button>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>