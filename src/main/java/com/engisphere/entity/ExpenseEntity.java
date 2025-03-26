package com.engisphere.entity;

import java.math.BigDecimal;
import java.util.Date;

public class ExpenseEntity {
    private int id;
    private String expenseName; // Corrected field name
    private BigDecimal amount;
    private String category;
    private Date expenseDate;

    public ExpenseEntity() {}

    public ExpenseEntity(int id, String expenseName, BigDecimal amount, String category, Date expenseDate) {
        this.id = id;
        this.expenseName = expenseName;
        this.amount = amount;
        this.category = category;
        this.expenseDate = expenseDate;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getExpenseName() {  // Fixed method name
        return expenseName;
    }

    public void setExpenseName(String expenseName) {  // Fixed method name
        this.expenseName = expenseName;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Date getExpenseDate() {
        return expenseDate;
    }

    public void setExpenseDate(Date expenseDate) {
        this.expenseDate = expenseDate;
    }
}
