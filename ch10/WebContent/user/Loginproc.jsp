<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//파라미터 수신
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	if(uid.equals("abcd") && pass.equals("1234")) {
		
		// 회원이 맞을 경우 세션에 회원정보 저장
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass);
		
		response.sendRedirect("./loginSuccess.jsp");
		
	} else {
		
		// 회원이 아닐 경우
		response.sendRedirect("./login.jsp?result=fail");
		
	}

%>

