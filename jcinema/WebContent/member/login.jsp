<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../_header.jsp"%>

<div id="sub" class="login">
	<section>

		<div>
			<h1>로그인</h1>
			<article>

				<ul class="tab_btn">
					<li class="on"><a href="#">회원</a></li>
					<li><a href="#">비회원</a></li>
					<li><a href="#">소셜로그인</a></li>
				</ul>
				<div class="tab">
					<div class="tab1 on">

						<form action="${path}/member/login" method="POST">
							<div>
								<label><span>아이디</span><input type="text" name="uid"></label>
								<label><span>비밀번호</span><input type="password" name="pass"></label>
							</div>
							<input type="submit" value="로그인">
						</form>
						<p>
							<label><input type="checkbox" name="save_uid">아이디저장</label>
							<a href="#">아이디 찾기</a> <a href="#">비밀번호 찾기</a>
						</p>

						<img class="banner" src="../img/login_side_banner.jpg" alt="">
					</div>

					<div class="tab2">

						<img class="kakao_banner" src="../img/login_banner_kakao.png"
							alt="로그인 없이 바로 예매! 톡티켓으로 바로 입장">

						<p>
							·&nbsp;비회원 로그인 시 예매 및 예매확인/취소 메뉴만 이용 가능하며 관람권, 할인권을 포함한 기타 결제,
							할인수단은 정회원 로그인 시 사용 가능합니다.<br> ·&nbsp;예매확인/취소 시 입력한 정보로만
							확인가능합니다. 입력한 내용을 꼭 확인해주세요.
						</p>

						<textarea cols="30" rows="10">개인정보의 수집목적 및 항목 내용 출력</textarea>

						<label class="agree"><input type="checkbox">&nbsp;동의함</label>

						<div>
							<p>
								·&nbsp;고유번호란 비회원 로그인을 위해 임의로 설정하는 4자리 번호 입니다.<br> ·&nbsp;모든
								항목은 필수 입력 사항입니다.
							</p>
							<form action="#">
								<div>
									<label class="name"><span>이름</span><input type="text"
										name="name"></label> <label class="hp"> <span>휴대폰</span>
										<select name="hp1">
											<option>010</option>
											<option>011</option>
											<option>012</option>
											<option>013</option>
											<option>014</option>
											<option>015</option>
									</select> &nbsp;-&nbsp; <input type="text" name="hp2">
										&nbsp;-&nbsp; <input type="text" name="hp3">
									</label> <label class="birth"> <span>생년월일</span> <select
										name="year">
											<option>선택</option>
											<option>1981</option>
											<option>1982</option>
											<option>1983</option>
									</select> &nbsp;-&nbsp; <select name="month">
											<option>선택</option>
											<option>1</option>
											<option>2</option>
											<option>3</option>
									</select> &nbsp;-&nbsp; <select name="date">
											<option>선택</option>
											<option>29</option>
											<option>30</option>
											<option>31</option>
									</select>
									</label> <label class="pass pass1"><span>고유번호(4자리)</span><input
										type="text" name="pass1"></label> <label class="pass pass2"><span>고유번호
											확인</span><input type="text" name="pass2"></label>
								</div>
								<input type="submit" value="확인">
							</form>
							<img class="banner" src="../img/login_side_banner.jpg" alt="">
						</div>

					</div>
					<div class="tab3">
						<p>
							·&nbsp;회원을 위한 다양한 맞춤 서비스를 이용해보세요.<br>
						</p>

						<a class="naver" href="#"> <span>네이버 계정으로 로그인</span>
						</a>

						<div>
							<a href="#">아이디 찾기</a> <a href="#">비밀번호 찾기</a>
						</div>

						<img class="banner" src="../img/login_side_banner.jpg" alt="">

					</div>
				</div>

			</article>
			<p>
				L.POINT 아이디 하나면, 모든 L.POINT 제휴사의 온라인/모바일을 편리하게 이용할 수 있습니다. <a
					href="#">회원가입</a>
			</p>

		</div>
	</section>
	</section>
</div>


<%@ include file="../_footer.jsp"%>