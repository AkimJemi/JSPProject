<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    application.setAttribute("url", request.getRequestURI());
    session.setAttribute("id", "kimsh");
    session.setAttribute("pw", "1234");
    String[] subject = new String[] {"국어", "영어", "수학"};
    session.setAttribute("subject", subject);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="post" action="Round25_Page_Output.jsp">
이름 : <input type="text" name="name" /> <br/>
주소 : <input type="text" name="name" /> <br/>
선택 : <input type="checkbox" name="language" value="c" />C언어 
&nbsp;<input type="checkbox" name="language" value="java" />java 
&nbsp;<input type="checkbox" name="language" value="basic" />basic
<br/>
<input type="submit"  value="전송"/>
</form>
</body>
</html>