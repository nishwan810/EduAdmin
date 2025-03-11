package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.StudentDao;
import com.engisphere.entity.StudentsEntities;

@WebServlet("/EditStudentController")
public class EditStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));	
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String joiningDate = request.getParameter("joiningDate");
		String course = request.getParameter("course");

		// Validate data before updating
		if (id > 0) {
			StudentsEntities s1 = new StudentsEntities(id, firstName, lastName, contact, address, email, password, joiningDate, course);
			StudentDao sdao = new StudentDao(DatabaseConnection.connect());
			System.out.println("do post ---> EditStudentControl ----> ");
			System.out.println("UpdateOneStudent() call-->" + s1);
			boolean status = sdao.UpdateOneStudent(s1);	
			

			if (status) {
				response.sendRedirect("DisplayStudent.jsp?update=success");
			} else {
				response.sendRedirect("EditStudent.jsp?id=" + id + "&error=update_failed");
			}
		} else {
			response.sendRedirect("EditStudent.jsp?id=" + id + "&error=invalid_data");
		}
	}
}