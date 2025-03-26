package com.engisphere.entity;

import java.sql.Timestamp;

public class NotificationEntity {
    private int id;
    private String message;
    private String userType;
    private Timestamp createdAt;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getUserType() { return userType; }
    public void setUserType(String userType) { this.userType = userType; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
