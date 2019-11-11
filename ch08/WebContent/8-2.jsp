<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
<%
	// 전송 파라미터 수신 (gender가 int 값이 되지 않는 것에 신경쓰기)
	request.setCharacterEncoding("UTF-8"); // 한글 깨질라 꼭 한다...

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String hobbies[] = request.getParameterValues("hobby");
	String addr = request.getParameter("addr");
%> 
 --%>

	<jsp:useBean id="user" class="sub1.UserBean">
	<jsp:setProperty name="user" property="name"/>
	<jsp:setProperty name="user" property="gender"/>
	<jsp:setProperty name="user" property="hobby"/>
	<jsp:setProperty name="user" property="addr"/>
</jsp:useBean>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>8-2</title>
</head>
<body>
<%-- 
	<h3>파라미터 출력</h3>
	<p>
	이름 : <%= name %><br>
	성별 : <%= (gender.equals("1")) ? "남자" : "여자" %><br>
	취미 : <%
		for(String hobby : hobbies){
			out.print(hobby + " ");}
			%><br>
	주소 : <%= addr %><br>
 --%>
 
	<h3>파라미터 UserBin 출력</h3>
	<p>
	이름 : <%= user.getName() %><br>
	성별 : <%= (user.getGender() == 1) ? "남자" : "여자" %><br>
	취미 : <%
		for(String hobby : user.getHobby()){
			out.print(hobby + " ");}
			%><br>
	주소 : <%= user.getAddr() %><br>


</body>
</html>