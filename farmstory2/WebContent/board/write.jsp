<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../_header.jsp"%>
<jsp:include page="./_aside_${boardGroup}.jsp" />
<!-- 표현언어는 태그요소에만 적용 -->

<div id="board">
	<h3>글쓰기</h3>
	<div class="write">
		<form action="#" method="post">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" placeholder="제목을 입력하세요." required /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="20" required></textarea></td>
				</tr>
				<tr>
					<td>첨부</td>
					<td><input type="file" name="file" /></td>
				</tr>
			</table>
			<div class="btns">
				<a href="${path }/board/list.do?group=${boardGroup}&cate=${category}" class="cancel">취소</a> 
				<input type="submit" class="submit" value="작성완료" />
			</div>
		</form>
	</div>
</div>

<%@ include file="../_footer.jsp"%>
