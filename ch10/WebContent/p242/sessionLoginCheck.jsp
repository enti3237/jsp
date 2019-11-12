<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String memberId = (String)session.getAttribute("MEMBERID");
	boolean login = memberId == null ? false : true;
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 여부 검사</title>
</head>
<body>

<%
	if(login){
%>
	아이디 "<%= memberId %>"로 로그인한 상태입니다.
	<%
	} else { %>
	로그인되지 않았습니다.
	<% } %>

</body>
</html>