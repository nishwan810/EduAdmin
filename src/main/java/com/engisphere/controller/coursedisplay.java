package com.engisphere.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.StudentDao;
import com.engisphere.dao.courseDao;
import com.engisphere.entity.StudentsEntities;
import com.engisphere.entity.course;

/**
 * Servlet implementation class coursedisplay
 */
@WebServlet("/coursedisplay")
public class coursedisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 int Id = Integer.parseInt(request.getParameter("id"));

	        courseDao courseDao = new courseDao(DatabaseConnection.connect());
	        course course1 = courseDao.getCourseById(Id);

	        request.setAttribute("course", course1);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("CourseDisplay.jsp");
	        dispatcher.forward(request, response);
		
		
	}
}
