<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = request.getParameter("subject");
	String content = request.getParameter("content");
	String regip = request.getRemoteAddr();

	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	String uid = bmb.getUid();

	// 1, 2단계 + DB 정보
	Connection conn = DBConfig.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);	
	psmt.setInt(1, 0); 			// parent
	psmt.setString(2, "free"); 	// cate
	psmt.setString(3, title); 	// title
	psmt.setString(4, content);	// content
	psmt.setInt(5, 0); 			// file
	psmt.setString(6, uid); 	// uid
	psmt.setString(7, regip); 	// regip
	
	psmt.executeUpdate();

	psmt.close();		
	conn.close();
	
	response.sendRedirect("/Board1/list.jsp");
%>
