<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2. 조건문</title>
</head>
<body>
	<h3>2. 조건문</h3>
	<%
		int num1 = 1, num2 = 2, num3 = 3, num4 = 4;

		if (num1 > 0) {
			out.println("<p>num1이 0보다 크다.</p>");
		}

		if (num1 > num2) {
	%>
			<p>num1이 num2보다 크다.</p>
	<%	} else { %>
			<p>num1이 num2보다 작다.</p>
	<%	} %>
	
	<h4>if ~else if ~else</h4>
	<% if(num1 > num2){ %>
		<em>num1이 num2보다 크다</em>
	<% } else if(num2 > num3){ %>
		<em>num2이 num3보다 크다</em>
	<% } else if(num3 > num4){ %>
		<em>num3이 num4보다 크다</em>
	<% } else { %>
		<em>num4가 제일 크다</em>
	<% } %>

	<br>
	<br>
	
	<%
		// 이래도 되긴 하는데 태그 쓸 방법이 없군...
		if(num1>num2) {
			out.println("num1 over num2");
		} else if(num2>num3) {
			out.println("num2 over num3");			
		} else if(num3>num4) {
			out.println("num3 over num4");			
		} else {
			out.println("num4 maximum");			
		}
	%>
	
</body>
</html>