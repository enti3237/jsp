<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String path = request.getServletContext().getRealPath("/data");
	
	int maxSize = 1024 * 1024 * 10;	// 10MB

	// multipart 폼데이터(첨부파일)을 전송받는 mr 객체
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());

	// form의 enctype형식에 따라 multipart로 넘어오는 데이터는 일반 request로 받지 못함
	String cate 	= mr.getParameter("cate");
	String group	= mr.getParameter("group");
	String title    = mr.getParameter("subject");
	String content  = mr.getParameter("content");
	String fileName = mr.getFilesystemName("file");
	String regip = request.getRemoteAddr();
	
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	String uid = bmb.getUid();
	
	if(fileName != null){
		
		// 1) 코드화된 파일명 생성(UUID : Universal Unique ID)
		int idx = fileName.lastIndexOf(".");	// lastIndexOf로 뒤에서부터 .을 찾은 후 인덱스값을 구한다 = 4
		String ext = fileName.substring(idx);	// 인덱스넘버 4부터 잘라낸다 (=남은 것은 . 뒤의 확장자 3자리 뿐)

		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
		String now = sdf.format(new Date());	// 상기 구성대로 지금 시간을 구한다
		
		String newFileName = now + uid + ext;	// 20191126111925_a101.txt
		
		// 2) 저장된 첨부 파일명 수정

		File oldFile = new File(path+"/"+fileName);
		File newFile = new File(path+"/"+newFileName);
		
		oldFile.renameTo(newFile);

		// 3) 원본 파일명과 코드화된 파일명을 테이블에 저장 및 글 등록
		
			// 1, 2단계
			Connection conn = DBConfig.getConnection();
			
			// 트랜잭션 시작 - 잘못되면 다시 시작해야하기 때문에 4단계 위가 아닌 3단계 위에서 시작한다
			conn.setAutoCommit(false);
			
			// 3단계
			PreparedStatement psmt1 = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt1.setInt(1, 0); 		// parent
			psmt1.setString(2, cate); // cate
			psmt1.setString(3, title); 	// title
			psmt1.setString(4, content);// content
			psmt1.setInt(5, 1); 		// file 첨부상태
			psmt1.setString(6, uid); 	// uid
			psmt1.setString(7, regip); 	// regip
			
			Statement stmt = conn.createStatement();
			
			// 4단계
			psmt1.executeUpdate();
			ResultSet rs = stmt.executeQuery(SQL.SELECT_MAX_SEQ);
							
			// 5단계
			int parent = 0;
			if(rs.next()){
				parent = rs.getInt(1);
			}

			PreparedStatement psmt2 = conn.prepareStatement(SQL.INSERT_FILE);
			psmt2.setInt(1, parent);
			psmt2.setString(2, fileName);
			psmt2.setString(3, newFileName);

			psmt2.executeUpdate();
			
			// 트랜잭션 끝 (혹시 모를 동시업로드 방지)
			conn.commit();
			
			// 6단계
			
			rs.close();
			psmt2.close();
			psmt1.close();
			stmt.close();
			conn.close();
			

	} else {

		// 4) 글 등록
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);	
		psmt.setInt(1, 0); 			// parent
		psmt.setString(2, cate); 	// cate
		psmt.setString(3, title); 	// title
		psmt.setString(4, content);	// content
		psmt.setInt(5, 0); 			// file
		psmt.setString(6, uid); 	// uid
		psmt.setString(7, regip); 	// regip
		
		psmt.executeUpdate();

		psmt.close();		
		conn.close();
		
	}


	response.sendRedirect("/farmstory/board/list.jsp?cate="+cate+"&group="+group);
%>
