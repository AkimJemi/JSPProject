<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String code = request.getParameter("code");
String viewPageURL = null;
if(code.equals("A")){
	viewPageURL = "/viewModule/a.jsp";
}else if(code.equals("B")){
	viewPageURL = "/viewModule/b.jsp";
	
}else if(code.equals("C")){
	viewPageURL = "/viewModule/c.jsp";
}
%>
<jsp:forward page="<%=viewPageURL %>"/>

</body>
</html>