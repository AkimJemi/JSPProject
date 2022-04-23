<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = "";
String pw = "";
String tel = "";
String name = "";
String from = "";

if (request.getParameter("from") != null) {
	from = (String) request.getParameter("from");
}
if (from.equals("login")) {
	id = (String) request.getParameter("id");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function isNull2(obj) {
	var data = obj.value;
	if (data == '') {
		alert(obj.name + '필드는 공백임');
		obj.focus();
		return true;
	}
	return false;
}
function check_form() {
	if (isNull2(reg_form.name))
		return false;
	if (isNull2(reg_form.id))
		return false;
	if (isNull2(reg_form.pw))
		return false;
	if (isNull2(reg_form.pw2))
		return false;
	if (isNull2(reg_form.tel))
		return false;
	
	var pw = reg_form.pw.value;
	var pw2 = reg_form.pw2.value;
	if (pw != pw2) {
		alert("확인 비밀번호가 정확하지 않습니다");
		return false;
	}
	return true;
}
function checkID(obj) {
	var id = reg_form.id.value;
	var pw = reg_form.pw.value;
	var name = reg_form.name.value;
	var tel = reg_form.tel.value;

	location.href = 'Round21_02_Page_Register_Process.jsp?route=CheckID';
}
</script>
</head>
<body>
	<center>
		<h2>register page</h2>
		<form name="reg_form" method="post"
			action="Round21_02_Page_Register_Process.jsp"
			onSubmit="return check_form()">
			<table width='400' border='1'>
				<tr>
					<th width='130'>이름</th>
					<td><input type="text" name="name" size='20' value="<%=name%>" /></td>
				</tr>
				<tr>
					<th width='130'>아이디</th>
					<td><input type="text" name="id" size='15' value="<%=id%>" />
						<input type="button" onclick='checkID()' value="아이디확인" /></td>
				</tr>
				<tr>
					<th width='130'>비밀번호</th>
					<td><input type="password" name="pw" size='20' value="<%=pw%>" /></td>
				</tr>
				<tr>
					<th width='130'>비밀번호 확인</th>
					<td><input type="password" name="pw2" size='20' /></td>
				</tr>
				<tr>
					<th width='130'>전화번호</th>
					<td><input type="text" name="tel" size='20' value="<%=tel%>" /></td>
				</tr>
				<tr>
					<td colspan='2' align='center'><input type="submit"
						value="회원가입" />
				</tr>
			</table>
		</form>
	</center>
</body>
</html>