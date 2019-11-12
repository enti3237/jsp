<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String result = request.getParameter("result");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	
	<script>
		var result = "<%= result %>";
		
		if(result == "fail"){
			alert("로그인이 실패했습니다. \n 다시 확인하시기 바랍니다.");
		}
		
		// 상기 표현식을 쓰면 자바스크립트 명령인 alert를 구현할 수 없으므로 밑에 따로 빼는 것 

	</script>
	
</head>
<body>
	<h3>로그인</h3>
	<form action="./Loginproc.jsp" method="post">
		<table border="1">
			<tr>
				<td> 아이디 </td>
				<td> <input type="text" name="uid" placeholder="아이디를 입력하세요."></td>
			</tr>
			<tr>
				<td> 비밀번호</td>
				<td> <input type="password"	name="pass" placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td colspan="2"	align="right">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>