<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션의 모든 데이터 초기화
	session.invalidate();

	// 로그인 페이지 이동
	response.sendRedirect("/farmstory");

%>
