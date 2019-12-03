<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String cate = request.getParameter("cate");
%>

<section class="sub cate3">
	<div><img src="/farmstory/img/sub_top_tit3.png" alt="CropTalk"></div>
		<div>
		<aside class="lnb">
			<img src="/farmstory/img/sub_aside_cate3_tit.png" alt="농작물이야기">
			<ul>
			<!-- 제이쿼리를 써도 되지만 삼항연산자를 쓰는 게 더 간단하니까 이걸로 -->
			<li class="<%= (cate.equals("story"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=croptalk&cate=story">농작물이야기</a></li>
			<li class="<%= (cate.equals("grow"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=croptalk&cate=grow">텃밭가꾸기</a></li>
			<li class="<%= (cate.equals("school"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?group=croptalk&cate=school">귀농학교</a></li>
			</ul>
		</aside>
		<article class="content">
			<nav>
				<!-- 파일명을 바꿔서 적용시킨다 -->
				<img src="/farmstory/img/sub_nav_tit_cate3_<%= cate %>.png" alt="농작물이야기">
				<!-- 텍스트란은 답이 없으니 if~else로 -->
				<p>
					HOME > 농작물이야기 > 
					<% if(cate.equals("story")){ %>
					<span>농작물이야기</span>
					<% } else if(cate.equals("grow")) { %>
					<span>텃밭가꾸기</span>
					<% } else if(cate.equals("school")) { %>
					<span>귀농학교</span>
					<% } %>
				</p>
			</nav>

<!-- 컨텐츠 내용 시작 -->  