<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>시작페이지</title>
</head>
<body>

	<form action="./resist.jsp" method="post">
	<table>
		<tr>
			<td>이   름</td>
			<td><input type="text" name="name" size="15"></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp" size="15"></td>
		</tr>
		<tr>
			<td>직   급</td>
			<td><input type="text" name="pos" size="15"></td>
		</tr>
		<tr>
			<td>입사일</td>
			<td><input type="date" name="rdate"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="등록"></td>
		</tr>
	</table>
	</form>
	
</body>
</html>