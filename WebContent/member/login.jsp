<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="util.Cookies"%>
<% 
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    if(id.equals(pw)){
    	response.addCookie(Cookies.createCookie("AUTH", id, "/",-1));
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>로그인 성공


</body>
</html>

<% 
}else {
%>
<script>
	alert("로그인 실패");
	history.go(-1);
</script>
<% }
%>