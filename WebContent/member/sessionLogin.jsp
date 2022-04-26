<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
    if(id.equals(pw)){
    	session.setAttribute("MEMBERID", id);
  
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
    }
    else{ 
%>
<script type="text/javascript">
	alert("로그인 실패");
	history.go(-1);
</script>
<%
    }
%>