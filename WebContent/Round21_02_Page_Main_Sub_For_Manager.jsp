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

// URL 
Map params = request.getParameterMap();
Set s = params.entrySet();
Iterator it = s.iterator();
String key = null;
Map<String, String> keys = new HashMap<String, String>();


String[] value = null;
while (it.hasNext()) {
	Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>) it.next();
	key = entry.getKey();
	value = entry.getValue();
	if (value.length >= 1) {
		for (int i = 0; i < value.length; i++) {
	System.out.println("Key: " + key.toString() + ", Value: " + value[i].toString());
		keys.put(key.toString(), value[i].toString());
		}
	}
}
if(keys.containsKey("insertCount")){
System.out.println("insertCount: " + keys.get("insertCount"));
}

String urlTokens = request.getServletPath();
String[] URL = urlTokens.split("/");
System.out.println(URL[1] + "?");
//

// 페이징
int page_startNum = 1;
int page_countNum = 10;
String paging = null;
if (keys.containsKey("page_startNum")) {
	page_startNum = Integer.parseInt(keys.get("page_startNum"));
}
if (keys.containsKey("page_countNum")) {
	page_countNum = Integer.parseInt(keys.get("page_countNum"));
}

paging = "page_startNum=" + page_startNum + "&page_countNum=" + page_countNum;

System.out.println("");
//
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
<script type="text/javascript">
	function deleteUser(num, paging) {
		alert(num + "번 삭제");
		location.href = 'Round21_02_Page_Register_Process.jsp?route=deleteID&num='
				+ num + 'secondRoute=MainPage';
	}
	function pageStartNum(page_countNum, page_startNum) {
		<%-- if('<%=paging%>' !=null){
			location.href = "Round21_02_Page_Main.jsp?paging=" + '<%=paging%>';
			}else{
			} --%>
		location.href = "Round21_02_Page_Main.jsp?page_startNum=" + page_countNum + "&page_countNum=" + page_startNum;
	}
	function pageCountNum(page_countNum, page_startNum) {
		<%-- alert("<%=page_countNum%>");
		if('<%=paging%>' !=null) {
			location.href = "Round21_02_Page_Main.jsp?paging=" + '<%=paging%>';
		}else{
		alert(num);
		} --%>
		location.href = "Round21_02_Page_Main.jsp?page_countNum=" + page_countNum + "&page_startNum" + page_startNum;
	}
	
	
	function autoInsert(num, paging) {
		location.href = "Round21_02_Page_Register_Process.jsp?route=autoInsert&secondRoute=historyBack&insertCount="
				+ num + "&" + paging;
	}
</script>

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

	<h3>
		페이징
		</h2>
		<div>
			<input type="button" value="1" onclick="pageStartNum('<%= page_countNum%>', 1)" /> <input
				type="button" value="6" onclick="pageStartNum('<%= page_countNum%>', 6)" /> <input
				type="button" value="11" onclick="pageStartNum('<%= page_countNum%>', 11)" /> <input
				type="button" value="16" onclick="pageStartNum('<%= page_countNum%>', 16)" />
		</div>
		<h3>
			총 갯수
			</h2>
			<div>
				<input type="button" value="1" onclick="pageCountNum(1, '<%= page_startNum%>')" /> <input
					type="button" value="5" name="5" onclick="pageCountNum(5, '<%= page_startNum%>')" /> <input
					type="button" value="10" onclick="pageCountNum(10, '<%= page_startNum%>')" /> <input
					type="button" value="15" onclick="pageCountNum(15, '<%= page_startNum%>')" />
			</div>
			<h3>
				자동추가
				</h2>
				<div>
					<h2><%=paging%></h2>
					<input type="button" value="자동 추가(1)"
						onclick="autoInsert(1, '<%=paging%>')" /> <input type="button"
						value="자동 추가(5)" onclick="autoInsert(5, '<%=paging%>')" /> <input
						type="button" value="자동 추가(15)"
						onclick="autoInsert(10, '<%=paging%>')" />
				</div>

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
						action="Round21_02_Page_Register_Process.jsp?route=CheckID&secondRoute=ManagerPage&paging=<%=paging%>">
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
					for (int i = 1; i <= page_countNum; i++) {
					%>
					<tr>
						<%
						for (int j = 1; j <= getCol; j++) {
						%>
						<td name="<%=getColName[j - 1]%>"><%=user[i - 1][j - 1]%></td>
						<%
						}
						%>
						<td><input type="button" name="input"
							onclick="deleteUser('<%=user[i - 1][0]%>')" value='삭제' /></td>
					</tr>
					<%
					}
					%>
				</table>
				<%
				for (int z = page_startNum; z <= page_startNum + 4; z++) {
				%>
				<a><%=z%></a>
				<%
				}
				%>
			
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
