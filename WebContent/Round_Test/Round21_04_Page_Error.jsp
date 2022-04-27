<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.*"%>
<%@ page isErrorPage="true"%>

<%
PrintWriter out2 = response.getWriter();
out2.println("<center>");
out2.println("<h2>에러 페이지</h2>");
out2.println("<hr width='80%'.>");
out2.println("Error Message : " + exception.getMessage());
out2.println("<hr width='80%'/>");
out2.println("</center><br/>");

exception.printStackTrace(out2);
%>