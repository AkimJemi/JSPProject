<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String result = "0";
double su1 = Double.parseDouble(request.getParameter("su1"));
double su2 = Double.parseDouble(request.getParameter("su2"));
char yonsan = request.getParameter("yonsan").trim().charAt(0);

switch (yonsan) {
case '+':
	result = String.valueOf(su1 + su2);
	break;
case '-':
	result = String.valueOf(su1 - su2);
	break;
case '*':
	result = String.valueOf(su1 * su2);
	break;
case '/':
	try {
		result = String.valueOf(su1 / su2);
	} catch (ArithmeticException ae) {
		result = "연산 오류";
	}
}

request.setAttribute("su1", String.valueOf(su1));
request.setAttribute("su2", String.valueOf(su2));
request.setAttribute("yonsan", String.valueOf(yonsan));
request.setAttribute("result", result);

ServletContext context = this.getServletContext();
RequestDispatcher dispatcher = context.getRequestDispatcher("/Round20_03_Page_Calc.jsp");
dispatcher.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>