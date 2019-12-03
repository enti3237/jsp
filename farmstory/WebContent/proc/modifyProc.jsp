<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String seq = request.getParameter("seq");
	String title = request.getParameter("subject");
	String content = request.getParameter("content");
	String pg = request.getParameter("pg");
	String cate = request.getParameter("cate");
	String group = request.getParameter("group");
	
	Connection conn = DBConfig.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_MODIFY_ARTICLE);
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setString(3, seq);
	
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
	response.sendRedirect("/farmstory/board/view.jsp?seq="+seq+"&pg="+pg+"&cate="+cate+"&group="+group);

%>
