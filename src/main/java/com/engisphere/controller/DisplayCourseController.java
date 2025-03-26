package com.engisphere.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.StaffDao;
import com.engisphere.dao.courseDao;
import com.engisphere.entity.StaffEntities;
import com.engisphere.entity.course;

/**
 * Servlet implementation class DisplayCourseController
 */
@WebServlet("/DisplayCourseController")
public class DisplayCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		 courseDao dao = new courseDao(DatabaseConnection.connect());

	        List<course> courseList = dao.getallCourses();
	        request.setAttribute("courseList", courseList);
	        request.getRequestDispatcher("TeacherDashboard.jsp").forward(request, response);
	}

}
