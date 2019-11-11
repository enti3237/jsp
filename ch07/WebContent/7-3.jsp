<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7-3</title>
</head>
<body>
	<h3>3. 포워드 액션태그</h3>
	
	<%--
 	
 	<% pageContext.forward("7-1.jsp"); %>
	굳이 HTML 안에 프로그램 명령어를 쓰는 것보다는 태그화하는 게 좋겠죠  
	근데 둘 다 안 써... 요샌 jsp 태그 안 써... 
	
	--%>
	
	<jsp:forward page="7-1.jsp"></jsp:forward>

</body>
</html>