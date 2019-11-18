<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid 		= request.getParameter("uid");
	String name 	= request.getParameter("name");
	String height 	= request.getParameter("height");
	String age 		= request.getParameter("age");
	String gender 	= request.getParameter("gender");
	String color	= request.getParameter("color");
	String div 		= request.getParameter("div");
	String tribe 	= request.getParameter("tribe");
	String chara 	= request.getParameter("chara");
	String secret 	= request.getParameter("secret");

	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://34.84.240.22/myDB", "root", "seireid0");

	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO `SPACE` VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);	// preparedStatement의 인덱스는 0이 아닌 1에서 시작한다.
	psmt.setString(2, name);	
	psmt.setString(3, height);	
	psmt.setString(4, age);	
	psmt.setString(5, gender);	
	psmt.setString(6, color);	
	psmt.setString(7, div);	
	psmt.setString(8, tribe);	
	psmt.setString(9, chara);	
	psmt.setString(10, secret);	
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
	
%>