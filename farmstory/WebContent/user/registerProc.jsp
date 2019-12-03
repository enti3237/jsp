<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
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
	String zip   = request.getParameter("zip");	
	String addr1 = request.getParameter("addr1");	
	String addr2 = request.getParameter("addr2");	
	String regip = request.getRemoteAddr();

	// 1, 2단계 - 데이터베이스 접속
	Connection conn = DBConfig.getConnection();

	// 3단계 - SQL 실행객체 생성
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_USER);
	psmt.setString(1, uid);
	psmt.setString(2, pass1);
	psmt.setString(3, name);
	psmt.setString(4, nick);
	psmt.setString(5, email);
	psmt.setString(6, hp);
	psmt.setString(7, zip);
	psmt.setString(8, addr1);
	psmt.setString(9, addr2);
	psmt.setString(10, regip);
	
	
	// 4단계 - SQL 실행
	psmt.executeUpdate();	  

	// 5단계 - SELECT 결과셋 처리
	// 6단계 - 데이터베이스 종료
	psmt.close();
	conn.close();
	
	// 목록 화면으로 이동
	response.sendRedirect("/farmstory/user/login.jsp");
%>
