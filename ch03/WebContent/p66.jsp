<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
<%
	int sum = 0;
	for(int i=1; i<=10; i++){
		sum += i;
	}
%>
	1부터 10까지의 합은 <%= sum %>입니다.
	<hr>
<%
	int rs = 0;
	for(int i=1; i<=10; i++){
		if(i%2 == 0){
			rs += i;
		}
	}
%>
	1부터 10까지 중 짝수의 합은 <%= rs %>입니다.
</body>
</html>