<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-2</title>
</head>
<body>
	<h3>2. 파라미터 수신</h3>

	<%
		String uid  = request.getParameter("uid");
		String pass = request.getParameter("pass");
	%>

	<p>
		ID : <%= uid %> <br>
		Pass : <%= pass %>
	</p>
	
	<a href="./3-1.jsp">Back 3-1</a>

</body>
</html>