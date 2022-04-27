<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%!private String su1 = "";
	private String su2 = "";
	private String yonsan = "";
	private String result = "";

	public String nvl(Object str) {
		if (str == null || ((String) str).trim().length() == 0)
			return "";
		return ((String) str).trim();
	}%>

<%
su1 = nvl(request.getAttribute("su1"));
su2 = nvl(request.getAttribute("su2"));
yonsan = nvl(request.getAttribute("yonsan"));
result = nvl(request.getAttribute("result"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language='javascript'>
	function check_form() {
		var su1 = calc_form.su1.value;
		var su2 = calc_form.su2.value;
		var yonsan = calc_form.yonsan.value;
		if (su1.length == 0 || su2.length == 0)
			return false;
		if (isNaN(su1)) {
			alert('피연산자는 숫자여야 합니다.');
			calc_form.su1.value = ' ';
			calc_form.su1.focus();
			return false;
		}
		if (isNaN(su2)) {
			alert('피연산자는 숫자여야 합니다.');
			calc_form.su2.value = ' ';
			calc_form.su2.focus();
			return false;
		}
		if (yonsan != '+' && yonsan != '-' && yonsan != '*' && yonsan != '/') {
			alert('연산자는 +, - , * , / 중 하나여야 합니다.');
			calc_form.yonsan.value = ' ';
			calc_form.yonsan.focus();
			return false;
		}
		return true;
	}
</script>
<input type="submit"  name=""/>

</head>
<body>
	<center>
		<h2>계산기</h2>
		<form name='calc_form' method='post' onSubmit='return check_form()'
			action='Round20_03_Page_Calc_Process.jsp'>
			<input type='type' name='su1' value='<%=su1%>' size='10' />&nbsp; <input
				type='type' name='yonsan' value='<%=yonsan%>' size='3' />&nbsp; <input
				type='type' name='su2' value='<%=su2%>' size='10' />&nbsp; <input
				type='type' name='result' value='<%=result%>' size='20' readonly />&nbsp;
			<input type='submit' value='계산' />

		</form>
	</center>


</body>
</html>