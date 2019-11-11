<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-7</title>
</head>
<body>
	<h3>7. 포워딩 페이지</h3>

<!-- 	
서버 내에서 처리하므로 외부 페이지로 리다이렉트 하지 못함
 -->
 
	<h1>3-7. jsp 페이지입니다.</h1>

	<%
		pageContext.forward("http://naver.com");
	%>

</body>
</html>