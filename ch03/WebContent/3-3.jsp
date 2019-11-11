<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-3</title>
</head>
<body>
	<h3>3. 회원가입 파라미터 수신</h3>
	<%
		// 전송요청 받는 페이지는 이걸 해야 한글이 안 깨진다 필수!!!
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobby");
	%>
	
	<p>
		이름 : <%= name %><br>
		성별 : <%= gender %><br>
		취미 : 
		<%
			for(String hobby : hobbies) {
				out.print(hobby + ", ");
			}
		%> <br>
		주소 : <%= request.getParameter("addr") %><br>
	</p>
	
	<a href="./3-1.jsp">3-1</a>
</body>
</html>