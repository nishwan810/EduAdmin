package com.engisphere.dao;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.engisphere.entity.FeeEntity;

public class FeeDao {
    private Connection conn;

    public FeeDao(Connection conn) {
        this.conn = conn;
    }

    // Insert Fee Record
    public boolean collectFee(FeeEntity fee) {
        boolean success = false;
        try {
            String sql = "INSERT INTO fee_records (student_id, amount, payment_mode, receipt_number) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, fee.getStudentId());
            ps.setBigDecimal(2, fee.getAmount());
            ps.setString(3, fee.getPaymentMode());
            ps.setString(4, fee.getReceiptNumber());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // Get all fee records
    public List<FeeEntity> getAllFees() {
        List<FeeEntity> feeList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM fee_records";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FeeEntity fee = new FeeEntity();
                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setAmount(rs.getBigDecimal("amount"));
                fee.setPaymentMode(rs.getString("payment_mode"));
                fee.setReceiptNumber(rs.getString("receipt_number"));
                fee.setPaymentDate(rs.getTimestamp("payment_date"));
                feeList.add(fee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feeList;
    }

    // Get fee record by student ID
    public List<FeeEntity> getFeesByStudentId(int studentId) {
        List<FeeEntity> feeList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM fee_records WHERE student_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FeeEntity fee = new FeeEntity();
                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setAmount(rs.getBigDecimal("amount"));
                fee.setPaymentMode(rs.getString("payment_mode"));
                fee.setReceiptNumber(rs.getString("receipt_number"));
                fee.setPaymentDate(rs.getTimestamp("payment_date"));
                feeList.add(fee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feeList;
    }
    
 // FeeDao.java
//    public BigDecimal getTotalCollectedFees() throws SQLException {
//        String query = "SELECT SUM(amount) FROM fees WHERE status = 'Paid'";
//        PreparedStatement ps = conn.prepareStatement(query);
//        ResultSet rs = ps.executeQuery();
//        return rs.next() ? rs.getBigDecimal(1) : BigDecimal.ZERO;
//    }

    public BigDecimal getTotalPendingFees() throws SQLException {
        String query = "SELECT SUM(amount) FROM fees WHERE status = 'Pending'";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        return rs.next() ? rs.getBigDecimal(1) : BigDecimal.ZERO;
    }

    public List<FeeEntity> getRecentFeeTransactions() throws SQLException {
        List<FeeEntity> transactions = new ArrayList<>();
        String query = "SELECT * FROM fees ORDER BY date DESC LIMIT 5"; // Fetch the last 5 transactions
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            FeeEntity fee = new FeeEntity();
            fee.setStudentId(rs.getInt("student_id"));
            fee.setAmount(rs.getBigDecimal("amount"));
            fee.setPaymentDate(rs.getDate(0));
            transactions.add(fee);
        }
        return transactions;
    } 
    
    public BigDecimal getTotalCollectedFees() {
        BigDecimal totalFees = BigDecimal.ZERO;
        String query = "SELECT SUM(amount) FROM fee_records";  // Ensure table name is correct

        try (PreparedStatement pst = conn.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                totalFees = rs.getBigDecimal(1);
                if (totalFees == null) {
                    totalFees = BigDecimal.ZERO;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalFees;
    }


}
