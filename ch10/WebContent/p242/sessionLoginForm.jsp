<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인폼</title>
</head>
<body>

	<form action="./sessionLogin.jsp" method="post">
	아이디 : <input type="text" name="id" size="10">
	암  호 : <input type="password" name="pass" size="10">
	<input type="submit" value="LOGIN">
	</form>

</body>
</html>