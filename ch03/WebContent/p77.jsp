<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>요청 파라미터 출력</title>
</head>
<body>
<b>request.getParameter()메소드 사용</b><br>
name 파라미터 = <%= request.getParameter("name") %><br>
address 파라미터 = <%= request.getParameter("address") %>
<p>
<b>request.getParameterValues()메소드 사용</b><br>
<%
	String values[] = request.getParameterValues("pet");
	if(values != null){
		for(int i=0 ; i<values.length; i++){
			out.println(values[i]);
		}
	}
%>
<p>
<b>request.getParameterNames()메소드 사용</b><br>
<%
	Enumeration param = request.getParameterNames();
	while(param.hasMoreElements()){
		String name = (String)param.nextElement();
		out.println(name);
	}
%>
<p>
<b>request.getParamaterMap()메소드 사용</b><br>
<%
	Map map = request.getParameterMap();
	String[] names = (String[])map.get("name");
	if(names != null){
		out.println("name = " + names[0]);
	}
%>

</body>
</html>