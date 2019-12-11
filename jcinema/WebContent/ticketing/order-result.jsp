<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp"%>

<div id="sub" class="order-result">

	<nav class="sub-menu"></nav>

	<section>

		<div class="save-point">
			<h1>결제완료</h1>

			<p>
				<strong>홍길동</strong>회원님, 주문이 성공적으로 완료 되었습니다.<br> 포인트 적립을 원하실 경우
				아래 항목을 입력하여 주십시오.
			</p>

			<h2>포인트 적립</h2>
			<article>
				<label><input type="radio" name="check" checked>로그인한
					L.POINT 아이디로 적립</label>
				<div class="member checked">
					<p>
						<span class="name">홍길동</span> 회원님의 L.POINT 아이디로 적립됩니다.
					</p>
				</div>
				<label><input type="radio" name="check">카드번호 입력하여 적립</label>
				<div class="card">
					<span>카드번호</span> <input type="text" name="num1" disabled>&nbsp;-&nbsp;
					<input type="text" name="num2" disabled>&nbsp;-&nbsp; <input
						type="text" name="num3" disabled>&nbsp;-&nbsp; <input
						type="text" name="num4" disabled>
				</div>

				<div class="btn">
					<a href="#">포인트 카드 신청</a> <a href="#">적립하기</a> <a href="#">적립안함</a>
				</div>

				<p>
					<strong>이용안내</strong> ·&nbsp;롯데시네마 관람권 구매, 제휴 모바일 쿠폰사용에 대한 건은 포인트가
					적립되지 않습니다.<br> ·&nbsp;포인트별 적립내용은 다음과 같습니다.<br>
					·&nbsp;L.POINT카드 또는 롯데 신용카드 번호 입력시 회원등급에 따라 차등 적립 됩니다. 단, 미등록 카드번호
					입력시 결제금액의 0.1%가 적립됩니다.<br>
				</p>

			</article>
		</div>
	</section>
</div>

<%@ include file="../_footer.jsp"%>