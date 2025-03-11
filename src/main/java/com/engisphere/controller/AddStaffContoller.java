package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.StaffDao;
import com.engisphere.entity.StaffEntities;


@WebServlet("/AddStaffController")
public class AddStaffContoller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String joiningDate = request.getParameter("joiningDate");
        String jobProfession = request.getParameter("course"); // Changed name for clarity
        String salary = request.getParameter("salary");
        String work = request.getParameter("work");

        System.out.println("In do psot method Add Staff Controller");
        // Validation check
        if (firstName == null || lastName == null || contact == null || address == null || email == null ||
                password == null || joiningDate == null || jobProfession == null || salary == null || work == null ||
                firstName.trim().isEmpty() || lastName.trim().isEmpty() || contact.trim().isEmpty() ||
                address.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty() ||
                joiningDate.trim().isEmpty() || jobProfession.trim().isEmpty() || salary.trim().isEmpty() ||
                work.trim().isEmpty()) {
            System.out.println("Validation Failed: Some fields are empty.");
            session.setAttribute("error", "All fields are required!");
            response.sendRedirect("AddStaff.jsp");
            return;
        }

        // Create Staff Entity
        StaffEntities staff = new StaffEntities(firstName, lastName, contact, address, email, password, joiningDate, jobProfession, salary, work);

        try {
        	  System.out.println("In do psot method Add Staff Controller __>in try addStaff Colled");
            StaffDao staffDao = new StaffDao(DatabaseConnection.connect());
            boolean status = staffDao.addStaff(staff);

            if (status) {
                System.out.println("Staff successfully added.");
                session.setAttribute("success", "Staff Added Successfully!");
            } else {
                System.out.println("Error: Unable to add staff.");
                session.setAttribute("error", "Error adding Staff. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Database connection failed!");
        }

        // Redirect back to the form page
        response.sendRedirect("AddStaff.jsp");
    }
}
