<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-6</title>
</head>
<body>
	<h3>6. response 내장객체</h3>
<!-- 
리다이렉트는 클라이언트와 서버 사이에 2번 리퀘스트가 이루어지므로 
외부서버로 연결 가능
-->
 	<h1>3-6. jsp 페이지입니다.</h1>

	<%
		response.sendRedirect("http://naver.com");
	%>
</body>
</html>