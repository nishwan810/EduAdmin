package com.engisphere.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.NotificationDao;

@WebServlet("/SendNotificationServlet")
public class SendNotificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");
        String userType = request.getParameter("userType");

        NotificationDao dao = new NotificationDao(DatabaseConnection.connect());

        boolean isSent = dao.saveNotification(message, userType);

        if (isSent) {
            response.sendRedirect("SendNotification.jsp?success=Notification sent successfully!");
        } else {
            response.sendRedirect("SendNotification.jsp?error=Failed to send notification.");
        }
    }
}
