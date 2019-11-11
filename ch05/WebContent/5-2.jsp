<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5-2</title>
</head>
<body>
	<h3>2. PageContext 내장객체</h3>
	
	<%
		// 다른 페이지 요청 (걍 넘어가버림)
		pageContext.forward("./5-1.jsp");
	%>

</body>
</html>