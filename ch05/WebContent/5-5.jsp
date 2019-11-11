<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5-5</title>
</head>
<body>
	<h3>5. 내장객체 영역 name 값 확인</h3>

	<%
		String name1 = (String) pageContext.getAttribute("name");
		String name2 = (String) request.getAttribute("name");
		String name3 = (String) session.getAttribute("name");
		String name4 = (String) application.getAttribute("name");
	%>
	
	<p>
		pageContext name : <%= name1 %><br>
		request name : <%= name2 %><br>
		session name : <%= name3 %><br>
		application name : <%= name4 %><br>
	</p>
	
</body>
</html>