<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 완료</title>
</head>
<body>
	<h3>로그인 완료</h3>
	
	<%
		// 그러니까 원래 타입은 Object
		String uid = (String) session.getAttribute("uid");
	%>
	<p>
	<%= uid %> 님 반갑습니다.
	</p>
	<a href="./logout.jsp">로그아웃</a>
	
</body>
</html>