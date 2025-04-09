package com.engisphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.engisphere.entity.NotificationEntity;

public class NotificationDao {
    private Connection conn;

    public NotificationDao(Connection conn) {
        this.conn = conn;
    }

    // Insert notification
    public boolean saveNotification(String message, String userType) {
        boolean success = false;
        try {
            String query = "INSERT INTO notifications (message, user_type) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, message);
            pstmt.setString(2, userType);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // Retrieve all notifications
    public List<NotificationEntity> getNotifications(String userType) {
        List<NotificationEntity> notificationList = new ArrayList<>();
        try {
            String query = "SELECT * FROM notifications WHERE user_type = ? OR user_type = 'all' ORDER BY created_at DESC";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userType);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                NotificationEntity notification = new NotificationEntity();
                notification.setId(rs.getInt("id"));
                notification.setMessage(rs.getString("message"));
                notification.setUserType(rs.getString("user_type"));
                notification.setCreatedAt(rs.getTimestamp("created_at"));
                notificationList.add(notification);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notificationList;
    }
    
    public List<NotificationEntity> getAllNotifications() {
        List<NotificationEntity> notificationList = new ArrayList<>();
        try {
            String query = "SELECT * FROM notifications ORDER BY created_at DESC";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                NotificationEntity notification = new NotificationEntity();
                notification.setId(rs.getInt("id"));
                notification.setMessage(rs.getString("message"));
                notification.setUserType(rs.getString("user_type"));
                notification.setCreatedAt(rs.getTimestamp("created_at"));
                notificationList.add(notification);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notificationList;
    }

}
