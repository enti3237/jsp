<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String cate = request.getParameter("cate");
%>
<section class="sub cate4">
	<div><img src="/farmstory/img/sub_top_tit4.png" alt="Event"></div>
		<div>
		<aside class="lnb">
			<img src="/farmstory/img/sub_aside_cate4_tit.png" alt="이벤트">
			<ul>
			<!-- 제이쿼리를 써도 되지만 삼항연산자를 쓰는 게 더 간단하니까 이걸로 -->
			<li class="<%= (cate.equals("event"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=event&cate=event">이벤트</a></li>
			</ul>
		</aside>
		<article class="content">
			<nav>
				<!-- 파일명을 바꿔서 적용시킨다 -->
				<img src="/farmstory/img/sub_nav_tit_cate4_<%= cate %>.png" alt="이벤트">
				<!-- 텍스트란은 답이 없으니 if~else로 -->
				<p>
					HOME > 이벤트 > 
					<% if(cate.equals("event")){ %>
					<span>이벤트</span>
					<% } %>
				</p>
			</nav>

<!-- 컨텐츠 내용 시작 -->  