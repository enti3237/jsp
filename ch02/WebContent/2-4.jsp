<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4. 클래스</title>
</head>
<body>
	<h3>4. 클래스</h3>

	<%
		Account kb = new Account("KBbank", "101-12-1234", "Miki", 10000);

		kb.deposit(40000);
		kb.withdraw(5000);
	%>
	
	<h4>현재잔액</h4>
	<ul>
		<li>은행명    : <%= kb.bank %></li>
		<li>계좌번호 : <%= kb.id %></li>
		<li>입금주    : <%= kb.name %></li>
		<li>현재잔액 : <%= kb.money %></li>
	</ul>

</body>
</html>