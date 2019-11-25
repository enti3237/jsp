<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.board1.bean.BoardArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 데이터를 bmb로 도로 빼낸다 - 다운캐스팅 시켜야함
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	
	if(bmb == null){										// 로그인을 안했으면
		response.sendRedirect("/Board1/user/login.jsp");	// 로그인 페이지로 이동하고
		return;												// 여기까지만 프로그램 실행
	}
	
	request.setCharacterEncoding("UTF-8");
	
	String pg = request.getParameter("pg");
	
	if(pg == null){	pg = "1";}
	// 로그인해서 리스트로 바로 들어왔을 경우 = pg 값이 리퀘스트 되지 않는 경우의 대비
	
	// 페이지 관련 함수
	int total = 0;
	int lastPage = 0;
	int currentPg = Integer.parseInt(pg);
	int limitBegin = (currentPg - 1) * 10;
	
	Connection conn = DBConfig.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_LIST);
	psmt.setInt(1, limitBegin);		// 매핑 - LIMIT ?, 10; 의 ? 
			
	Statement stmt = conn.createStatement();
	
	ResultSet rs = psmt.executeQuery();
	ResultSet rsTotal = stmt.executeQuery(SQL.SELECT_ARTICLE_TOTAL);
	
	List<BoardArticleBean> articleList = new ArrayList<>();
	
	if(rsTotal.next()){
		total = rsTotal.getInt(1);
		lastPage = total / 10 + 1;
	}
	
	while(rs.next()){
		BoardArticleBean bab = new BoardArticleBean();
		
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
		bab.setNick(rs.getString(12));
		
		articleList.add(bab);
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
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
				
					<% for(BoardArticleBean bab : articleList){ %>
					<tr>
						<td><%= bab.getSeq() %></td>
						<td><a href="/Board1/view.jsp?seq=<%= bab.getSeq() %>"><%= bab.getTitle() %></a>&nbsp;[<%= bab.getComment() %>]</td>
						<td><%= bab.getNick() %></td>
						<td><%= bab.getRdate().substring(2,10) %></td>
						<td><%= bab.getHit() %></td>
					</tr>
					<% } %>
				</table>
			</div>
			<!-- 페이징 -->
			<nav class="paging">
				<span> 
				<a href="#" class="prev">이전</a>
				<%
				for(int p=1 ; p<=lastPage ; p++){ %>
					
					<a href="/Board1/list.jsp?pg=<%= p %>" class="num <%= (currentPg == p)? "current" : "" %>" ><%= p %></a>
					
				<%	}	%>


				<a href="#" class="next">다음</a>
				</span>
			</nav>
			<a href="/Board1/write.jsp" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>