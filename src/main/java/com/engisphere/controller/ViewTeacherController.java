package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.StaffDao;
import com.engisphere.entity.StaffEntities;

@WebServlet("/ViewTeacherController")
public class ViewTeacherController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        StaffDao dao = new StaffDao(DatabaseConnection.connect());
        StaffEntities teacher = dao.getStaffById(id);
        
        if (teacher != null) {
            request.setAttribute("teacher", teacher);
            request.getRequestDispatcher("StaffDetails.jsp").forward(request, response);
        } else {
            response.sendRedirect("DisplayStaff.jsp"); // Redirect if no teacher found
        }
    }
}
