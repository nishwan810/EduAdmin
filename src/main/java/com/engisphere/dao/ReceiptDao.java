package com.engisphere.dao;

import com.engisphere.entity.ReceiptEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReceiptDao {
    private Connection conn;

    public ReceiptDao(Connection conn) {
        this.conn = conn;
    }

    public boolean issueReceipt(ReceiptEntity receipt) {
        String sql = "INSERT INTO receipts (student_id, amount, payment_mode, receipt_date) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, receipt.getStudentId());
            ps.setBigDecimal(2, receipt.getAmount());
            ps.setString(3, receipt.getPaymentMode());
            ps.setTimestamp(4, new java.sql.Timestamp(receipt.getReceiptDate().getTime()));

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
