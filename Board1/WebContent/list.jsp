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
	int total 	   = 0;
	int lastPage   = 0;
	int currentPg  = Integer.parseInt(pg);
	int limitBegin = (currentPg - 1) * 10;
	int listCount  = 0;
	int groupCurrent = (int)Math.ceil(currentPg / 10.0); // 1/10=0.0123이 될 값을 올림해서 1로 만들고 그루핑한다
	int groupStart   = (groupCurrent - 1) * 10 + 1;
	int groupEnd     = groupStart + 9 ;
	
	
	// 1,2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_LIST);
	psmt.setInt(1, limitBegin);		// 매핑 - LIMIT ?, 10; 의 ? 
			
	Statement stmt = conn.createStatement();
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	ResultSet rsTotal = stmt.executeQuery(SQL.SELECT_ARTICLE_TOTAL);
	
	// 5단계
	List<BoardArticleBean> articleList = new ArrayList<>();
	
	if(rsTotal.next()){
		
		total = rsTotal.getInt(1);
		
		if(total%10 != 0){
			lastPage = total / 10 + 1;
		} else {
			lastPage = total / 10 ;
		}
		// 10으로 딱 나누어 떨어질 경우 마지막 페이지가 하나 더 생기는 걸 방지
		
		if(groupEnd > lastPage){
			groupEnd = lastPage;
		}
		// groupEnd가 딱 떨어지지 않을 경우
	
		
		listCount = total - limitBegin;
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

	// 6단계
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
						<td><%= listCount-- %></td>
						<td><a href="/Board1/view.jsp?seq=<%= bab.getSeq() %>&pg=<%= pg %>"><%= bab.getTitle() %></a>&nbsp;[<%= bab.getComment() %>]</td>
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

				<!-- groupStart(1, 11, 21...)가 1보다 커야 이전 버튼이 출력된다 -->
				<% if(groupStart > 1){ %>
				<a href="/Board1/list.jsp?pg=<%= groupStart - 1 %>" class="prev">이전</a>
				<% } %>

				<% for(int p=groupStart ; p<=groupEnd ; p++){ %>
					<a href="/Board1/list.jsp?pg=<%= p %>" class="num <%= (currentPg == p)? "current" : "" %>" ><%= p %></a>
				<%	}	%>

				<!-- groupEnd(10, 20, 30...)가 lastPage보다 작아야 다음 버튼이 출력된다 -->
				<% if(groupEnd < lastPage){ %>
				<a href="/Board1/list.jsp?pg=<%= groupEnd + 1 %>" class="next">다음</a>
				<% } %>
				
				</span>
			</nav>
			<a href="/Board1/write.jsp?pg=<%= pg %>" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>