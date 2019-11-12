<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pageContext 기본객체</title>
</head>
<body>

<%
	HttpServletRequest httpRq = (HttpServletRequest)pageContext.getRequest();
%>

request 기본 객체와 pageContext.getRequest()의 동일여부:

<%= request == httpRq %>

<br>

pageContext.getOut()메소드를 사용한 데이터 출력 : 

<% pageContext.getOut().print("안녕하세요!"); %>

</body>
</html>