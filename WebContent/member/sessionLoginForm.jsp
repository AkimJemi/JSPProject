<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="post" action="<%=request.getContextPath()%>/member/sessionLogin.jsp">
아이디 : <input type="text" name="id" />
암호 : <input type="pw" name="pw" />
<input type="submit"  value="로그인"/>
</form>
</body>
</html>