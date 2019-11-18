<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 파라미터 수신
	String uid   = request.getParameter("uid");	
	String pass1 = request.getParameter("pass1");
	String name  = request.getParameter("name");	
	String nick  = request.getParameter("nick");	
	String email = request.getParameter("email");	
	String hp    = request.getParameter("hp");	
	String regip = request.getRemoteAddr();

	// DB 정보
	String host = "jdbc:mysql://192.168.44.9/ljy";
	String user = "ljy";
	String pass = "1234";
	
	// 1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);

	// 3단계 - SQL 실행객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계 - SQL 실행
	String sql = "INSERT INTO `BOARD_MEMBER` SET ";
		
			sql += "`uid`	='" + uid   + "'," ;
			sql += "`pass`	='" + pass1 + "'," ;
			sql += "`name`	='" + name  + "'," ;
			sql += "`nick`	='" + nick  + "'," ;
			sql += "`email`	='" + email + "'," ;
			sql += "`hp`	='" + hp    + "'," ;
			sql += "`regip`	='" + regip + "'," ;
			sql += "`rdate`	= NOW();" ;
				  
	stmt.executeUpdate(sql);
	
	// 5단계 - SELECT 결과셋 처리
	// 6단계 - 데이터베이스 종료
	stmt.close();
	conn.close();
	
	// 목록 화면으로 이동
	response.sendRedirect("/Board1/user/login.jsp");
%>
