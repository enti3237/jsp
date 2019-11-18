<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid   = request.getParameter("uid");	
	String name  = request.getParameter("name");	
	String hp    = request.getParameter("hp");	
	String pos   = request.getParameter("pos");	
	String dep 	 = request.getParameter("dep");	
	String rdate = request.getParameter("rdate");	

	String host = "jdbc:mysql://192.168.44.9/ljy";
	String user = "ljy";
	String pass = "1234";
	
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection(host, user, pass);

	String sql = "UPDATE `MEMBER` SET `name`=?, `hp`=?, `pos`=?, `dep`=? WHERE `uid` =? ;";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, name);
	psmt.setString(2, hp);
	psmt.setString(3, pos);
	psmt.setString(4, dep);
	psmt.setString(5, uid);
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();

	// 목록 화면으로 이동
	response.sendRedirect("./14-3.jsp");
%>
