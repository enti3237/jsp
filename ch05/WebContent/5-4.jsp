<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5-4</title>
</head>
<body>
	<h3>4. 내장객체 영역</h3>
	
	<%
		pageContext.setAttribute("name", "p_Miki");
		request.setAttribute("name", "r_Park");
		session.setAttribute("name", "s_Kim");
		application.setAttribute("name", "a_Lee");
		
		pageContext.forward("./5-5.jsp");
	
	%>
	
	<h4>내장객체 영역에 name 값 지정 완료</h4>
	<a href="5-5.jsp">내장객체 저장값 확인</a>

</body>
</html>