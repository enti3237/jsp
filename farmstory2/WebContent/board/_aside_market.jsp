<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<section class="sub">
	<div class="bg">
		<img src="${path}/img/sub_top_tit2.png" alt="MARKET" />
	</div>
	<div>
		<aside>
			<img src="${path}/img/sub_aside_cate2_tit.png" alt="팜스토리소개" />

			<ul class="pg2">
				<li class="${category == 'market'? 'on':'off' }""><a href="${path}/board/list.do?group=market&cate=market"><strong>마켓</strong></a>
				</li>
			</ul>

		</aside>

		<article>
			<nav>
				<img src="${path}/img/sub_nav_tit_cate2_${category}.png" alt="장보기" /> 
				<span>HOME > 마켓 > <strong>${title}</strong></span>
			</nav>

			<!-- 컨텐츠 영역 -->
			<div class="content content4">