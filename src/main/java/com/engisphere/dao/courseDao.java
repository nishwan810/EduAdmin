package com.engisphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.engisphere.entity.StudentsEntities;
import com.engisphere.entity.course;

public class courseDao {
	Connection con;

	public courseDao(Connection con) {
		this.con = con;
	}

	public boolean addCourse(course c1) {
		System.out.println("COde rich to add course 01");
		boolean status = false;

		String query = "INSERT INTO coursetable(courseCode, courseName, syllabus) VALUES(?, ?, ?)";

		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, c1.getCourseCode());
			pstmt.setString(2, c1.getCourseName());
			pstmt.setString(3, c1.getSyllabus());

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

	public ArrayList<course> getallCourses() {
		ArrayList<course> courseList = new ArrayList<course>();
		String query = "select * from coursetable";

		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery();

			while (result.next()) {
				course c1 = new course();
				
				c1.setId(result.getInt(1));;
				c1.setCourseCode(result.getString(2));
				c1.setCourseName(result.getString(3));
				c1.setSyllabus(result.getString(4));

				courseList.add(c1);

			}
			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return courseList;
	}
	
	
	
public course getCourseById(int id ){
		
		
//		StudentsEntities s1 = new StudentsEntities();
		course c1 = new course();
		
		System.out.println("inside getcourse by id"
				+ "");
		System.out.println("IN getStudentById(int id )");
		

		String query = "SELECT * FROM coursetable WHERE id = ?";

		PreparedStatement pstmt;

		try {
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet result = pstmt.executeQuery();

			while(result.next()) {

				c1.setId(result.getInt(1));
				
				c1.setCourseCode(result.getString(2));
				c1.setCourseName(result.getString(3));
				c1.setSyllabus(result.getString(4));
				System.out.println("got");

			}
			con.close();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(c1);
		return c1;	
	}
	
	

}
