<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="..\WEB-INF\methodTag.jsp"%>
<%
request.getParameter("utf-8");
String id = (String) session.getAttribute("id");
/* int page_endNum = Integer.parseInt(request.getParameter("page_endNum"));
int page_currentNum = Integer.parseInt(request.getParameter("page_currentNum")); */
/* String pageSet= "page_startNum="+page_startNum+"&page_endNum=" +page_endNum+ "&page_currentNum=" + page_currentNum;
 */
/* int pageNumTest = Integer.parseInt(request.getParameter("pageNumTest")); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
table {
	text-align: center;
}
</style>
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
		location.href = 'Round21_02_Page_Register_Process.jsp?route=CheckID&secondRoute=historyBack';
	}
</script>
</head>
<body>
	<center>

		<h2>환영</h2>
		<%
		if (id.equals("1")) {
			pageContext.include("Round21_02_Page_Main_Sub_For_Manager.jsp", true);
		} else {
			pageContext.include("Round21_02_Page_Main_Sub_For_Guest.jsp", true);
		}
		%>

	</center>
</body>
</html>