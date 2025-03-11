package com.engisphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.engisphere.entity.StaffEntities;

public class StaffDao {
    Connection con;

    public StaffDao(Connection con) {
        this.con = con;
    }

    public boolean addStaff(StaffEntities staff) {
        System.out.println("Code reached: Add Staff DAO");
        boolean status = false;
        System.out.println("in staffDao --> Add Staff");

        String query = "INSERT INTO staffdata (firstName, lastName, contact, address, email, password, joiningDate, jobProfession, salary, work) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, staff.getFirstName());
            pstmt.setString(2, staff.getLastName());
            pstmt.setString(3, staff.getContact());
            pstmt.setString(4, staff.getAddress());
            pstmt.setString(5, staff.getEmail());
            pstmt.setString(6, staff.getPassword());
            pstmt.setString(7, staff.getJoiningDate());
            pstmt.setString(8, staff.getJobProfession());
            pstmt.setString(9, staff.getSalary());
            pstmt.setString(10, staff.getWork());

            int result = pstmt.executeUpdate();
            if (result > 0) {
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Code reached: Add Staff DAO - End");
        return status;
    }
    
    public ArrayList<StaffEntities> getAllStaff() {
        ArrayList<StaffEntities> staffList = new ArrayList<>();
        String query = "SELECT * FROM staffdata";
        System.out.println("Inside getAllStaff");

        try (PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            
            System.out.println("Inside getAllStaff -> Try block");

            while (rs.next()) {
                StaffEntities staff = new StaffEntities(
                    rs.getInt("id"),
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("contact"),
                    rs.getString("address"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("joiningDate"),
                    rs.getString("jobProfession"),
                    rs.getString("salary"),
                    rs.getString("work")
                );
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }

}
