<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTP-8">
	<title>12-2</title>
</head>

<body>
	<h3> 2.JSTL 라이브러리 태그</h3>
	
	<c:set var ="str" value="Hello Korea"/>
	
	<ul>
		<li>문자열 길이 : ${ fn:length(str) }</li>
		<li>문자열 자르기 : ${ fn:substring(str, 2, 10) }</li>
		<li>${ fn:replace(str,'Korea','Busan') }</li>
		
	</ul>
</body>
</html>