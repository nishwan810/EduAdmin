<%@page import="com.engisphere.dao.StaffDao"%>
<%@page import="com.engisphere.dao.StudentDao"%>
<%@page import="com.engisphere.dao.DatabaseConnection"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Attendance</title>
</head>
<body>
	<%
	String currentDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	StaffDao staffDao = new StaffDao(DatabaseConnection.connect());
	StudentDao studentDao = new StudentDao(DatabaseConnection.connect());

	// Process staff attendance
	Enumeration<String> parameterNames = request.getParameterNames();
	while (parameterNames.hasMoreElements()) {
		String paramName = parameterNames.nextElement();
		if (paramName.startsWith("staff_")) {
			int staffId = Integer.parseInt(paramName.split("_")[1]);
			String status = request.getParameter(paramName);
			staffDao.markStaffAttendance(staffId, currentDate, status);
		}
	}

	// Process student attendance
	parameterNames = request.getParameterNames();
	while (parameterNames.hasMoreElements()) {
		String paramName = parameterNames.nextElement();
		if (paramName.startsWith("student_")) {
			int studentId = Integer.parseInt(paramName.split("_")[1]);
			String status = request.getParameter(paramName);
			studentDao.markStudentAttendance(studentId, currentDate, status);
		}
	}

	response.sendRedirect("AdminDashboard.jsp");
	%>
</body>
</html>