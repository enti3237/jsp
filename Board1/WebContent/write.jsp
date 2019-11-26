<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String pg  = request.getParameter("pg");
	// list.jsp에서 페이지 값을 받아와서 다시 list로 나갈 때 그 자리로 돌아가기

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글쓰기</title> 
		<link rel="stylesheet" href="/Board1/css/style.css" />
	</head>
	<body>
		<div id="board">
			<h3>글쓰기</h3>
			<div class="write">
				<form action="/Board1/proc/writeProc.jsp" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" placeholder="제목을 입력하세요." required /></td>
						</tr>				
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" required></textarea>
							</td>
						</tr>
						<tr>
							<td>첨부</td>
							<td>
								<input type="file" name="file" />
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="/Board1/list.jsp?pg=<%= pg %>" class="cancel">취소</a>
						<input type="submit" class="submit" value="작성완료" />
					</div>
				</form>
			</div>
		</div>
	</body>
</html>


