<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*, javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource"%>

<%
request.setCharacterEncoding("utf-8");
String id = (String) request.getParameter("id");
String pw = request.getParameter("pw");
String name = "", tel = "";

Connection conn = null;
PreparedStatement pstmt = null;

try {
	Context context = new InitialContext();
	DataSource source = (DataSource) context.lookup("java:comp/env/jdbc/myconn");
	conn = source.getConnection();
} catch (Exception e) {
}
try {
	String query = "select * from user_tb where id=? and pw=?";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	ResultSet rs = pstmt.executeQuery();
	if (rs.next()) {
		name = rs.getString("name");
		tel = rs.getString("tel");
	} else
		throw new Exception();

	rs.close();
	pstmt.close();
} catch (Exception ex) {
	out.println("<html><head><script>alert('아이디와 비번을 확인해주세요');");
	out.println("history.back();</script><head><html>");
	return;
} finally {
	if (conn != null)
		conn.close();
	conn = null;
}
session.setAttribute("name", name);
session.setAttribute("id", id);
session.setAttribute("tel", tel);
session.setAttribute("pw", pw);
pageContext.forward("Round21_02_Page_Main.jsp");
%>
