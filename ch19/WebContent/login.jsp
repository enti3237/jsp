<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
</head>

<body>
	<h3>로그인</h3>
	<form action="./login.do" method="post">
		아 이 디 : <input type="text" name="uid"/> <br>
		비밀번호 : <input type="password" name="pass"/> <br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>