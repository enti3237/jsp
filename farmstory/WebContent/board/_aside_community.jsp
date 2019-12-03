<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String cate = request.getParameter("cate");
%>
<section class="sub cate5">
	<div><img src="/farmstory/img/sub_top_tit5.png" alt="Community"></div>
		<div>
		<aside class="lnb">
			<img src="/farmstory/img/sub_aside_cate5_tit.png" alt="커뮤니티">
			<ul>
			<!-- 제이쿼리를 써도 되지만 삼항연산자를 쓰는 게 더 간단하니까 이걸로 -->
			<li class="<%= (cate.equals("notice"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=notice"></a></li>
			<li class="<%= (cate.equals("menu"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=menu"></a></li>
			<li class="<%= (cate.equals("chef"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=chef"></a></li>
			<li class="<%= (cate.equals("qna"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=qna"></a></li>
			<li class="<%= (cate.equals("faq"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=community&cate=faq"></a></li>
			</ul>
		</aside>
		<article class="content">
			<nav>
				<!-- 파일명을 바꿔서 적용시킨다 -->
				<img src="/farmstory/img/sub_nav_tit_cate5_<%= cate %>.png" alt="커뮤니티">
				<!-- 텍스트란은 답이 없으니 if~else로 -->
				<p>
					HOME > 공지사항 > 
					<% if(cate.equals("notice")){ %>
					<span>공지사항</span>
					<% } else if(cate.equals("menu")) { %>
					<span>오늘의식단</span>
					<% } else if(cate.equals("chef")) { %>
					<span>나도요리사</span>
					<% } else if(cate.equals("qna")) { %>
					<span>1:1고객문의</span>
					<% } else if(cate.equals("faq")) { %>
					<span>자주묻는질문</span>
					<% } %>
				</p>
			</nav>

<!-- 컨텐츠 내용 시작 -->  