<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 파라미터 수신
	String uid   = request.getParameter("uid");	
	String name  = request.getParameter("name");	
	String hp    = request.getParameter("hp");	
	String pos   = request.getParameter("pos");	
	String dep 	 = request.getParameter("dep");	
	String rdate = request.getParameter("rdate");	

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
	String sql = "INSERT INTO `MEMBER` SET ";

	sql += "`uid`	='"+uid  +"',"	;
	sql += "`name`	='"+name +"',"	;
	sql += "`hp`	='"+hp   +"',"	;
	sql += "`pos`	='"+pos  +"',"	;
	sql += "`dep`	= "+dep  +","	;
	sql += "`rdate`	='"+rdate+"';"	; // 여기서 마지막에 ;가 아니라 ,을 넣었잖아;;
		  
	stmt.executeUpdate(sql);
	
	// 5단계 - SELECT 결과셋 처리
	// 6단계 - 데이터베이스 종료
	stmt.close();
	conn.close();
	
	// 목록 화면으로 이동
	response.sendRedirect("./14-3.jsp");
%>
