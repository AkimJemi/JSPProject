<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String num = (String) session.getAttribute("num");
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
String tel = (String) session.getAttribute("tel");

int totalGuest = 0;
int totalName = 0;

Map<String, String[]> map = (Map<String, String[]>) request.getParameterMap();
for (String key : map.keySet()) {
	String[] value = map.get(key);
	System.out.println("key : " + key + ", value : " + value[0]);
}




%>


<table width='370' border='1'>
	<colgroup span='3' align='center'>
		<h2>
			관리자용 -
			<%=name%>님의 개인 정보
		</h2>
	<tr>
		<th width='100'>이름</th>
		<th width='120'>아이디</th>
		<th width='150'>전화전호</th>
	</tr>
	<tr>
		<td><%=name%></td>
		<td><%=id%></td>
		<td><%=tel%></td>
	</tr>
</table>
<table>
	<h2>고객 명단</h2>
	<tr>
		<%
		for (int i = 0; i < 5; i++) {
		%>
		<th>i</th>
		<%
		}
		%>
	</tr>
	<%
	for (int j = 0; j < 5; j++) {
	%>
	<tr>
		<%
		for (int i = 0; i < 5; i++) {
		%>
		<td>i</td>
		<%
		}
		%>
	</tr>
	<%
	}
	%>
</table>


