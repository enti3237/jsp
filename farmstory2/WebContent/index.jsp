<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./_header.jsp"%>

<section class="main">
	<!-- 슬라이드영역 -->
	<article class="slide">
		<!-- 사람과 자연을... 슬로건 -->
		<img src="${path}/img/main_slide_img_tit.png" alt="사람과 자연을 사랑하는..." />

		<ul>
			<li><img src="${path}/img/main_slide_img1.jpg" alt="슬라이드1" /></li>
			<li><img src="${path}/img/main_slide_img2.jpg" alt="슬라이드2" /></li>
			<li><img src="${path}/img/main_slide_img3.jpg" alt="슬라이드3" /></li>
		</ul>

		<!-- 슬라이드 영역 위에 있는 30% 이벤트 배너영역  -->
		<div>
			<img src="${path}/img/main_banner_txt.png" alt="Grand Open" /> <img
				src="${path}/img/main_banner_tit.png" alt="30% 할인 이벤트..." /> <img
				src="${path}/img/main_banner_img.png" alt="과일이미지" />
		</div>

	</article>

	<!-- 바로가기 배너영역 -->
	<article class="quick">
		<a href="#"><img src="${path}/img/main_banner_sub1_tit.png" alt="오늘의 식단" /></a>
		<a href="#"><img src="${path}/img/main_banner_sub2_tit.png" alt="나도 요리사" /></a>
	</article>

	<!-- 최신글 리스트 영역 -->
	<article class="latest">
		<div>
			<a href="#"><img src="${path}/img/main_latest1_tit.png" alt="텃밭가꾸기" /></a> <img
				src="${path}/img/main_latest1_img.jpg" alt="열매이미지" />
			<table>
				<c:forEach var="article" items="${latests1}">
					<tr>
						<td>></td>
						<td>${article.title }</td>
						<td>${article.rdate }
				</c:forEach>
			</table>
		</div>

		<div>
			<a href="#"><img src="${path}/img/main_latest2_tit.png" alt="텃밭가꾸기" /></a> <img
				src="${path}/img/main_latest2_img.jpg" alt="열매이미지" />
			<table>
				<c:forEach var="article" items="${latests2}">
					<tr>
						<td>></td>
						<td>${article.title }</td>
						<td>${article.rdate }</td>
				</c:forEach>
			</table>

		</div>

		<div>
			<a href="#"><img src="img/main_latest3_tit.png" alt="텃밭가꾸기" /></a> <img
				src="img/main_latest3_img.jpg" alt="열매이미지" />
			<table>
				<c:forEach var="article" items="${latests3}">
					<tr>
						<td>></td>
						<td>${article.title }</td>
						<td>${article.rdate }
				</c:forEach>
			</table>
		</div>

	</article>

	<!-- 정보 영역 -->
	<article class="info">

		<!-- 고객센터안내 -->
		<div>
			<img src="img/main_sub2_cs_tit.png" alt="고객센터안내" />
			<div>
				<img src="img/main_sub2_cs_img.png" alt="전화이미지" /> <img
					src="img/main_sub2_cs_txt.png" alt="1666-777" />
				<ul>
					<li>평일: AM 09:00 ~ PM 06:00</li>
					<li>점심: PM 12:00 ~ PM 01:00</li>
					<li>토, 일요일, 공휴일 휴무</li>
				</ul>
			</div>
			<div>
				<a href="#"><img src="img/main_sub2_cs_bt1.png" alt="1:1고객문의" /></a>
				<a href="#"><img src="img/main_sub2_cs_bt2.png" alt="자주묻는 질문" /></a>
				<a href="#"><img src="img/main_sub2_cs_bt3.png" alt="배송조회" /></a>
			</div>
		</div>

		<!-- 계좌안내 -->
		<div>
			<img src="img/main_sub2_account_tit.png" alt="계좌안내" />
			<ul>
				<li>기업은행 123-456789-01-01-012</li>
				<li>국민은행 01-1234-56789</li>
				<li>우리은행 123-456789-01-01-012</li>
				<li>하나은행 123-456789-01-01</li>
				<li>예 금 주 (주)팜스토리</li>
			</ul>
		</div>
		<!-- 탭영역 -->
		<div></div>

	</article>
</section>
<!-- 푸터영역 -->

<%@ include file="./_footer.jsp"%>

