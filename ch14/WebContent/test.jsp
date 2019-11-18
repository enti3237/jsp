<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>TEST</title>
</head>
<body>
	<h3>TEST</h3>

	<form action="./test-2.jsp" method="get">
		 <table>
		 	<tr>
		 		<td>ID</td>
		 		<td><input type="text" name="uid"></td>
		 	</tr>
		 	<tr>
		 		<td>Name</td>
		 		<td><input type="text" name="name"></td>
		 	</tr>
		 	<tr>
		 		<td>Height</td>
		 		<td><input type="text" name="height"></td>
		 	</tr>
			 <tr>
		 		<td>Age</td>
		 		<td><input type="text" name="age"></td>
		 	</tr>
		 	<tr>
		 		<td>Gender</td>
		 		<td><input type="text" name="gender"></td>
		 	</tr>
		 	<tr>
		 		<td>Color</td>
		 		<td><input type="text" name="color"></td>
		 	</tr>
		 	<tr>
		 		<td>Division</td>
		 		<td><input type="text" name="div"></td>
		 	</tr>
		 	<tr>
		 		<td>Tribe</td>
		 		<td><input type="text" name="tribe"></td>
		 	</tr>
		 	<tr>
		 		<td colspan="2">Character</td>
		 	</tr>
		 	<tr>
		 		<td colspan="2"><textarea name="chara" cols="50" rows="10"></textarea></td>
		 	</tr>
		 	<tr>
		 		<td colspan="2">Secret</td>
		 	</tr>
		 	<tr>
		 		<td colspan="2"><textarea name="secret" cols="50" rows="4"></textarea></td>
		 	</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="Complite">
			</tr>
		 </table>
	</form>

</body>
</html>