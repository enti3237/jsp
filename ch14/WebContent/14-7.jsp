<%-- 컨텐츠 타입 : text/html, text/plain, text/xml, application/json  --%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	JSONObject json = new JSONObject();
	json.put("k1","김유신");
	json.put("k2","김춘추");
	json.put("k3","장보고");
	json.put("k4","강감찬");
	json.put("k5","이순신");

	out.print(json);

%>
