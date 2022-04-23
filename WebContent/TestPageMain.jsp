<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("test3", "yes");
request.setAttribute("test4", "no");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Test First Page</h2>
	<form action="TestPageSub.jsp" name="reg_form" method="post">
		<input type='text' name="test1" value='' />
		<input type='text' name="test1" value='' />
		<input type='text' name="test2" value='' />
		<input type='text' name="test3" value='' /> 
		<input type='text' name="test4" value='' /> 
		<input type='text' name="test5" value='' /> 
		<input type='text' name="test6" value='' /> 
		<input type='text' name="test7" value='' /> 
		 <input type='submit' value="출력" />
	</form>
</body>
</html>