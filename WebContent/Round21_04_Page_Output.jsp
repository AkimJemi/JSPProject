<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.util.*"%>
<%@ page errorPage="Round21_04_Page_Error.jsp"%>
<%
String nums = request.getParameter("nums");
StringTokenizer token = new StringTokenizer(nums, ",");
int[] num = new int[token.countTokens()];
int pos = 0;

while (token.hasMoreTokens()) {
	num[pos++] = Integer.parseInt(token.nextToken().trim());
}
for (int i = 0; i < num.length; ++i) {
	for (int j = i; j < num.length; ++j) {
		if (num[i] > num[j]) {
	int imsi = num[i];
	num[i] = num[j];
	num[j] = imsi;
		}
	}
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h2>수 나열 결과</h2>
		<%
		for (int i = 0; i < num.length; i++) {
			out.println(num[i]);
			if (i != num.length - 1)
				out.println("<=");
		}
		%>
	</center>
</body>
</html>