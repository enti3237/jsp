<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	BoardMemberBean bmbOut = (BoardMemberBean)session.getAttribute("member");
	
	// 로그인 안했는데 글쓰기 하면 오류가 나서 글 못 쓰게 튕겨내기 ...다른 방법 없나
	if(bmbOut == null){
		response.sendRedirect("/farmstory/user/login.jsp");
		return;
	}

	// include 주소는 여기서도 절대값으로 못 읽음
	String asideView = "./_aside_"+group+".jsp";
	
%>
<%@ include file="../_header.jsp" %>
<!-- include tag 사용 시 param 으로 필요한 변수값을 넘긴 후 해당페이지에서 getParameter를 실행한다 -->
<jsp:include page="<%= asideView %>">
	<jsp:param name="cate" value="<%=cate%>"/>
</jsp:include>
           
<div id="board">
	<h3>글쓰기</h3>
	<div class="write">
		<form action="/farmstory/proc/writeProc.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cate" value="<%= cate %>">
			<input type="hidden" name="group" value="<%= group %>">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" placeholder="제목을 입력하세요." required /></td>
				</tr>				
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" rows="20" required></textarea>
					</td>
				</tr>
				<tr>
					<td>첨부</td>
					<td>
						<input type="file" name="file" />
					</td>
				</tr>
			</table>
			<div class="btns">
				<a href="/farmstory/board/list.jsp?cate=<%= cate %>&group=<%= group %>" class="cancel">취소</a>
				<input type="submit" class="submit" value="작성완료" />
			</div>
		</form>
	</div>
</div>
	
<%@ include file="../_right.jsp" %>
<%@ include file="../_footer.jsp" %>