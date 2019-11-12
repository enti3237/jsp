<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("이지영", "utf-8"));
	response.addCookie(cookie);
%>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>

	<%=cookie.getName()%> 쿠키의 값 = "<%=cookie.getValue()%>"

</body>
</html>