package com.Registration;

import java.sql.Connection;
//import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
	private String dburl = "jdbc:mysql://localhost:3306/crud";
	private String dbuser = "root";
	private String dbpassword = "maha";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public Connection getConnection() {
		
		Connection connection = null;
//		loadDriver(dbDriver);
		
		try {
			loadDriver(dbDriver);
			connection = DriverManager.getConnection(dburl, dbuser, dbpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public String insert(Student student) {
		//loadDriver(dbDriver);
		String reString = "Value inserted Successfully.";
		
		Connection connection = getConnection();
		String sqlString = "insert into crud.student values(? , ? ,? ,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sqlString);
			
			ps.setString(1, student.getFirst_name());
			ps.setString(2, student.getLast_name());
			ps.setString(3, student.getDob());
			ps.setString(4, student.getGender());
			ps.setInt(5, (int) student.getMarks());
			ps.setString(6, student.getEmail());
			ps.setString(7, student.getPhone());
			ps.setString(8, student.getYear());
			ps.setString(9, student.getBranch());
			ps.setString(10, student.getAddress());
			ps.setFloat(11, student.getPercentage());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			reString = "Data not inserted!!";
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return reString;
	}
	
	public String getRoll() {
		String res="";
		ResultSet rs = null;
		loadDriver(dbDriver);
		Connection connection = getConnection();
		Statement stmt = null;
		try {
			stmt = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "SELECT roll FROM crud.login";
		
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				res = rs.getString("roll");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public String insertLoginDetails(String username , String password,String roll) {
		String res = "Data inserted Successfully!!";
		Connection connection = getConnection();
		String sql = "insert into crud.login values(? , ? , ?)";
		
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, roll);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			res = "Error while inserting data";
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	public boolean SearchByUsername(String username) {
		
		boolean isPresent = false;
		Connection connection = getConnection();
		String sql = "select username from crud.login where username=?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			
			try {
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					isPresent = true;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isPresent;
	}
	
	public String getPassword(String username) {
		String res = null;
		Connection connection = getConnection();
		String sql = "select pass from crud.login where username=?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, username);
			
			try {
				ResultSet rs = stmt.executeQuery();
				if(rs.next()) {
					res = rs.getString("pass");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
//	
//	public String delete(String name) {
//		loadDriver(dbDriver);
//		Connection connection = getConnection();
//		String res = "Deleted Successfully";
//		String sql  = "DELETE FROM crud.user_ WHERE uname=?";
//		
//		try {
//			PreparedStatement ps = connection.prepareStatement(sql);
//			ps.setString(1, name);
//			ps.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			res = "Error while deletion.";
//			e.printStackTrace();
//		}
//		return res;
//	}
//	
//	public String update(String name , User user) {
//		loadDriver(dbDriver);
//		Connection connection = getConnection();
//		String res = "Updation Successful";
//		String sql = "update crud.user_ set umail=? , uphone=? , uaddress=? where uname=?";
//		
//		try {
//			PreparedStatement ps = connection.prepareStatement(sql);
//			ps.setString(1, user.getMail());
//			ps.setString(2, user.getPhone());
//			ps.setString(3, user.getAddress());
//			ps.setString(4, name);
//			ps.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			res="Updation Failed";
//			e.printStackTrace();
//		}
//		
//		return res;
//	}
}
