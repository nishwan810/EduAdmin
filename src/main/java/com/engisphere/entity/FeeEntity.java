package com.engisphere.entity;

import java.math.BigDecimal;
import java.util.Date;

public class FeeEntity {
    private int id;
    private int studentId;
    private BigDecimal amount;
    private String paymentMode;
    private String receiptNumber;
    private Date paymentDate;

    // Constructor
    public FeeEntity() {}

    public FeeEntity(int id, int studentId, BigDecimal amount, String paymentMode, String receiptNumber, Date paymentDate) {
        this.id = id;
        this.studentId = studentId;
        this.amount = amount;
        this.paymentMode = paymentMode;
        this.receiptNumber = receiptNumber;
        this.paymentDate = paymentDate;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
    // Overloaded method to accept double
    public void setAmount(double amount) {
        this.amount = BigDecimal.valueOf(amount);
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public String getReceiptNumber() {
        return receiptNumber;
    }

    public void setReceiptNumber(String receiptNumber) {
        this.receiptNumber = receiptNumber;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }
}
