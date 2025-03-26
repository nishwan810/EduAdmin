package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginValidateServlet
 */
@WebServlet("/LoginValidateServlet")
public class LoginValidateServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        String loginName = request.getParameter("loginName");
	        String password = request.getParameter("password");
	        String userType = request.getParameter("userType");
	        
	        System.out.println("Login Name : " + loginName +" Password is : "   + password  + " UserTYpe is : "  +userType);
	        
	        if (loginName.equals("Admin") && password.equals("p") && userType.equals("Admin")) {
	        	response.sendRedirect("AdminDashboard.jsp");
	        } else if (loginName.equals("Teacher") && password.equals("p") && userType.equals("Teacher")) {
	        	response.sendRedirect("TeacherDashboard.jsp");
	        } else if (loginName.equals("Student") && password.equals("p") && userType.equals("Student")) {
	        	response.sendRedirect("StudentDashboard.jsp");
	        }else if (loginName.equals("Accountant") && password.equals("p") && userType.equals("Accountant")) {
	        	response.sendRedirect("AccountantDashboard.jsp");
	        }else {
	        	// If login fails, redirect to login page with an error message
	        	request.setAttribute("errorMessage", "Invalid credentials! Please try again.");
	        	request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
	        }

	        
	        

//	        try {
//	            // Establish database connection
//	            Connection conn = DatabaseConnection.getConnection();
//
//	            // SQL query to check if the user exists
//	            String sql = "SELECT * FROM users WHERE loginName = ? AND password = ? AND userType = ?";
//	            PreparedStatement ps = conn.prepareStatement(sql);
//	            ps.setString(1, loginName);
//	            ps.setString(2, password);
//	            ps.setString(3, userType);
//
//	            ResultSet rs = ps.executeQuery();
//
//	            if (rs.next()) {
//	                // Start a session and store user details
//	                HttpSession session = request.getSession();
//	                session.setAttribute("user", loginName);
//	                session.setAttribute("userType", userType);
//
//	                // Redirect based on user type
//	                if (userType.equals("Admin")) {
//	                    response.sendRedirect("AdminDashboard.jsp");
//	                } else if (userType.equals("Teacher")) {
//	                    response.sendRedirect("TeacherDashboard.jsp");
//	                } else if (userType.equals("Student")) {
//	                    response.sendRedirect("StudentDashboard.jsp");
//	                }
//	            } else {
//	                // If login fails, redirect to login page with an error message
//	                request.setAttribute("errorMessage", "Invalid credentials! Please try again.");
//	                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
//	            }
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	            response.sendRedirect("error.jsp");
//	        }
	    }

}
