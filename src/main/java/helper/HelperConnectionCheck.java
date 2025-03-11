package helper;

import com.engisphere.dao.DatabaseConnection;

public class HelperConnectionCheck {
	public static void main(String[] args) {
		DatabaseConnection con = new DatabaseConnection();
		
		con.connect();
	}

}
