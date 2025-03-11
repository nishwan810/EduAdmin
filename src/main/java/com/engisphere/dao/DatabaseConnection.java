package com.engisphere.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	public static Connection con;

	public static Connection connect() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Got Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/engisphere","root" , "Abhay@0007");
			System.out.println("Got Connection");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return con;

	}
}
