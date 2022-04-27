<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String[] subject = request.getParameterValues("subject");
String[] jumsu = request.getParameterValues("jumsu");

double total = 0.0;
double avg = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%=name%>님
	<br />
	<br /> 시험 과목:
	<%
	try {
		for (int i = 0; i < subject.length; ++i) {
			out.println(subject[i]);
			if (i != subject.length - 1)
		out.println(", ");
			total += Double.parseDouble(jumsu[i]);
		}
		avg = total / subject.length;

	} catch (Exception ex) {
		response.sendError(512, "연산 오류");
		return;
	}
	%>
	총합 :
	<%=total%>점, 평균 :
	<%=avg%>잠

</body>
</html>