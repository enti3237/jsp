<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String seq = request.getParameter("seq");
	
	Connection conn = DBConfig.getConnection();
	
	// 파일명 찾아오기
	PreparedStatement psmtSelect = conn.prepareStatement(SQL.SELECT_FILE);
	psmtSelect.setString(1, seq);
	
	// 리스트테이블 삭제하기
	PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
	psmt.setString(1, seq);

	// 파일테이블 삭제하기
	PreparedStatement psmtFile = conn.prepareStatement(SQL.DELETE_FILE);
	// BOARD_FILE의 값을 읽는 게 아니라 ?가 붙은 행에 값을 붙이는 것이므로 뽑아온 seq가 맞음
	psmtFile.setString(1, seq);
	
	psmt.executeUpdate();
	ResultSet rs = psmtSelect.executeQuery();

	if(rs.next()){
		String newName = rs.getString(4);
		psmtFile.executeUpdate();

		// 파일 스트림 연결해서 저장된 파일 자체를 삭제 (위의 쿼리문은 테이블만 삭제함)
		String path = request.getServletContext().getRealPath("/data");
		File file = new File(path + "/" +newName);
		file.delete();
		
	}
	
	rs.close();
	psmt.close();
	psmtSelect.close();
	psmtFile.close();
	conn.close();
	
	response.sendRedirect("/Board1/list.jsp");

%>
