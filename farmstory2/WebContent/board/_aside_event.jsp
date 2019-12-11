<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<section class="sub">
	<div class="bg">
		<img src="${path}/img/sub_top_tit4.png" alt="INTRODUCTION" />
	</div>
	<div>
		<aside>
			<img src="${path}/img/sub_aside_cate4_tit.png" alt="팜스토리소개" />

			<ul class="pg4">
				<li class="${category == 'event'? 'on':'off' }"><a href="${path}/board/list.do?group=event&cate=event"><strong>이벤트</strong></a>
				</li>
			</ul>

		</aside>

		<article>
			<nav>
				<img src="${path}/img/sub_nav_tit_cate4_${category}.png" alt="찾아오시는 길" />
				<span>HOME > 이벤트 > <strong>${title}</strong></span>
			</nav>

			<!-- 컨텐츠 영역 -->
			<div class="content content4">