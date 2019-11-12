<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String pos = request.getParameter("pos");
	String rdate = request.getParameter("rdate");
%>
	<table>
		<tr>
			<td>이   름</td>
			<td><%= name %></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><%= hp %></td>
		</tr>
		<tr>
			<td>직   급</td>
			<td><%= pos %></td>
		</tr>
		<tr>
			<td>입사일</td>
			<td><%= rdate %></td>
		</tr>
	</table>

</body>
</html>