<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글목록</title> 
		<link rel="stylesheet" href="/Board2/css/style.css" />
	</head>
	<body>
		<div id="board">
			<h3>글목록</h3>
			<!-- 리스트 -->
			<div class="list">
				<p class="logout">${member.nick}님! 반갑습니다. <a href="/Board2/user/logout.do">[로그아웃]</a><p>
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>조회</td>
					</tr>
					
					<c:forEach var="a" items="${articleList}">
					<tr>
						<td>${listCount=listCount-1}</td>
						<td><a href="#">${a.title}</a>&nbsp;[${a.comment}]</td>
						<td>${a.nick}</td>
						<td>${a.rdate.substring(2,10)}</td>
						<td>${a.hit}</td>
					</tr>
					</c:forEach>
					
				</table>
			</div>
			<!-- 페이징 -->
			<nav class="paging">
				<span> 

				<c:if test="${groupStart}> 1">
				<a href="#" class="prev">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${groupStart}" end="${groupEnd}">
				<a href="/Board2/list.do?pg=${i}" class="num current">${i}</a>
				</c:forEach>

				<c:if test="${groupEnd} < ${lastPage}">
				<a href="#" class="next">다음</a>
				</c:if>

				</span>
			</nav>
			<a href="/Board2/write.do" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>










