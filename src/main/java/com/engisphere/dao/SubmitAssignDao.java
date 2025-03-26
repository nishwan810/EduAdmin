package com.engisphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.engisphere.entity.SubmitAssign;
import com.engisphere.entity.course;

public class SubmitAssignDao {
	
	
	
	Connection con;

	public SubmitAssignDao(Connection con) {
		this.con = con;
		
	}
	
	
	public boolean submitAssignment(SubmitAssign s1) {
		
		System.out.println("COde rich to add course 01");
		boolean status = false;

		String query = "INSERT INTO submittedassignments(assignid, Assignmentlink) VALUES(?, ?)";

		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, s1.getAssignid());
			pstmt.setString(2, s1.getAssignmentlink());
			

			int result = pstmt.executeUpdate();
			if (result > 0) {
				status = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("COde rich to add courses  02" + status);
		return status;
	}
//
//	public boolean SubmitAssign(SubmitAssign s1) {
//		System.out.println("COde rich to add course 01");
//		boolean status = false;
//
//		String query = "INSERT INTO submittedassignments(assignid, Assignmentlink) VALUES(?, ?)";
//
//		try {
//			PreparedStatement pstmt = con.prepareStatement(query);
//			pstmt.setString(1, );
//			pstmt.setString(2, c1.getCourseName());
//			pstmt.setString(3, c1.getSyllabus());
//
//			int result = pstmt.executeUpdate();
//			if (result > 0) {
//				status = true;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		System.out.println("COde rich to add courses  02" + status);
//		return status;
//	}

}
