<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setAttribute("price", 12345L);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTP-8">
	<title></title>
</head>

<body> 
	가격은 <b>${ FormatUtil.number(price, '#,##0') }</b>
</body>
</html>