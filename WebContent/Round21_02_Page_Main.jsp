<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.getParameter("utf-8");
String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<center>
		<h2>환영</h2>
		<%
		if (id.equals("1")) {
			pageContext.include("Round21_02_Page_Main_Sub_For_Manager.jsp", true);
		} else {
			pageContext.include("Round21_02_Page_Main_Sub_For_Guest.jsp", true);
		}
		%>
	</center>
</body>
</html>