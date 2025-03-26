package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.SubmitAssignDao;
import com.engisphere.dao.assignmentDao;
import com.engisphere.entity.SubmitAssign;
import com.engisphere.entity.assignment;
import com.mysql.cj.Session;

/**
 * Servlet implementation class SubmitAssignController
 */
@WebServlet("/SubmitAssignController")
public class SubmitAssignController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		 HttpSession session = request.getSession();
		 
		 
		 
		  
	        String assignid = request.getParameter("assignid");
	        String Assignmentlink = request.getParameter("Assignmentlink");
	        
	        
	        	SubmitAssign s1 = new SubmitAssign(assignid, Assignmentlink);
	        	
	        	SubmitAssignDao sDao = new SubmitAssignDao(DatabaseConnection.connect());
	        	
//	        assignment a1 = new assignment(id,title, description,dueDateTime); 
//	        assignmentDao aDao = new assignmentDao(DatabaseConnection.connect());
	        
	        boolean status =  sDao.submitAssignment(s1);
	        
	        System.out.println("Status"+status);
//	        course c1 = new course(courseCode, title,description,dueDateTime );
//	        courseDao cDao = new courseDao(DatabaseConnection.connect());
//	        boolean status = cDao.addCourse(c1);
//	        
	        if (status) {
	            System.out.println("Course successfully added.");
	           
	            session.setAttribute("submitassign", "Assignment Submitted Successfully! ");
//	            session.setAttribute("id", id);
	        } else {
	            System.out.println("Error: Unable to add assignment."+ s1);
          session.setAttribute("error", "Error Submitting Assignment. Please try again.");
//	            session.setAttribute("id", id);
	        }
//	
		
		
	        // Redirect back to the form page
	        response.sendRedirect("StudentDisplaycourse.jsp");
		
		
		
		
	}

}
