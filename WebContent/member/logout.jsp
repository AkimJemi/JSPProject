<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="util.Cookies"%>
<%
response.addCookie(Cookies.createCookie("AUTH", ",", "/", 0));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>로그아웃 됨
</body>
</html>