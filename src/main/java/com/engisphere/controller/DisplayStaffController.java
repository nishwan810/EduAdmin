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
import com.engisphere.entity.StaffEntities;


@WebServlet("/DisplayStaffController")
public class DisplayStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 StaffDao dao = new StaffDao(DatabaseConnection.connect());

	        List<StaffEntities> staffList = dao.getAllStaff();
	        request.setAttribute("staffList", staffList);
	        request.getRequestDispatcher("displayStaff.jsp").forward(request, response);
	}


}
