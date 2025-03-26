package com.engisphere.controller;

import com.engisphere.dao.DatabaseConnection;
import com.engisphere.dao.ExpenseDao;
import com.engisphere.entity.ExpenseEntity;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ExpenseController")
public class ExpenseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DatabaseConnection.connect()) {
            ExpenseDao expenseDao = new ExpenseDao(conn);
            String action = request.getParameter("action");

            if ("add".equalsIgnoreCase(action)) {
                String expenseName = request.getParameter("expenseName");
                String amountStr = request.getParameter("amount");
                String category = request.getParameter("category");
                String dateStr = request.getParameter("expenseDate");

                // Validate input
                if (expenseName == null || amountStr == null || category == null || dateStr == null ||
                    expenseName.trim().isEmpty() || amountStr.trim().isEmpty() || category.trim().isEmpty() || dateStr.trim().isEmpty()) {
                    response.sendRedirect("ExpenseManagement.jsp?error=Invalid Input");
                    return;
                }

                BigDecimal amount;
                try {
                    amount = new BigDecimal(amountStr);
                } catch (NumberFormatException e) {
                    response.sendRedirect("ExpenseManagement.jsp?error=Invalid Amount");
                    return;
                }

                Date expenseDate;
                try {
                    expenseDate = java.sql.Date.valueOf(dateStr);
                } catch (IllegalArgumentException e) {
                    response.sendRedirect("ExpenseManagement.jsp?error=Invalid Date Format");
                    return;
                }

                ExpenseEntity expense = new ExpenseEntity();
                expense.setExpenseName(expenseName);
                expense.setAmount(amount);
                expense.setExpenseDate(expenseDate);
                expense.setCategory(category);

                boolean added = expenseDao.addExpense(expense);
                response.sendRedirect("ExpenseManagement.jsp?success=" + (added ? "added" : "failed"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ExpenseManagement.jsp?error=Something went wrong");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DatabaseConnection.connect()) {
            ExpenseDao expenseDao = new ExpenseDao(conn);
            String action = request.getParameter("action");

            if ("delete".equalsIgnoreCase(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean success = expenseDao.deleteExpense(id);
                response.sendRedirect("ExpenseManagement.jsp?success=" + (success ? "deleted" : "delete_failed"));
                return;
            }

            List<ExpenseEntity> expenseList = expenseDao.getAllExpenses();
            request.setAttribute("expenseList", expenseList);
            request.getRequestDispatcher("ExpenseManagement.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ExpenseManagement.jsp?error=Unable to load expenses");
        }
    }
}
