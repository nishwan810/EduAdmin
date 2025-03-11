package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.StudentDao;


@WebServlet("/DeleteStudentController")
public class DeleteStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
		int id = (idParam != null && !idParam.isEmpty()) ? Integer.parseInt(idParam) : 0;

		if (id <= 0) {
			response.sendRedirect("DisplayStudent.jsp?error=invalid_id");
			return;
		}

		StudentDao sdao = new StudentDao(DatabaseConnection.connect());
		boolean status = sdao.DeleteStudentById(id);

		if (status) {
			response.sendRedirect("DisplayStudent.jsp?delete=success");
		} else {
			response.sendRedirect("DisplayStudent.jsp?error=delete_failed");
		}

	}



}
