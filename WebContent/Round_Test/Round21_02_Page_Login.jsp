<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
String pw = (String) session.getAttribute("pw");
String rqid = request.getParameter("id");
if (id == null)
	id = "";
if (pw == null)
	pw = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function MoveToRegister() {
		var id = login_form.id.value;
		location.href = "Round21_02_Page_Register.jsp?id=" + id + "&from=login";
	}

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
		if (isNull2(login_form.id)) {
			return false;
		}
		if (isNull2(login_form.pw)) {
			return false;
		}

		return true;
	}
</script>
<style>
.centerStyle {
	height: 800px;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.form_table {
	display: inline-block;
}

.header {
	
}
</style>
</head>
<body>
	<!-- <header class="header">
	</header> -->
	<form onSubmit="return check_form()" name="login_form"
		class="centerStyle" method="post"
		action="Round21_02_Page_Login_Process.jsp">
		<table class="form_table" width="300" border="1">
			<tr>
				<th width="100">아이디</th>
				<td><input type="text" name="id" size='25' value="<%=id%>"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" size='25' value="<%=pw%>"/></td>
			</tr>
			<tr>
				<td colspan='2' style="justify-content: space-around"><input
					type="submit" value="로그인" /><input type="button"
					onclick="MoveToRegister()" value="회원가입" /></td>
			</tr>
		</table>
	</form>
</body>
</html>