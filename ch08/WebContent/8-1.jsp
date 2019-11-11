<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>8-1</title>
</head>
<body>
	<h3>1. 자바빈</h3>
	

	<h4>회원가입</h4>
	<form action="./8-2.jsp" method="get">
		<table border="1">
			<tr>
				<td>Name</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>
					<label><input type="radio" name="gender" value="1"/>Male</label>	
					<label><input type="radio" name="gender" value="2"/>FeMale</label>	
				</td>
			</tr>
			<tr>
				<td>Hobby</td>
				<td>
					<label><input type="checkbox" name="hobby" value="Climbing"/>Climbing</label>	
					<label><input type="checkbox" name="hobby" value="Travel"/>Travel</label>	
					<label><input type="checkbox" name="hobby" value="Movie"/>Movie</label>	
					<label><input type="checkbox" name="hobby" value="Sports"/>Sports</label>	
					<label><input type="checkbox" name="hobby" value="Reading"/>Reading</label>	
				</td>
			</tr>
			<tr>
				<td>Address</td>
				<td>
					<select name="addr">
						<option>Seoul</option>
						<option>Daejeon</option>
						<option>Daegu</option>
						<option>Busan</option>
						<option>Gwangju</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="Sign in"/>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>