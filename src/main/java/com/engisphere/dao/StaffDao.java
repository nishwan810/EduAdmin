package com.engisphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		try (PreparedStatement pstmt = con.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {

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

	// GetTeacher

	public int getTotalTeachers() {
		int totalTeachers = 0;
		String query = "SELECT COUNT(*) AS total_teachers FROM staffdata WHERE jobProfession = ?";

		try (PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setString(1, "Teacher");
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					totalTeachers = rs.getInt("total_teachers");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("Total teachers in the staff table: " + totalTeachers);
		return totalTeachers;
	}
	// Total Accountant

	public int getTotalAccountant() {
		int totalAccountant = 0;
		String query = "SELECT COUNT(*) AS total_Accountant FROM staffdata WHERE jobProfession = ?";

		try (PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setString(1, "Accountant");
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					totalAccountant = rs.getInt("total_Accountant");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("total Accountant in the staff table: " + totalAccountant);
		return totalAccountant;
	}

	// staff Attendance

	public boolean markStaffAttendance(int staffId, String date, String status) {
		boolean result = false;
		String query = "INSERT INTO staff_attendance (staff_id, attendance_date, status) VALUES (?, ?, ?)";

		try (PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setInt(1, staffId);
			pstmt.setString(2, date);
			pstmt.setString(3, status);

			int rows = pstmt.executeUpdate();
			if (rows > 0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Map<String, String>> getStaffAttendance(String date) {
		List<Map<String, String>> attendanceList = new ArrayList<>();
		String query = "SELECT s.firstName, s.lastName, s.jobProfession, sa.status " + "FROM staff_attendance sa "
				+ "JOIN staffdata s ON sa.staff_id = s.id " + "WHERE sa.attendance_date = ?";

		try (PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setString(1, date);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, String> attendance = new HashMap<>();
				attendance.put("firstName", rs.getString("firstName"));
				attendance.put("lastName", rs.getString("lastName"));
				attendance.put("jobProfession", rs.getString("jobProfession"));
				attendance.put("status", rs.getString("status"));
				attendanceList.add(attendance);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return attendanceList;
	}


	public StaffEntities getStaffById(int id) { 
		StaffEntities teacher = null; 

		try
		{ String query = "SELECT * FROM staffdata WHERE id=?"; 
		PreparedStatement ps =con.prepareStatement(query);
		ps.setInt(1, id);
		ResultSet rs =ps.executeQuery(); 
		if(rs.next()) { 
			teacher = new StaffEntities(
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


					); }

		}catch (Exception e) { e.printStackTrace(); }

		return teacher; }

	public double getStaffAttendancePercentage(int staffId) {
		double percentage = 0.0;
		try {
			Connection con = DatabaseConnection.connect();
			String query = "SELECT COUNT(CASE WHEN status = 'Present' THEN 1 END) AS attended, COUNT(*) AS total FROM staff_attendance WHERE staff_id = ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, staffId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				int attended = rs.getInt("attended");
				int total = rs.getInt("total");
				if (total > 0) {
					percentage = ((double) attended / total) * 100;
				}
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return percentage;
	}


}
