<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import='java.net.URLEncoder'%>
     
     
     <%Cookie cookie1 = new Cookie("id", "madvirus");
     cookie1.setDomain("naver.com");
     response.addCookie(cookie1);
     
     Cookie cookie2= new Cookie("only", "onlycookie");
     response.addCookie(cookie2);
     Cookie cookie3= new Cookie("invalid", "invalidcookie");
     cookie3.setDomain("java.tistory.com");
     response.addCookie(cookie3);
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
다음과  같이 쿠키 생성
<br/>
<%=cookie1.getName() %> = <%=cookie1.getValue() %>
[<%= cookie1.getDomain() %>]
<br/>

<%=cookie2.getName() %> = <%=cookie2.getValue() %>
[<%= cookie2.getDomain() %>]
<br/>
<%=cookie3.getName() %> = <%=cookie3.getValue() %>
[<%= cookie3.getDomain() %>]

</body>
</html>