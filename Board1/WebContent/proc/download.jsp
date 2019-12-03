<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

	request.setCharacterEncoding("UTF-8");
	String parent = request.getParameter("parent");
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();

	// 3단계
	PreparedStatement psmtSelect = conn.prepareStatement(SQL.SELECT_FILE);
	psmtSelect.setString(1, parent);
	
	PreparedStatement psmtUpdate = conn.prepareStatement(SQL.UPDATE_FILE_COUNT);
	psmtUpdate.setString(1, parent);
	
	// 4단계
	ResultSet rs = psmtSelect.executeQuery();
		// 이건 안 받아도 됨 성공여부가 1, 0로 표시된다
	int result   = psmtUpdate.executeUpdate();
	
	// 5단계
	
	String newName = null;
	String oldName = null;
	
	if(rs.next()){
		
		oldName = rs.getString(3);
		newName = rs.getString(4);
		
	}
	
	// 6단계
	rs.close();
	psmtSelect.close();
	psmtUpdate.close();
	conn.close();
	
	// 파일이 저장되는 절대주소와 변경된 파일명(newName)을 찾는다
	String path = request.getServletContext().getRealPath("/data");
	File file   = new File(path + "/" + newName);

	// response 준비 (복붙)
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(oldName, "utf-8") + ";");
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");

	// 다운로드 파일을 responce 객체 내용에 설정하기
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

	while(true){
		
		int data = bis.read();
		if(data == -1){
			break;
		}
		bos.write(data);
	}
	
	bos.close();
	bis.close();
	
%>