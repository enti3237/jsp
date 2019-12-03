<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");

	String code = request.getParameter("code");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="/farmstory/css/style.css"/>
	<link rel="stylesheet" href="/farmstory/css/board.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="/farmstory/js/slider.js"></script>
    <script src="/farmstrory/js/termsCheck.js"></script>
   	<script src="/farmstory/js/validation.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/farmstory/js/zipcode.js"></script>
	<script src="/farmstory/js/checkDuplicate.js"></script>

	<script>
		var code = "<%= code %>";
		if (code == '101') {alert('아이디나 비밀번호가 맞지 않습니다다');}
	</script>

</head>
<body>
    <div id="banner"></div>
    <div id="wrapper">
        <header>
            <a href="/farmstory/index.jsp" class="logo"><img src="/farmstory/img/logo.png" alt="로고"></a>
            <p>
                <a href="/farmstory/index.jsp">HOME</a>|
                <% if(bmb == null){ %>
	                <a href="/farmstory/user/login.jsp">로그인</a>|
	                <a href="/farmstory/user/terms.jsp">회원가입</a>|
                <% } else { %>
                	<%= bmb.getNick() %> |
               		<a href="/farmstory/user/logout.jsp">로그아웃</a>|
                <% } %>
                <a href="#">고객센터</a>
            </p>
            <img src="/farmstory/img/head_txt_img.png" alt="3만원 이상 무료배송, 팜카드 10% 적립">

            <ul class="gnb">
                <li><a href="/farmstory/1introduction/hello.jsp">팜스토리소개</a></li>
                <li><a href="/farmstory/2market/market.jsp"><img src="/farmstory/img/head_menu_badge.png" alt="30%">장보기</a></li>
                <li><a href="/farmstory/board/list.jsp?group=croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/farmstory/board/list.jsp?group=event&cate=event">이벤트</a></li>
                <li><a href="/farmstory/board/list.jsp?group=community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>
