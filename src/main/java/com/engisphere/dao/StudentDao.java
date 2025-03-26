package com.engisphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.engisphere.entity.StudentsEntities;

public class StudentDao {
	Connection con;

	public StudentDao(Connection con) {
		this.con = con;
	}

	public boolean addStudent(StudentsEntities s1) {
		System.out.println("COde rich to add Student 01");
		boolean status = false;


		String query = "INSERT INTO studentdata(firstName, lastName, contact, address, email, `password`, joiningDate, course) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";


		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, s1.getFirstName());
			pstmt.setString(2, s1.getLastName());
			pstmt.setString(3, s1.getContact());
			pstmt.setString(4, s1.getAddress());
			pstmt.setString(5, s1.getEmail());
			pstmt.setString(6, s1.getPassword());
			pstmt.setString(7, s1.getJoiningDate());
			pstmt.setString(8, s1.getCourse());

			int result = pstmt.executeUpdate();
			if (result > 0) {
				status = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("COde rich to add Student 02");
		return status;
	}

	public ArrayList<StudentsEntities> getAllStudent(){
		ArrayList<StudentsEntities> studentList = new ArrayList<StudentsEntities>();
		String querry = "select * from studentdata";

		try {
			PreparedStatement pstmt = con.prepareStatement(querry);
			ResultSet result =pstmt.executeQuery();

			while (result.next()) {
				StudentsEntities s1 = new StudentsEntities();
				s1.setId(result.getInt(1));;
				s1.setFirstName(result.getString(2));
				s1.setLastName(result.getString(3));
				s1.setContact(result.getString(4));
				s1.setAddress(result.getString(5));
				s1.setEmail(result.getString(6));
				s1.setPassword(result.getString(7));
				s1.setJoiningDate(result.getString(8));
				s1.setCourse(result.getString(9));
				studentList .add(s1);

			}
			con.close();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return studentList;
	}


	public StudentsEntities getStudentById(int id ){


		StudentsEntities s1 = new StudentsEntities();

		System.out.println("IN getStudentById(int id )");
		System.out.println(s1);

		String query = "SELECT * FROM studentdata WHERE id = ?";

		PreparedStatement pstmt;

		try {
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet result = pstmt.executeQuery();

			while(result.next()) {

				s1.setId(result.getInt(1));
				s1.setFirstName(result.getString(2));
				s1.setLastName(result.getString(3));
				s1.setContact(result.getString(4));
				s1.setAddress(result.getString(5));
				s1.setEmail(result.getString(6));
				s1.setPassword(result.getString(7));
				s1.setJoiningDate(result.getString(8));
				s1.setCourse(result.getString(9));

			}
			con.close();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(s1);
		return s1;	
	}

	//Update one student

	public boolean UpdateOneStudent(StudentsEntities s1) {

		System.out.println("IN Update One Student s1 ovject");
		System.out.println(s1);
		boolean status = false;
		String query = "UPDATE studentdata SET firstName = ?, lastName = ?, contact = ?, address = ?, email = ?, `password` = ?, joiningDate = ?, course = ? WHERE id = ?";

		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, s1.getFirstName());
			pstmt.setString(2, s1.getLastName());
			pstmt.setString(3, s1.getContact());
			pstmt.setString(4, s1.getAddress());
			pstmt.setString(5, s1.getEmail());
			pstmt.setString(6, s1.getPassword());
			pstmt.setString(7, s1.getJoiningDate());
			pstmt.setString(8, s1.getCourse());
			pstmt.setInt(9, s1.getId()); 


			int result = pstmt.executeUpdate();
			if (result > 0) {
				status = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



		return status;
	}


	//Delete Student by id

	public boolean DeleteStudentById(int id) {
		boolean status = false;
		String query = "DELETE FROM studentdata WHERE id = ?";

		if (id <= 0) {
			return false;
		}

		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);

			int n = pstmt.executeUpdate();
			if (n == 1) {
				status = true;
			}

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return status; 
	}


	// Finding total student in Table

	public int TotalStudents() {
		int totalStud = 0;
		String query = "SELECT COUNT(*) FROM studentdata"; 

		try (
				PreparedStatement pstmt = con.prepareStatement(query);

				ResultSet rs = pstmt.executeQuery()) { 

			if (rs.next()) {
				totalStud = rs.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace(); // Handle the exception
		}

		System.out.println("Total students in table is: " + totalStud);
		return totalStud;
	}

	// In StudentDao


	public boolean markStudentAttendance(int studentId, String date, String status) {
		boolean result = false;
		String query = "INSERT INTO student_attendance (student_id, attendance_date, status) VALUES (?, ?, ?)";

		try (PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setInt(1, studentId);
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

	public List<Map<String, String>> getStudentAttendance(String date) {
		List<Map<String, String>> attendanceList = new ArrayList<>();
		String query = "SELECT s.firstName, s.lastName, s.course, sa.status " +
				"FROM student_attendance sa " +
				"JOIN studentdata s ON sa.student_id = s.id " +
				"WHERE sa.attendance_date = ?";

		try (PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setString(1, date);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, String> attendance = new HashMap<>();
				attendance.put("firstName", rs.getString("firstName"));
				attendance.put("lastName", rs.getString("lastName"));
				attendance.put("course", rs.getString("course"));
				attendance.put("status", rs.getString("status"));
				attendanceList.add(attendance);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return attendanceList;
	}
	
	public double getStudentAttendancePercentage(int studentId) {
	    double percentage = 0.0;
	    try {
	        Connection con = DatabaseConnection.connect();
	        String query = "SELECT COUNT(CASE WHEN status = 'Present' THEN 1 END) AS attended, COUNT(*) AS total FROM student_attendance WHERE student_id = ?";
	        PreparedStatement pst = con.prepareStatement(query);
	        pst.setInt(1, studentId);
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