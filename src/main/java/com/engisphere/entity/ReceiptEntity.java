package com.engisphere.entity;

import java.math.BigDecimal;
import java.util.Date;

public class ReceiptEntity {
    private int studentId;
    private BigDecimal amount;
    private String paymentMode;
    private Date receiptDate;

    public ReceiptEntity(int studentId, BigDecimal amount, String paymentMode, Date receiptDate) {
        this.studentId = studentId;
        this.amount = amount;
        this.paymentMode = paymentMode;
        this.receiptDate = receiptDate;
    }

    public int getStudentId() { return studentId; }
    public BigDecimal getAmount() { return amount; }
    public String getPaymentMode() { return paymentMode; }
    public Date getReceiptDate() { return receiptDate; }
}
