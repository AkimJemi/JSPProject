<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*, javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource"%>

<%
request.setCharacterEncoding("utf-8");
//
String route = "";
if (request.getParameter("route") != null) {
	route = request.getParameter("route");
}
//
String name = (String) request.getParameter("name");
String id = (String) request.getParameter("id");
String pw = (String) request.getParameter("pw");
String tel = (String) request.getParameter("tel");

Connection conn = null;
//
try {
	Context context = new InitialContext();
	DataSource source = (DataSource) context.lookup("java:comp/env/jdbc/myconn");
	conn = source.getConnection();
} catch (Exception e) {
}

// CheckID
if (!route.equalsIgnoreCase("")) {

	try {
		String query = "select * from user_tb where id=?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if (!rs.next())
	throw new Exception();

		rs.close();
		pstmt.close();
	} catch (Exception ex) {
		out.println("<html><head><script>alert('만들수 있는 아이디입니다');");
		out.println("history.back();</script><head><html>");
		return;
		/* pageContext.forward("Round21_02_Page_Register.jsp"); */
	} finally {
		if (conn != null)
	conn.close();
		conn = null;
	}
	out.println("<html><head><script>alert('이미 존재하는 아이디입니다');");
	out.println("history.back();</script><head><html>");
	return;
	/* pageContext.forward("Round21_02_Page_Register.jsp"); */

	// Insert
} else {
	//
	try {
		String query = "insert into user_tb values (null,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, pw);
		pstmt.setString(4, tel);
		pstmt.executeUpdate();
		pstmt.close();
	} catch (Exception ex) {
		pageContext.forward("Round21_02_Page_Register.jsp?from=CheckID");
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
	pageContext.forward("Round21_02_Page_Login.jsp");
	return;
}
%>