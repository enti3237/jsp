<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<section class="sub">
	<div class="bg">
		<img src="${path}/img/sub_top_tit5.png" alt="INTRODUCTION" />
	</div>
	<div>
		<aside>
			<img src="${path}/img/sub_aside_cate5_tit.png" alt="팜스토리소개" />

			<ul class="pg5">
				<li class="${category == 'notice'? 'on':'off' }"><a href="${path}/board/list.do?group=community&cate=notice"><strong>notice</strong></a></li>
				<li class="${category == 'menu'? 'on':'off' }"><a href="${path}/board/list.do?group=community&cate=menu"><strong>menu</strong></a></li>
				<li class="${category == 'chef'? 'on':'off' }"><a href="${path}/board/list.do?group=community&cate=chef"><strong>chef</strong></a></li>
				<li class="${category == 'qna'? 'on':'off' }"><a href="${path}/board/list.do?group=community&cate=qna"><strong>qna</strong></a></li>
				<li class="${category == 'faq'? 'on':'off' }"><a href="${path}/board/list.do?group=community&cate=faq"><strong>faq</strong></a></li>
			</ul>

		</aside>

		<article>
			<nav>
				<img src="${path}/img/sub_nav_tit_cate5_${category}.png" alt="찾아오시는 길" />
				<span>HOME	> 커뮤니티 > <strong>${title}</strong></span>
			</nav>

			<!-- 컨텐츠 영역 -->
			<div class="content content5">