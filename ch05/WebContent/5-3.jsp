<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5-3</title>
</head>
<body>
	<h3>3. application 내장객체</h3>

	<p>
		서버정보 : <%= application.getServerInfo() %><br>
		프로젝트명 : <%= application.getContextPath() %><br>
	</p>
		
</body>
</html>