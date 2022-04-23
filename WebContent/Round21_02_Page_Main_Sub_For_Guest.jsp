<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
String tel = (String) session.getAttribute("tel");
%>

<h2>게스트 로그인 완료</h2>
<table width='370' border='1'>
	<colgroup span='3' align='center'>
	
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
