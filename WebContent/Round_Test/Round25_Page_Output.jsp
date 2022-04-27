<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	initParam ipAddress : ${ initParam.ipAddress }
	<br />
	<br /> Application URL : ${ applicationScope.url}
	<br />
	<br /> session id : ${ sessionScope.id}
	<br /> session pw : ${ sessionScope.pw }
	<br />
	<br /> 0번 과목 : ${ sessionScope.subject[0] }
	<br /> 1번 과목 : ${ sessionScope.subject[1] }
	<br /> 2번 과목 : ${ sessionScope.subject[2] }
	<br /> 0번 선택 내용 : ${ paramValues.language[0]}
	<br /> 1번 선택 내용 : ${ paramValues.language[1]}
	<br /> 2번 선택 내용 : ${ paramValues.language[2]}
	<br />

</body>
</html>