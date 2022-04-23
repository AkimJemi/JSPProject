<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("ckId");
Connection conn = null;
out.println(id);

try {
	Class.forName("org.gjt.mm.mysql.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "1234");
	String query = "select * from user_tb where id=?";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	String a = null;
	if (rs.next()) {
		a = rs.getString("pw");
		out.println("ss :" + a);

	} else
		throw new Exception();
	rs.close();
	pstmt.close();
} catch (Exception ex) {
	
	return;
} finally {
	if (conn != null)
		conn.close();
	conn = null;
}
return;
/* 
pageContext.forward("Round21_02_Page_Main.jsp");  */
%>