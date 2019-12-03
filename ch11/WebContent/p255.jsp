<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setAttribute("name", "miki");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTP-8">
	<title></title>
</head>

<body>
요청 URL : ${pageContext.request.requestURI}<br>
request의 name 속성 : ${ requestScope.name }<br>
code 파라미터 : ${ param.code }

</body>
</html>