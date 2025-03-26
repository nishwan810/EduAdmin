package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.StudentDao;
import com.engisphere.dao.courseDao;
import com.engisphere.entity.course;

/**
 * Servlet implementation class AddCourseController
 */
@WebServlet("/AddCourseController")
public class AddCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseController() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession();
		 
		 String courseCode = request.getParameter("courseCode");
		 session.setAttribute("id", courseCode);
	        String courseName = request.getParameter("courseName");
	        String syllabus = request.getParameter("syllabus");
	        
	        
	        course c1 = new course(courseCode, courseName, syllabus);
	        courseDao cDao = new courseDao(DatabaseConnection.connect());
	        boolean status = cDao.addCourse(c1);
	        
	        if (status) {
	            System.out.println("Course successfully added.");
	            session.setAttribute("Course", "Student Added Successfully!");
	            session.setAttribute("id", courseCode);
	        } else {
	            System.out.println("Error: Unable to add Course.");
	            session.setAttribute("error", "Error adding Course. Please try again.");
	        }
	
		
		
	        // Redirect back to the form page
	        response.sendRedirect("TeacherDashboard.jsp");
	}

}
