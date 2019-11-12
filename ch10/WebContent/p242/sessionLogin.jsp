<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(id.equals(pass)){
		session.setAttribute("MEMBERID", id);
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Login Success</title>
</head>

<body>
	Login Success!
</body>

<% } else { // 로그인 실패시
%>

<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>
<%
}
%>

</html>