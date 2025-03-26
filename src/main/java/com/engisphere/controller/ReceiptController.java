package com.engisphere.controller;

import com.engisphere.dao.ReceiptDao;
import com.engisphere.dao.DatabaseConnection;
import com.engisphere.entity.ReceiptEntity;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReceiptController")
public class ReceiptController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DatabaseConnection.connect()) {
            ReceiptDao receiptDao = new ReceiptDao(conn);

            int studentId = Integer.parseInt(request.getParameter("studentId"));
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            String paymentMode = request.getParameter("paymentMode");

            ReceiptEntity receipt = new ReceiptEntity(studentId, amount, paymentMode, new Date());
            boolean success = receiptDao.issueReceipt(receipt);

            if (success) {
                response.sendRedirect("IssueReceipt.jsp?success=true");
            } else {
                response.sendRedirect("IssueReceipt.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("IssueReceipt.jsp?error=true");
        }
    }
}
