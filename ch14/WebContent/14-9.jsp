<%@page import="sub1.DBConfig"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

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
	
	// 4단계 - 전부 뽑아내기
	ResultSet rs = stmt.executeQuery("SELECT * FROM `MEMBER`; ");
	
	// 5단계 - 행렬처리
	JSONArray jarr = new JSONArray();
	
		// 테이블 행 수 만큼의 obj가 만들어지게 됨
	while(rs.next()){
		
		JSONObject obj = new JSONObject();
		
		obj.put("uid", rs.getString(1));
		obj.put("name", rs.getString(2));
		obj.put("hp", rs.getString(3));
		obj.put("pos", rs.getString(4));
		obj.put("dep", rs.getInt(5));
		obj.put("rdate", rs.getString(6));
		
		jarr.add(obj);
		
	}
	
	// 6단계
	rs.close();
	stmt.close();
	conn.close();
	
	// JSON 배열 출력하기
	
	out.print(jarr);

%>
