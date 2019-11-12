<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>10-2</title>
</head>
<body>
	<h3>2. 세션</h3>
	
	<%
		String sid  = session.getId();
/* 		Object name = session.getAttribute("name");  - 원래는 이건데 스트링값으로 받기 위해 다운캐스팅을 실행한다 */
		String name = (String) session.getAttribute("name");
		String uid  = (String) session.getAttribute("uid");
	%>
	
	<p>
		sid : <%= sid %><br>
		name: <%= name %><br>
		uid : <%= uid %><br>
	
	</p>

</body>
</html>