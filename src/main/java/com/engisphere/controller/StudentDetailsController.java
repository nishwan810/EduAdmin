package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.engisphere.dao.StudentDao;
import com.engisphere.dao.DatabaseConnection;
import com.engisphere.entity.StudentsEntities;

@WebServlet("/StudentDetailsController")
public class StudentDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            StudentDao studentDao = new StudentDao(DatabaseConnection.connect());
            StudentsEntities student = studentDao.getStudentById(id);

            if (student != null) {
                request.setAttribute("student", student);
                request.getRequestDispatcher("StudentDetails.jsp").forward(request, response);
            } else {
                response.sendRedirect("StudentTable.jsp?error=StudentNotFound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("StudentTable.jsp?error=InvalidRequest");
        }
    }
}
