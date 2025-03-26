package com.engisphere.dao;

import com.engisphere.entity.FinancialReport;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FinancialReportDao {
    private Connection connection;
    
    public FinancialReportDao(Connection connection) {
        this.connection = connection;
    }
    
    public List<FinancialReport> getAllReports() {
        List<FinancialReport> reports = new ArrayList<>();
        String query = "SELECT id, report_name, report_date, file_path FROM reports ORDER BY report_date DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                FinancialReport report = new FinancialReport();
                report.setId(rs.getInt("id"));
                report.setReportName(rs.getString("report_name"));
                report.setReportDate(rs.getDate("report_date"));
                report.setFilePath(rs.getString("file_path"));
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }
    
    public FinancialReport getReportById(int id) {
        String query = "SELECT id, report_name, report_date, file_path FROM reports WHERE id = ?";
        FinancialReport report = null;
        
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                report = new FinancialReport();
                report.setId(rs.getInt("id"));
                report.setReportName(rs.getString("report_name"));
                report.setReportDate(rs.getDate("report_date"));
                report.setFilePath(rs.getString("file_path"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return report;
    }
}