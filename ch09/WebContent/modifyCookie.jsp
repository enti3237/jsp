<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i=0 ; i<cookies.length ; i++){
			if(cookies[i].getName().equals("name")){
			Cookie cookie = new Cookie("name", URLEncoder.encode("JSP프로그래밍", "UTF-8"));
			response.addCookie(cookie);
			}
		}
	}

%>

<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키값 변경하기</title>
</head>
<body>
	name 쿠키의 값을 변경합니다.
</body>
</html>