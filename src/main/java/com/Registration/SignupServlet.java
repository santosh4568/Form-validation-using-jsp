package com.Registration;

import java.io.IOException;
//import java.sql.Connection;
//import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.mysql.cj.Session;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DatabaseConnection connection = new DatabaseConnection();
		String username = "";
		String password="";
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		int marks = Integer.parseInt(request.getParameter("marks"));
		float percentage =Float.parseFloat(request.getParameter("percentage"));
		String mail = request.getParameter("email");
		String ph = request.getParameter("phone");
		String yr = request.getParameter("year");
		String branch = request.getParameter("branch");
		String address = request.getParameter("address");
		
		HashMap<String, String> branchHashMap = new HashMap<String, String>();
		branchHashMap.put("CSE", "1FA");
		branchHashMap.put("ECE", "1FC");
		branchHashMap.put("EEE", "1FE");
		branchHashMap.put("Mechanical", "1ME");
		branchHashMap.put("Chemical", "1CE");
		branchHashMap.put("Agriculture", "1AG");
		
		
		
		username+=yr.charAt(2);
		username+=yr.charAt(3);
		username+=branchHashMap.get(branch);
		String roll = connection.getRoll();
		int new_roll = Integer.parseInt(roll);
		new_roll+=1;
		String roll_store="";
		int diff = roll.length() - String.valueOf(new_roll).length();
		for(int i=0;i<diff;i++) {
			username+="0";
			roll_store+="0";
		}
		username+=String.valueOf(new_roll);
		roll_store+=String.valueOf(new_roll);
		
		
		
		String[] dateOfBirth = new String[5];
		dateOfBirth = dob.split("-");
		password+=fname.charAt(0);
		password+=Character.toLowerCase(lname.charAt(0));
		password+=dateOfBirth[0];
		password+="@";
		password+=mail.charAt(0);
		password+=mail.charAt(1);
		
		
		HttpSession session = request.getSession();
		
		Student student = new Student(fname, lname, mail, ph, yr, branch, address, gender, marks, dob, percentage);
		
		connection.insert(student);	
		session.setAttribute("username", username);
		session.setAttribute("pass", password);
		
		connection.insertLoginDetails(username, password, roll_store);		
		response.sendRedirect("userpassword.jsp");
		//response.getWriter().println(username + "  "+password+"    "+roll_store+"  "+yr.charAt(2)+"  " +yr.charAt(3)+"  "+yr);
		
		
//		response.getWriter().println(dob+"     "+percentage);
	}

}
