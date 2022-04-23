<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function check_form() {
		var table_name = myform.table_name.value;
		if (table_name == '') {
			alert('테이블 명은 반드시 입력해야 합니다');
			myform.table_name.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>테이블 정보 출력</h2>
	<%
	if (request.getMethod().equalsIgnoreCase("get")) {
	%>
	<center>
		<form name="myform" method="post" onSubmit="return check_form()">
			<table width='300' border="0">
				<tr>
					<th width="100">테이블명</th>
					<td><input type="text" name="table_name" size='15' /></td>
				</tr>
				<tr>
					<th width="100">조건절</th>
					<td><input type="text" name="table_where" size='15' /></td>
				</tr>
				<tr>
					<td colspan='2' align='right'><input type="submit"
						value="테이블 정보 획득" /></td>
				</tr>
			</table>
		</form>
	</center>
	<%
	} else if (request.getMethod().equalsIgnoreCase("post")) {
	String table_name = request.getParameter("table_name");
	String table_where = request.getParameter("table_where");
	if (table_where == null)
		table_where = "";
	%>
	<center>
		<form name="myform" method="post" onSubmit="return check_form()">
			<table width='300' border="0">
				<tr>
					<th width="100">테이블명</th>
					<td><input type="text" name="table_name" size='15'
						value="<%=table_name%>" /></td>
				</tr>
				<tr>
					<th width="100">조건절</th>
					<td><input type="text" name="table_where" size='15' /></td>
				</tr>
				<tr>
					<td colspan='2' align='right'><input type="submit"
						value=" 재민이사랑해" value="<%=table_where%>" /></td>
				</tr>
			</table>
		</form>
	</center>
	<%
	String driver = config.getInitParameter("driver");
	String url = config.getInitParameter("url");
	String user_id = config.getInitParameter("user_id");
	String user_pw = config.getInitParameter("user_pw");
	Connection conn = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user_id, user_pw);
		String query = "select * from " + table_name;
		if (table_where != null && table_where.trim().length() != 0)
			query += " " + table_where;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		ResultSetMetaData rsmd = rs.getMetaData();
	%>
	<center>
		<table width='600' border='1'>
			<tr>
				<%
				for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
					out.println("<td>" + rsmd.getColumnName(i) + "</td>");
					/* out.println("<td>" + rsmd.getColumnClassName(i) + "</td>");
					out.println("<td>" + rsmd.getColumnCount() + "</td>");
					out.println("<td>" + rsmd.getColumnType(i) + "</td>");
					out.println("<td>" + rsmd.getColumnTypeName(i) + "</td>"); */

				}
				%>
			</tr>
			<%
			while (rs.next()) {
				out.println("<tr>");
				for (int i = 1; i <= rsmd.getColumnCount(); ++i) {
					if (rsmd.getColumnClassName(i).equalsIgnoreCase("Data"))
				out.println("<td>" + rs.getDate(i) + "</td>");
					else
				out.println("<td>" + rs.getString(i) + "</td>");
				}
			}
			%>
		</table>
	</center>

	<%
	} catch (Exception ex) {
	out.println("Error : " + ex.getMessage() + "<br/><br/>");

	} finally {
	if (conn != null)
		conn.close();
	conn = null;
	}
	}
	%>
</body>
</html>