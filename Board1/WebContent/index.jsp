<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션에 사용자 정보 유무를 확인
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	
	if(bmb == null){
		// 로그인을 안했으면 = 세션에 저장된 데이터가 없으면
		// pageContext는 절대값으로 하면 안 나온다 - response는 상관없음
		pageContext.forward("./user/login.jsp");
	} else {
		// 로그인을 했으면
		response.sendRedirect("./list.jsp");
	}
%>

