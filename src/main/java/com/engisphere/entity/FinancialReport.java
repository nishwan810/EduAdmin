package com.engisphere.entity;

import java.util.Date;

public class FinancialReport {
    private int id;
    private String reportName;
    private Date reportDate;
    private String filePath;
    
    // Constructors
    public FinancialReport() {}
    
    public FinancialReport(int id, String reportName, Date reportDate, String filePath) {
        this.id = id;
        this.reportName = reportName;
        this.reportDate = reportDate;
        this.filePath = filePath;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getReportName() {
        return reportName;
    }
    
    public void setReportName(String reportName) {
        this.reportName = reportName;
    }
    
    public Date getReportDate() {
        return reportDate;
    }
    
    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }
    
    public String getFilePath() {
        return filePath;
    }
    
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}