<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp"%>

<section class="sub">
	<div class="bg">
		<img src="../img/sub_top_tit1.png" alt="INTRODUCTION" />
	</div>
	<div>
		<aside>
			<img src="../img/sub_aside_cate1_tit.png" alt="팜스토리소개" />

			<ul class="pg1">
				<li><a href="./hello.do"><strong>인사말</strong></a></li>
				<li class="on"><a href="./direction.do"><strong>찾아오시는길</strong></a>
				</li>
			</ul>

		</aside>

		<article>
			<nav>
				<img src="../img/sub_nav_tit_cate1_tit2.png" alt="찾아오시는 길" /> <span>HOME
					> 팜스토리소개 > <strong>찾아오시는 길</strong>
				</span>
			</nav>

			<!-- 컨텐츠 영역 -->
			<div class="content content2">

				<!-- * Daum 지도 - 지도퍼가기 -->
				<!-- 1. 지도 노드 -->
				<div id="daumRoughmapContainer1485148739046"
					class="root_daum_roughmap root_daum_roughmap_landing"></div>

				<!--
							2. 설치 스크립트
							* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
							-->
				<script charset="UTF-8" class="daum_roughmap_loader_script"
					src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

				<!-- 3. 실행 스크립트 -->
				<script charset="UTF-8">
					new daum.roughmap.Lander({
						"timestamp" : "1485148739046",
						"key" : "fjct",
						"mapWidth" : "760",
						"mapHeight" : "400"
					}).render();
				</script>

			</div>

		</article>
	</div>
</section>
<!-- 푸터영역 -->

<%@ include file="../_footer.jsp" %>