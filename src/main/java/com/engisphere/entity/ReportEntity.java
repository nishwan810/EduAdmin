package com.engisphere.entity;

import java.sql.Timestamp;

public class ReportEntity {
    private int id;
    private String reportName;
    private Timestamp reportDate;
    private String filePath;

    // Constructor
    public ReportEntity(int id, String reportName, Timestamp reportDate, String filePath) {
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

    public Timestamp getReportDate() {
        return reportDate;
    }

    public void setReportDate(Timestamp reportDate) {
        this.reportDate = reportDate;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
