<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 파라미터 수신
	String uid = request.getParameter("uid");
	String pw  = request.getParameter("pass");

	// 1, 2단계 + DB 정보
	Connection conn = DBConfig.getConnection();

	// 3단계	
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LOGIN);
	psmt.setString(1, uid);
	psmt.setString(2, pw);
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	
	// 5단계
	if(rs.next()){
		// 입력한 아이디, 비밀번호를 가진 회원이 있으면
		
		// 신규 자바빈 객체를 생성하여 얻어온 데이터베이스의 정보를 저장한다
		BoardMemberBean bmb = new BoardMemberBean();
		bmb.setUid(rs.getString(1));
		bmb.setPass(rs.getString(2));
		bmb.setName(rs.getString(3));
		bmb.setNick(rs.getString(4));
		bmb.setEmail(rs.getString(5));
		bmb.setHp(rs.getString(6));
		bmb.setGrade(rs.getInt(7));
		bmb.setZip(rs.getString(8));
		bmb.setAddr1(rs.getString(9));
		bmb.setAddr2(rs.getString(10));
		bmb.setRegip(rs.getString(11));
		bmb.setRdate(rs.getString(12));
		
		// 세션에 사용자 정보객체 저장
		session.setAttribute("member", bmb);

		// 리스트페이지 이동
		response.sendRedirect("/farmstory");
//		if(rs.getString(1).equals(uid) || rs.getString(2).equals(pw)){}
	} else {

		// 입력한 아이디, 비밀번호를 가진 회원이 없으면
		// 실패상황에 대처하기 위한 코드를 하나 뒤에 ?로 붙여줌
		response.sendRedirect("/farmstory/user/login.jsp?code=101");
	} 
	
	// 6단계
	rs.close();
	psmt.close();
	conn.close();
	
%>
