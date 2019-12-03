<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.farmstory.bean.BoardArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
/* 	// 세션에 저장된 데이터를 bmb로 도로 빼낸다 - 다운캐스팅 시켜야함
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	
	if(bmb == null){										// 로그인을 안했으면
		response.sendRedirect("/farmstory/user/login.jsp");	// 로그인 페이지로 이동하고
		return;												// 여기까지만 프로그램 실행
	}
*/

	request.setCharacterEncoding("UTF-8");
	
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String pg = request.getParameter("pg");

	// 로그인해서 리스트로 바로 들어왔을 경우 = pg 값이 리퀘스트 되지 않는 경우의 대비
	if(pg == null){	pg = "1";}
	// 리스트로 바로 들어왔을 때 그룹명이 없으면 메인화면으로 보내고 싶다 왜 안되지
	if(group == null){
		response.sendRedirect("/farmstory");
	}
	
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
	psmt.setString(1, cate);
	psmt.setInt(2, limitBegin);		// 매핑 - LIMIT ?, 10; 의 ? 
			
	// Statement stmt = conn.createStatement();
	// 쿼리문을 수정하고 Statement를 Prepared로 바꾼다
	// 카테고리별로 게시판을 나눴을 때 글번호와 아래에 뜨는 페이지번호 정리용(안하면 전체게시글 기준으로 뜬다)
	PreparedStatement psmtTotal = conn.prepareStatement(SQL.SELECT_ARTICLE_TOTAL);
	psmtTotal.setString(1, cate);
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	ResultSet rsTotal = psmtTotal.executeQuery();
	
	// 5단계
	List<BoardArticleBean> articleList = new ArrayList<>();
	
	if(rsTotal.next()){
		
		total = rsTotal.getInt(1);
		
		if(total%10 != 0){
			lastPage = total / 10 + 1;
		} else {
			// 10으로 딱 나누어 떨어질 경우 마지막 페이지가 하나 더 생기는 걸 방지
			lastPage = total / 10 ;
		}		
		if(groupEnd > lastPage){
			// groupEnd가 딱 떨어지지 않을 경우
			groupEnd = lastPage;
		}
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
	
	// include 주소는 여기서도 절대값으로 못 읽음
	String asideView = "./_aside_"+group+".jsp";
%>

<%@ include file="../_header.jsp" %>
<!-- include tag 사용 시 param 으로 필요한 변수값을 넘긴 후 해당페이지에서 getParameter를 실행한다 -->
<jsp:include page="<%= asideView %>">
	<jsp:param name="cate" value="<%=cate%>"/>
</jsp:include>

<div id="board">
	<!-- 리스트 -->
	<div class="list">
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
				<td><a href="/farmstory/board/view.jsp?seq=<%= bab.getSeq() %>&pg=<%= pg %>&group=<%= group %>&cate=<%= cate %>"><%= bab.getTitle() %></a>&nbsp;[<%= bab.getComment() %>]</td>
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
		<a href="/farmstory/board/list.jsp?pg=<%= groupStart - 1 %>&cate=<%= cate %>&group=<%= group %>" class="prev">이전</a>
		<% } %>

		<% for(int p=groupStart ; p<=groupEnd ; p++){ %>
			<a href="/farmstory/board/list.jsp?pg=<%= p %>&cate=<%= cate %>&group=<%= group %>" class="num <%= (currentPg == p)? "current" : "" %>" ><%= p %></a>
		<%	}	%>

		<!-- groupEnd(10, 20, 30...)가 lastPage보다 작아야 다음 버튼이 출력된다 -->
		<% if(groupEnd < lastPage){ %>
		<a href="/farmstory/board/list.jsp?pg=<%= groupEnd + 1 %>&cate=<%= cate %>&group=<%= group %>" class="next">다음</a>
		<% } %>
		
		</span>
	</nav>
	<a href="/farmstory/board/write.jsp?cate=<%= cate %>&group=<%= group %>" class="btnWrite">글쓰기</a>
</div>

<%@ include file="../_right.jsp" %>
<%@ include file="../_footer.jsp" %>