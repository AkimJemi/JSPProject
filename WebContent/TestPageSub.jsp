<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
/* String a = request.getParameter("test1");
String b = request.getParameter("test2");
String[] c = request.getParameterValues("test1");
String d = (String) request.getParameter("test4");

String cb1 = cd.nextElement();
String cb2 = cd.nextElement(); */

/* 첫번째  < Enumeration / ArrayList>
Enumeration a = (Enumeration) request.getParameterNames();
Enumeration<String> cd = a;
ArrayList cb3 = new ArrayList();
while (cd.hasMoreElements()) {
	System.out.println(cd.nextElement());
}
*/

/* 두번째  < Enumeration<String> >
Enumeration<String> cd2 = a;
while (cd2.hasMoreElements()) {
	cb3.add(cd2.nextElement());
}
for (int i = 0; i > cb3.size(); i++) {
	System.out.println(cb3.get(i));
}
*/
/* String c = (String) request.getParameter("test3");
String d = (String) request.getParameter("test4");
 */
 
 /* 세번째  < String[] >
 String[] b = (String[]) request.getParameterValues("test1");
 System.out.println(b.length);
 for (int i = 0; i < b.length; i++) {
 	System.out.println(b[i]);
 }
 */
 /* 네번째  < Map >
 Map<String, String[]> map = (Map<String, String[]>) request.getParameterMap();
 System.out.println(map.size());
 System.out.println(map.entrySet());
 for (String key : map.keySet()) {
 	String[] value = map.get(key);
 	System.out.println("key : " + key + ", value : " + value[0]);
 }
 */
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 	<h2><%=a%></h2>
	<h2><%=b%></h2>
	<h2><%=c%></h2>
	<h2><%=d%></h2>
	<h2><%=cd%></h2>
	<h2><%=cb1%></h2>
	<h2><%=cb2%></h2> --%>
	<%-- <h2><%=cb3%></h2> --%>
</body>
</html>