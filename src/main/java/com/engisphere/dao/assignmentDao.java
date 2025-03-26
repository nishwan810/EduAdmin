package com.engisphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.engisphere.entity.StudentsEntities;
import com.engisphere.entity.assignment;
import com.engisphere.entity.course;
import com.mysql.cj.Session;

public class assignmentDao {
	
	
	Connection con;

	public assignmentDao(Connection con) {
		this.con = con;
	}
	
	public boolean addassignment(assignment a1) {
		
		System.out.println("COde rich to add ass 01");
		
		boolean status = false;
		
		
		String query = "INSERT INTO assignments(id, title, description, dueDateTime) VALUES(?, ?, ?, ?)";
		
		
		
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, a1.getId());
			pstmt.setString(2, a1.getTitle());
			pstmt.setString(3, a1.getDescription());
			pstmt.setString(4, a1.getDuedate());
			
			
			int result = pstmt.executeUpdate();
			if(result>0) {
				
				status = true;
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("COde rich to add ass 02");
		return status;
		
	}
	
	
	
	public ArrayList<assignment> getAllAssignment(){
		ArrayList<assignment> assignmentList = new ArrayList<assignment>();
		String querry = "select * from assignments";

		try {
			PreparedStatement pstmt = con.prepareStatement(querry);
			ResultSet result =pstmt.executeQuery();

			while (result.next()) {
				
				assignment a1 =new  assignment();
				
				a1.setAssignid(result.getInt(1));
				a1.setId(result.getString(2));
				a1.setTitle(result.getString(3));
				a1.setDescription(result.getString(4));
				a1.setDuedate(result.getString(5));
				a1.setStatus(result.getString(6));
				assignmentList.add(a1);
				
//				s1.setId(result.getInt(1));;
//				s1.setFirstName(result.getString(2));
//				s1.setLastName(result.getString(3));
//				s1.setContact(result.getString(4));
//				s1.setAddress(result.getString(5));
//				s1.setEmail(result.getString(6));
//				s1.setPassword(result.getString(7));
//				s1.setJoiningDate(result.getString(8));
//				s1.setCourse(result.getString(9));
//				studentList .add(s1);

			}
			con.close();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return assignmentList;
	}
	
	
	
public assignment getAssignmentById(int assignid ){
		
		
//		StudentsEntities s1 = new StudentsEntities();
		assignment a1 = new assignment();
		
		System.out.println("inside getcourse by id"
				+ "");
		System.out.println("IN getStudentById(int id )");
		

		
		String query = "SELECT * FROM assignments WHERE assignid = ?";

		PreparedStatement pstmt;

		try {
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, assignid);
			ResultSet result = pstmt.executeQuery();

			while(result.next()) {

			
				a1.setAssignid(result.getInt(1));
				a1.setId(result.getString(2));
				a1.setTitle(result.getString(3));
				a1.setDescription(result.getString(4));
				a1.setDuedate(result.getString(5));
				a1.setStatus(result.getString(6));
				
				 
				
				System.out.println("got assign");

			}
			con.close();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(a1);
		return a1;	
	}
	
	

}
