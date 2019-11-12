<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3. 반복문</title>
	<style type="text/css">
		table 
	
	</style>
</head>
<body>
	<h3>3. 반복문</h3>

	<h4>for 문</h4>

	<%
		for(int i=1; i<=3; i++){
			out.print("<p>" + i + "안녕하세요. </p>");
		}	
	%>
	
	<% for(int j=1; j<=3; j++) { %>
		<p><font color=red><%= j %> 번 회전합니다.</font></p>
	<% } %>


	<h4>while 문</h4>

	<%
		int k = 1;
		while(k <= 3){
	%>
	
		<p><%= k %>. 안녕하세요 </p>	
	
	<%	k++;} %>

	<%
		int m=1;
		while(m<=3){
			out.print(m + " ");
			m++;
		}
	%>

	<h4>구구단 연습</h4>
	
	<table border="1">
		<tr>
	<%	for(int i=2; i<=9; i++){ %>
			<td><%= i %> 단 </td>
			<% } %>
	<% 	for(int a=1; a<=9; a++){ // 가로로 이동하므로 a=1 b=23456789를 반복하고 a=2로 이어진다. 출력은 b*a %>
		<tr>
		<% 	for(int b=2; b<=9; b++){
				int c = a * b;%>
			<td><%= b %> x <%= a %> = <%= c %></td>
		<% } %>
		</tr>
	<% } %>
	</table>

</body>
</html>