<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<section class="sub">
	<div class="bg">
		<img src="${path}/img/sub_top_tit3.png" alt="INTRODUCTION" />
	</div>
	<div>
		<aside>
			<img src="${path}/img/sub_aside_cate3_tit.png" alt="팜스토리소개" />

			<ul class="pg3">
				<li class="${category == 'story'? 'on':'off' }"><a href="${path}/board/list.do?group=croptalk&cate=story"><strong>농작물이야기</strong></a></li>
				<li class="${category == 'grow'? 'on':'off' }"><a href="${path}/board/list.do?group=croptalk&cate=grow"><strong>텃밭가꾸기</strong></a></li>
				<li class="${category == 'school'? 'on':'off' }"><a href="${path}/board/list.do?group=croptalk&cate=school"><strong>귀농학교</strong></a></li>
			</ul>

		</aside>

		<article>
			<nav>
				<img src="${path}/img/sub_nav_tit_cate3_${category}.png" alt="찾아오시는 길" /> 
				<span>HOME > 농작물이야기 > <strong>${title}</strong></span>
			</nav>

			<!-- 컨텐츠 영역 -->
			<div class="content content3">