<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>

<%
/* String paging = request.getParameter("paging"); */


String previousURL = request.getParameter("URL");
	System.out.println("previousURL : " + previousURL);


Map params = request.getParameterMap();
Set s = params.entrySet();
Iterator it = s.iterator();
while (it.hasNext()) {
	Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>) it.next();
	String key = entry.getKey();
	String[] value = entry.getValue();

	if (value.length > 1) {
		for (int i = 0; i < value.length; i++) {
	System.out.println("value : " + value[i].toString());
		}
	} else {
		System.out.println("Key: " + key.toString());
		System.out.println("Value[0]: " + value[0].toString());
	}
}

 pageContext.forward(previousURL);
%>

