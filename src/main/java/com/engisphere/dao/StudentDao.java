package com.engisphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
			pstmt.setInt(9, s1.getId()); // Add this line for the WHERE condition


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

	public boolean DeleteStudentById(int id) {
	    boolean status = false;
	    String query = "DELETE FROM studentdata WHERE id = ?";

	    // Validate ID before executing query
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





































}
