<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 데이터를 bmb로 도로 빼낸다 - 다운캐스팅 시켜야함
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글목록</title> 
		<link rel="stylesheet" href="/Board1/css/style.css" />
	</head>
	<body>
		<div id="board">
			<h3>글목록</h3>
			<!-- 리스트 -->
			<div class="list">
				<p class="logout"><%= bmb.getNick() %>님! 반갑습니다. <a href="/Board1/user/logout.jsp">[로그아웃]</a><p>
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>조회</td>
					</tr>
				
					<tr>
						<td>1</td>
						<td><a href="#">테스트 제목입니다.</a>&nbsp;[3]</td>
						<td>홍길동</td>
						<td>18-03-01</td>
						<td>12</td>
					</tr>
				</table>
			</div>
			<!-- 페이징 -->
			<nav class="paging">
				<span> 
				<a href="#" class="prev">이전</a>
				<a href="#" class="num">1</a>
				<a href="#" class="next">다음</a>
				</span>
			</nav>
			<a href="/Board1/write.jsp" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>