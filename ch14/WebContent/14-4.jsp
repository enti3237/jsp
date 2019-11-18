<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 파라미터 수신 - 받아올 값에 손을 써줘야 함 ()
	String uid   = request.getParameter("uid");

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
	String sql = "DELETE FROM `MEMBER` WHERE `uid`='" +uid+ "';";
		  
	stmt.executeUpdate(sql);
	
	// 5단계 - SELECT 결과셋 처리
	// 6단계 - 데이터베이스 종료
	stmt.close();
	conn.close();
	
	// 목록 화면으로 이동
	response.sendRedirect("./14-3.jsp");
%>
