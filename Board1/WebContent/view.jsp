<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.board1.bean.BoardArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");

	// 로그인을 안했으면 로그인 페이지로 이동
	if(bmb == null){
		response.sendRedirect("/Board1/user/login.jsp");
		return;		// 여기서 프로그램 실행을 멈춘다 (안 쓰면 response 명령이 제일 나중에 실행되어 에러남)
	}

	String seq = request.getParameter("seq");
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 트랜잭션 시작 (중복데이터 입력 시 누락 방지)
	conn.setAutoCommit(false);

	// 3단계
	PreparedStatement psmtView = conn.prepareStatement(SQL.SELECT_ARTICLE_VIEW);
	psmtView.setString(1, seq);
	
	PreparedStatement psmtHit = conn.prepareStatement(SQL.UPDATE_ARTICLE_HIT);
	psmtHit.setString(1, seq);
	
	PreparedStatement psmtComment = conn.prepareStatement(SQL.SELECT_COMMENT_LIST);
	psmtComment.setString(1, seq);
	
	// 4단계
	ResultSet rs = psmtView.executeQuery();
	ResultSet rsComment = psmtComment.executeQuery();
	psmtHit.executeUpdate();
	
	// 트랜잭션 끝 (실행)
	conn.commit();
	
	// 5단계
	BoardArticleBean bab = new BoardArticleBean();
	
	if(rs.next()){
		bab.setSeq(rs.getInt(1));
		bab.setParent(rs.getInt(2));
		bab.setComment(rs.getInt(3));
		bab.setCate(rs.getString(4));
		bab.setTitle(rs.getString(5));
		bab.setContent(rs.getString(6));
		bab.setFile(rs.getInt(7));
		bab.setHit(rs.getInt(8));
		bab.setUid(rs.getString(9));
		bab.setRegip(rs.getString(10));
		bab.setRdate(rs.getString(11));
	}
	
	List<BoardArticleBean> commentList = new ArrayList<>();
	
	while(rsComment.next()){
		
		BoardArticleBean comment = new BoardArticleBean();
		comment.setSeq(rsComment.getInt(1));
		comment.setParent(rsComment.getInt(2));
		comment.setComment(rsComment.getInt(3));
		comment.setCate(rsComment.getString(4));
		comment.setTitle(rsComment.getString(5));
		comment.setContent(rsComment.getString(6));
		comment.setFile(rsComment.getInt(7));
		comment.setHit(rsComment.getInt(8));
		comment.setUid(rsComment.getString(9));
		comment.setRegip(rsComment.getString(10));
		comment.setRdate(rsComment.getString(11));
		
		commentList.add(comment);
	}
	
	// 6단계
	rs.close();
	psmtView.close();
	psmtHit.close();
	conn.close();

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글보기</title> 
		<link rel="stylesheet" href="/Board1/css/style.css" />
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>	
	</head>
	
	
	<body>
		<div id="board">
			<h3>글보기</h3>
			<div class="view">
				<form action="#" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="<%= bab.getTitle() %>" readonly />
							</td>
						</tr>
						
						<% if(bab.getFile() == 1){ %>
						<tr>
							<td>첨부파일</td>
							<td>
								<a href="#">테스트.hwp</a>
								<span>3회 다운로드</span>
							</td>
						</tr>
						<% } %>

						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" readonly><%= bab.getContent() %></textarea>
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="/Board1/proc/deleteProc.jsp?seq=<%= seq %>" class="cancel del">삭제</a>
						<a href="/Board1/modify.jsp?seq=<%= seq %>" class="cancel mod">수정</a>
						<a href="/Board1/list.jsp" class="cancel">목록</a>
					</div>
				</form>
			</div>
			<!-- view 끝 -->
			
			<!-- 댓글리스트 -->
			<section class="comments">
				<h3>댓글목록</h3>
				
				<% for(BoardArticleBean comment : commentList){ %>
				<div class="comment">
					<span>
						<span><%= comment.getUid() %></span>
						<span><%= comment.getRdate().substring(2, 10) %></span>
					</span>
					<textarea><%= comment.getContent() %></textarea>
					<div>
						<a href="#" class="del">삭제</a>
						<a href="#" class="mod">수정</a>
					</div>
				</div>
				<% } %>

				<% if(commentList.size() == 0){ %>			
				<p class="empty">
					등록된 댓글이 없습니다.
				</p>
				<% } %>
				
			</section>
			
			<!-- 댓글쓰기 -->
			<section class="comment_write">
				<h3>댓글쓰기</h3>
				<div>
					<form action="/Board1/proc/commentProc.jsp" method="post">
						<input type="hidden" name="seq" value="<%= bab.getSeq() %>">
						<textarea name="comment" rows="5"></textarea>
						<div class="btns">
							<a href="#" class="cancel">취소</a>
							<input type="submit" class="submit" value="작성완료" />
						</div>
					</form>
				</div>
			</section>
		<script>
			$(document).ready(function(){
				
				$('.comment_write input[type=submit]').click(funtion(e){
					e.preventDefault();			// 클릭했을 때 submit의 액션(=페이지 이동)을 차단한다
					
					// 태그객체생성
					var comments = $('section.comments');
					
					// 전송할 데이터 수집
					var input    = $('.comment_write input[name=seq]');
					var textarea = $('.comment_write textarea]');
					
					var seq     = input.val();
					var comment = textarea.val();
					
					// 데이터 유효성 검사 (null 아님)
					if(comment == ''){
						alert('댓글을 입력하십시오.');
						return; 
					}
					
					var json = {"seq":seq, "comment":comment};
					
					$.ajax({
						url : '/Board1/proc/commentProc.jsp',
						type : 'post',
						data : json, 
						dataType : 'json',
						success : function(data){
							textarea.val('');
							
						}
					});
				});
			});
		
		</script>
		
	</div>
	<!-- board 끝 -->
	
	
</body>

</html>
