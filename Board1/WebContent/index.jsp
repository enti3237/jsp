<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 세션에 사용자 정보 유무를 확인
	
	if(true){
		// 로그인을 안했으면
		pageContext.forward("/Board1/user/login.jsp");
	} else {
		// 로그인을 안했으면
		response.sendRedirect("/Board1/list.jsp");
	}
%>