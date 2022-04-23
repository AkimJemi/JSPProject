<%@page import="java.util.Map"%>
<%@ page
	import="java.sql.*, javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String num = (String) session.getAttribute("num");
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
String tel = (String) session.getAttribute("tel");

int getRow = 0;
int getCol = 0;

/* Map<String, String[]> map = (Map<String, String[]>) request.getParameterMap();
for (String key : map.keySet()) {
	String[] value = map.get(key);
	System.out.println("key : " + key + ", value : " + value[0]);
} */
//
Connection conn = null;
PreparedStatement stmt = null;

try {
	Context context = new InitialContext();
	DataSource source = (DataSource) context.lookup("java:comp/env/jdbc/myconn");
	conn = source.getConnection();
} catch (Exception e) {
}
try {
	String query = "SELECT COUNT(*) FROM user_tb";
	stmt = conn.prepareStatement(query);
	ResultSet rs = stmt.executeQuery();
	if (rs.next()) {
		getRow = (rs.getInt(1));
	}
} catch (Exception e) {
	System.out.println("오류");
}
try {
	String query = "select * from user_tb";
	stmt = conn.prepareStatement(query);
	ResultSet rs = stmt.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();
	getCol = rsmd.getColumnCount();

	System.out.println("getRow : " + getRow + ", getCol : " + getCol);

	String[] getColName = new String[getCol];
	ArrayList getColNameForShow = new ArrayList();
	/* 		getColNameForShow.add(getCol, colName[i]); */

	/* "번호", "이름", "아이디", "비밀번호", "전화번호" }; //5; */
	for (int i = 1; i <= getCol; ++i) {
		getColName[i - 1] = rsmd.getColumnName(i);
	}

	/* 	if (col == 0) {
	nu = 6;
	System.out.println("rs.getString() : " + rs.getString(5));
	
	return; */

	/* boolean back = true;
	while (back) { */

	/* if(rs.getString(nu)==null){
	back = false;	
	} */

	/* 	nu++;
	} */
	/* }
	out.println("<td>" + rsmd.getColumnName(i) + "</td>");
	out.println("<td>" + rsmd.getColumnType(i) + "</td>");
	/* out.println("<td>" + rsmd.getColumnClassName(i) + "</td>");
	out.println("<td>" + rsmd.getColumnCount() + "</td>");
	out.println("<td>" + rsmd.getColumnType(i) + "</td>");
	out.println("<td>" + rsmd.getColumnTypeName(i) + "</td>"); 
	*/
	/* 	while (rs.next()) {
	getRow++; //  마지막의 실행 된 총합  [ 열 ]
	System.out.println("test : " + rs.getString(getRow));
		}
		*/
	String[][] user = new String[getRow][getCol]; // [5][6]
	int in = 1;
	while (rs.next()) {
		for (int j = 1; j <= getCol; j++) {
	if (j == 1) {
		user[in - 1][j - 1] = Integer.toString(rs.getInt(j));
	} else {
		user[in - 1][j - 1] = rs.getString(j);
	}
		}
		in++;
	}
	// user[0][0] - uesr[getRow-1][getCol-1]
	/* 	rs2 = stmt.executeQuery(); */
	if (true) {
%>
<center>
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
	</colgroup>
	<table width='370' border='1'>
		<h2>고객 명단</h2>
		<dv border='1'>
		<tr>
			<%
			for (int i = 1; i <= getCol; i++) {
			%>
			<th><%=getColName[i - 1]%></th>
			<%
			}
			%>
			<th>버튼</th>
		</tr>
		<!-- Round21_02_Page_Register_Process.jsp?route=CheckID -->
		<form name="reg_form" onSubmit="return check_form()" method="post"
			action="Round21_02_Page_Register_Process.jsp?route=CheckID&secondRoute=ManagerPage">
			<tr>
				<td></td>
				<td><input type="text" name="name" size='5' /></td>
				<td><input type="text" name="id" size='5' /></td>
				<td><input type="text" name="pw" size='5' /></td>
				<td><input type="text" name="tel" size='5' /></td>
				<td><input type="submit" name="input" value='등록' /></td>
			</tr>
		</form>
		</dv>
		<tr>
			<%
			for (int i = 1; i <= getCol; i++) {
			%>
			<th><%=getColName[i - 1]%></th>
			<%
			}
			%>
			<th>삭제</th>
		</tr>
		<%
		for (int i = 1; i <= getRow; i++) {
		%>
		<tr>
			<%
			for (int j = 1; j <= getCol; j++) {
				int g = 1;
				if (j % (getCol*g-4) == 0) {
					g++;
			%>
			<td name="<%=getColName[i - 1]%>"><%=user[i - 1][j - 1]%></td>
			<%
				} 
			
				else {
			%><td><%=user[i - 1][j - 1]%></td>
			<%
			}
			}
			%>
			<td><input type="button" name="input" onclick="deleteUser()"
				value='삭제' /></td>
		</tr>
		<%
		}
		%>
	</table>
</center>
<%
} else {
throw new Exception();
}
rs.close();
stmt.close();
} catch (Exception ex) {

} finally {
if (conn != null)
conn.close();
conn = null;
}
%>
