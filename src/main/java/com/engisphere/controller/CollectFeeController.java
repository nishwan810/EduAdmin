package com.engisphere.controller;

import com.engisphere.dao.FeeDao;
import com.engisphere.entity.FeeEntity;
import com.engisphere.dao.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CollectFeeController")
public class CollectFeeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get database connection
            Connection conn = DatabaseConnection.connect();
            FeeDao feeDao = new FeeDao(conn);

            // Get form data from CollectFee.jsp
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String paymentMode = request.getParameter("paymentMode");
            String receiptNumber = request.getParameter("receiptNumber");

            // Create FeeEntity object
            FeeEntity fee = new FeeEntity();
            fee.setStudentId(studentId);
            fee.setAmount(amount);
            fee.setPaymentMode(paymentMode);
            fee.setReceiptNumber(receiptNumber);
            fee.setPaymentDate(new Date()); // Current date

            // Save fee details in the database
            boolean success = feeDao.collectFee(fee);

            // Redirect based on success
            if (success) {
                response.sendRedirect("CollectFee.jsp?status=success");
            } else {
                response.sendRedirect("CollectFee.jsp?status=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("CollectFee.jsp?status=error");
        }
    }
}
