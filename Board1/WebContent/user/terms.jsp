<%@page import="kr.co.board1.bean.BoardTermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
/* 
	request.setCharacterEncoding("UTF-8");
	
	// 4단계
	String terms = "SELECT `terms` FROM `BOARD_TERMS`;";
	String privasy = "SELECT `privacy` FROM `BOARD_TERMS`;";
	
	// 5단계
	// 6단계
*/

	String host = "jdbc:mysql://192.168.44.9/ljy";
	String user = "ljy";
	String pass = "1234";
	 
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	Statement stmt = conn.createStatement();

	String sql = "SELECT * FROM `BOARD_TERMS`;";
	ResultSet rs = stmt.executeQuery(sql);
	
// 	ResultSet rs = stmt.executeQuery("SELECT * FROM `BOARD_TERMS`;");

	// 5단계는  if or while문
	
	BoardTermsBean btb = new BoardTermsBean();
		
	if (rs.next()){
		btb.setTerms(rs.getString(1));
		btb.setPrivacy(rs.getString(2));
	}
	
	rs.close();
	stmt.close();
	conn.close();

%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>회원약관</title>
		<link rel="stylesheet" href="/Board1/css/style.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/Board1/js/termsCheck.js"></script>
		
		
	</head>

	<body>
		<div id="terms">
			<section>
				<table>
					<caption>사이트 이용약관</caption>
					<tr>
						<td>
							<textarea readonly>
							<%= btb.getTerms() %>
							</textarea>
							<div>
								<label><input type="checkbox" name="chk1" />&nbsp;동의합니다.</label>        
							</div>
						</td>
					</tr>
				</table>
			</section>			
			<section>
				<table>
					<caption>개인정보 취급방침</caption>
					<tr>
						<td>
							<textarea readonly>
							<%= btb.getPrivacy() %>
							</textarea>
							<div>
								<label><input type="checkbox" name="chk2" />&nbsp;동의합니다.</label>        
							</div>
						</td>
					</tr>
				</table>
			</section>
			
			<div>
				<a href="#" class="btnCancel">취소</a>
				<a href="/Board1/user/register.jsp" class="btnNext">다음</a>
			</div>
			
		</div>
	</body>
</html>











