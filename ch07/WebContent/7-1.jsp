<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="./inc/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7-1</title>
</head>
<body>
	<h3>1. include 지시자</h3>
	
	<%@ include file="./inc/header.jsp" %>
	
	<main>
		<h4>메인 컨텐츠 영역</h4>
		<p>
			주소 : <%= HOST %><br>
			유저 : <%= USER %><br>
			비번 : <%= PASS %><br>
		</p>
	</main>
	
	<%@ include file="./inc/footer.jsp" %>

</body>
</html>