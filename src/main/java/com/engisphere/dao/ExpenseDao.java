package com.engisphere.dao;

import com.engisphere.entity.ExpenseEntity;
import com.engisphere.entity.FeeEntity;

import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDao {
    private Connection conn;

    public ExpenseDao(Connection conn) {
        this.conn = conn;
    }

    // Add Expense
    public boolean addExpense(ExpenseEntity expense) {
        String sql = "INSERT INTO engisphere.expenses (expense_name, amount, category, expense_date) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, expense.getExpenseName());
            stmt.setBigDecimal(2, expense.getAmount());  // Corrected to use BigDecimal
            stmt.setString(3, expense.getCategory());
            stmt.setDate(4, new java.sql.Date(expense.getExpenseDate().getTime()));

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieve all expenses
    public List<ExpenseEntity> getAllExpenses() {
        List<ExpenseEntity> expenses = new ArrayList<>();
        String sql = "SELECT id, expense_name, amount, category, expense_date FROM engisphere.expenses";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                ExpenseEntity expense = new ExpenseEntity(
                    rs.getInt("id"),
                    rs.getString("expense_name"),
                    rs.getBigDecimal("amount"),
                    rs.getString("category"),
                    rs.getDate("expense_date")
                );
                expenses.add(expense);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return expenses;
    }

    // Get total expenses
    public BigDecimal getTotalExpenses() {
        String sql = "SELECT SUM(amount) FROM engisphere.expenses";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getBigDecimal(1) != null ? rs.getBigDecimal(1) : BigDecimal.ZERO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return BigDecimal.ZERO;
    }

    // Delete expense
    public boolean deleteExpense(int id) {
        boolean rowDeleted = false;
        String query = "DELETE FROM engisphere.expenses WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            int rowsAffected = stmt.executeUpdate();
            rowDeleted = rowsAffected > 0;
            System.out.println("Rows deleted: " + rowsAffected); // Debugging
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
 // ExpenseDao.java
    public BigDecimal bigDecimal() throws SQLException {
        String query = "SELECT SUM(amount) FROM expenses";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        return rs.next() ? (BigDecimal) rs.getBigDecimal(1) : BigDecimal.ZERO;
    }

    public List<ExpenseEntity> getRecentExpenses() throws SQLException {
        List<ExpenseEntity> expenses = new ArrayList<>();
        String query = "SELECT * FROM expenses ORDER BY date DESC LIMIT 5"; // Fetch the last 5 expenses
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            ExpenseEntity expense = new ExpenseEntity();
            expense.setId(rs.getInt("id"));
            expense.setAmount(rs.getBigDecimal("amount"));
            expense.setCategory(rs.getString("category"));
            expense.setExpenseDate(rs.getDate("date"));
            expenses.add(expense);
        }
        return expenses;
    }




}
