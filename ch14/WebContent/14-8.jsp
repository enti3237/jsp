<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	JSONArray jrr = new JSONArray();

	JSONObject json1 = new JSONObject();
	json1.put("name", "사과");
	json1.put("price", "2000");
	json1.put("origin", "한국");

	JSONObject json2 = new JSONObject();
	json2.put("name", "바나나");
	json2.put("price", "1000");
	json2.put("origin", "대만");

	JSONObject json3 = new JSONObject();
	json3.put("name", "오렌지");
	json3.put("price", "3000");
	json3.put("origin", "미국");

	jrr.add(json1);
	jrr.add(json2);
	jrr.add(json3);
	
	JSONObject jbj = new JSONObject();
	jbj.put("fruit", jrr);

	out.print(jbj);
%>
