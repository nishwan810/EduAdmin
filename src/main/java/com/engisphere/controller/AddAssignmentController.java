package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.assignmentDao;
import com.engisphere.dao.courseDao;
import com.engisphere.entity.assignment;
import com.engisphere.entity.course;

/**
 * Servlet implementation class AddAssignmentController
 */
@WebServlet("/AddAssignmentController")
public class AddAssignmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 HttpSession session = request.getSession();
 
 
// Integer courseId = (Integer) session.getAttribute("storedCourseId");
 
// if (courseId == null) {
//     response.getWriter().println("Error: Course ID is missing.");
//     return;
// }
		 
		 String id = request.getParameter("id");
		 
		 
		  session.setAttribute("id", id);
	        String title = request.getParameter("title");
	        String description = request.getParameter("description");
	        String dueDateTime = request.getParameter("dueDateTime");
	        
	        assignment a1 = new assignment(id,title, description,dueDateTime); 
	        assignmentDao aDao = new assignmentDao(DatabaseConnection.connect());
	        
	        boolean status =  aDao.addassignment(a1);
	        
	        System.out.println("Status"+status);
//	        course c1 = new course(courseCode, title,description,dueDateTime );
//	        courseDao cDao = new courseDao(DatabaseConnection.connect());
//	        boolean status = cDao.addCourse(c1);
//	        
	        if (status) {
	            System.out.println("Course successfully added.");
	            session.setAttribute("Assignment", "Assignment Added Successfully!, Add Another Assignment ");
//	            session.setAttribute("id", id);
	        } else {
	            System.out.println("Error: Unable to add assignment."+ a1);
	            session.setAttribute("error", "Error adding Assignment. Please try again.");
//	            session.setAttribute("id", id);
	        }
//	
		
		
	        // Redirect back to the form page
	        response.sendRedirect("AddAssignment.jsp");
	}
	}

 
