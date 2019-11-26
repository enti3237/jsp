<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String seq = request.getParameter("seq");
	String comment = request.getParameter("comment");
	String nickName = request.getParameter("nick");
	String regip = request.getRemoteAddr();
	
	// 세션에서 사용자정보 가져오기
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	String uid  = bmb.getUid();
	String nick = bmb.getNick();
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
		
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
	psmt.setString(1, seq);
	psmt.setString(2, comment);
	psmt.setString(3, uid);
	psmt.setString(4, regip);
	
	PreparedStatement psmtComment = conn.prepareStatement(SQL.UPDATE_COMMENT_COUNT);
	psmtComment.setString(1, seq);
	
	
	// 4단계
	int result = psmt.executeUpdate();
	psmtComment.executeUpdate();
	
	// 5단계
	// 6단계
	psmt.close();
	psmtComment.close();
	conn.close();

	// 글보기페이지로 이동
	// response.sendRedirect("/Board1/view.jsp?seq="+seq);
	
	// 결과값 전송
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	String rdate = sdf.format(new Date());
	
	JSONObject json = new JSONObject();
	json.put("result", result);
	json.put("nick", nick);
	json.put("rdate", rdate);
	json.put("comment", comment);
	
	out.print(json);
%>
