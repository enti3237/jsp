<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%--
	전송방식 GET과 POST 교재 p80
	GET
		-서버로 데이터나 페이지를 요청하는 방식 (000 주세요~)
		-파라미터 데이터가 주소창에 노출됨
	POST
		-서버로 데이터를 전달하면서 처리를 요청하는 방식 (000 해주세요~)
		-파라미터 데이터가 주소창에 노출되지 않는다. Request header에 삽입되어 전송
--%>

<!-- 아니 그런데 jsp 에서는 한줄 주석처리 단축키 (ctrl+/)가 안 먹잖아 문단처리(ctrl+shift+/)는 먹음
	- 자바주석 : // , / *  * /
	- HTML 주석 : < !--  -- >
	- JSP 주석 : < !-- -- >, < %--  --% >
	- XML 주석 : < !-- -- >
-->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-1</title>
</head>
<body>
	<h3>1. request 내장객체</h3>
	
	<h4>로그인</h4>
	<!-- method="post" 처리로 데이터가 주소창에 노출되지 않음 -->
	<form action="./3-2.jsp" method="post">
		<table border="1">
			<tr>
				<td>User ID</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Log in"></td>
			</tr>	
		</table>
	</form>
	
	<h4>회원가입</h4>
	<form action="./3-3.jsp" method="post">
		<table border="1">
			<tr>
				<td>Name</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>
					<label><input type="radio" name="gender" value="Male"/>Male</label>	
					<label><input type="radio" name="gender" value="FeMale"/>FeMale</label>	
				</td>
			</tr>
			<tr>
				<td>Hobby</td>
				<td>
					<label><input type="checkbox" name="hobby" value="Climbing"/>Climbing</label>	
					<label><input type="checkbox" name="hobby" value="Travel"/>Travel</label>	
					<label><input type="checkbox" name="hobby" value="Movie"/>Movie</label>	
					<label><input type="checkbox" name="hobby" value="Sports"/>Sports</label>	
					<label><input type="checkbox" name="hobby" value="Reading"/>Reading</label>	
				</td>
			</tr>
			<tr>
				<td>Address</td>
				<td>
					<select name="addr">
						<option>Seoul</option>
						<option>Daejeon</option>
						<option>Daegu</option>
						<option>Busan</option>
						<option>Gwangju</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="Sign in"/>
				</td>
			</tr>
		</table>
	</form>
	
	
	
</body>
</html>