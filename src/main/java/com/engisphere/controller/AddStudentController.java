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
import com.engisphere.entity.StudentsEntities;

@WebServlet("/AddStudentController")
public class AddStudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String joiningDate = request.getParameter("joiningDate");
        String course = request.getParameter("course");

        // Debugging logs
        System.out.println("firstName=" + firstName + ", lastName=" + lastName + ", contact="
                + contact + ", address=" + address + ", email=" + email + ", password=" + password + ", joiningDate="
                + joiningDate + ", course=" + course);

        // Validation: Ensure no empty fields
        if (firstName.isEmpty() || lastName.isEmpty() || contact.isEmpty() || address.isEmpty() ||
            email.isEmpty() || password.isEmpty() || joiningDate.isEmpty() || course.isEmpty()) {
            	
            System.out.println("In AddStudentController --> Validation Failed: Some fields are empty.");
            session.setAttribute("error", "All fields are required!");
            response.sendRedirect("AddStudent.jsp");
            return;
           
        }

        // Create Student Entity
        StudentsEntities s1 = new StudentsEntities(firstName, lastName, contact, address, email, password, joiningDate, course);
        StudentDao sdao = new StudentDao(DatabaseConnection.connect());
        boolean status = sdao.addStudent(s1);

        if (status) {
            System.out.println("Student successfully added.");
            session.setAttribute("success", "Student Added Successfully!");
        } else {
            System.out.println("Error: Unable to add student.");
            session.setAttribute("error", "Error adding student. Please try again.");
        }

        // Redirect back to the form page
        response.sendRedirect("AddStudent.jsp");
        
        
    }

}
