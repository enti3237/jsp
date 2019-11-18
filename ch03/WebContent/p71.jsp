<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public int add(int a, int b){
		int c = a + b;
		return c;
	}

	public int sub(int a, int b){
		int c = a - b;
		return c;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스크립트릿에서 선언부를 사용하기</title>
</head>
<body>

<%
	int v1 = 3;
	int v2 = 9;
	
	int addRs = add(v1, v2);
	int subRs = sub(v1, v2);
%>

<%= v1 %> + <%= v2 %> = <%= addRs %>
<br>
<%= v1 %> - <%= v2 %> = <%= subRs %> 
	
</body>
</html>