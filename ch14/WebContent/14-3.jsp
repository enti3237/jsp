<%@page import="java.util.ArrayList"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// DB정보
	String host = "jdbc:mysql://192.168.44.9/ljy";
	String user = "ljy";
	String pass = "1234";

	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "SELECT * FROM `MEMBER`;";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	List<MemberBean> list = new ArrayList<>();
	
	while(rs.next()){

		// 매 줄마다 새 콩을 만들어서 한줄의 데이터를 리스트화하고 또 다음줄을 while문으로 콩으로 만든다
		MemberBean mb = new MemberBean();
		
/* 		// 콩의 객체를 생성
		String uid   = rs.getString(1);
		String name  = rs.getString(2);
		String hp    = rs.getString(3);
		String pos   = rs.getString(4);
		int    dep   = rs.getInt(5);
		String rdate = rs.getString(6);
		
		// 리스트에 객체를 집어넣음
		mb.setUid(uid);
		mb.setName(name);
		mb.setHp(hp);
		mb.setPos(pos);
		mb.setDep(dep);
		mb.setRdate(rdate);
 */		
 		// 상단 두문단을 한줄로 압축하기
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));

		list.add(mb);
		
	}
	
	// 6단계
	rs.close();
	stmt.close();
	conn.close();

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>14-3</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>	
	
		$(document).ready(function () {
			// 삭제 클릭
			$('.delete').click(function() {
				var result = confirm("삭제하시겠습니까?"); // 값을 받아야하니 confirm
				if(result){
					return true;	// 링크이동을 실행한다
				} else {
					return false;	// 링크이동을 실행하지 않는다.
				}
			});
			
			// 수정 클릭
			$('.modify').click(function() {
				var result = confirm("수정하시겠습니까?");
				if(result){
					return true;
				} else {
					return false;
				}
			});
		})
	</script>
	
	
</head>
<body>
	<h3>직원목록</h3>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>수정/삭제</th>
		</tr>
		<% 
		for(MemberBean mb : list){ 
		%>
		<tr>
			<td><%= mb.getUid() %></td>
			<td><%= mb.getName() %></td>
			<td><%= mb.getHp() %></td>
			<td><%= mb.getPos() %></td>
			<td><%= mb.getDep() %></td>
			<td><%= mb.getRdate().substring(2, 10) %></td>
			<td>
				<a class="modify" href="./14-5.jsp?uid=<%= mb.getUid()%>">수정</a>
				<a class="delete" href="./14-4.jsp?uid=<%= mb.getUid()%>">삭제</a>
			</td>
		</tr>	
		<% } %>
	</table>
	
	<a href="14-1.jsp">등록하기</a>

</body>
</html>