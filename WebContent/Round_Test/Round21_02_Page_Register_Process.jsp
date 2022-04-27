<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*, javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource"%>
<%
request.setCharacterEncoding("utf-8");
//
String route = "";
String secondRoute = "";
String num = "";
String paging = "";
int insertCount = 0;
Connection conn = null;
boolean register = false;

if (request.getParameter("route") != null) {
	route = request.getParameter("route");
}
System.out.println();
if (request.getParameter("secondRoute") != null) {
	secondRoute = request.getParameter("secondRoute");
}
if (request.getParameter("num") != null) {
	num = request.getParameter("num");
}
if (request.getParameter("insertCount") != null) {
	insertCount = Integer.parseInt(request.getParameter("insertCount"));
}
if (request.getParameter("paging") != null) {
	paging = request.getParameter("paging");
}
System.out.println("[ route ] : " + route + ", [ secondRoute ] : " + secondRoute + ", [ num ] : " + num
		+ ", [ insertCount ] : " + insertCount + ", [ paging ] : " + paging);

String name = (String) request.getParameter("name");
String id = (String) request.getParameter("id");
String pw = (String) request.getParameter("pw");
String tel = (String) request.getParameter("tel");
System.out.println("[ name ] : " + name + ", [ id ] : " + id + ", " + "[ pw ] : " + pw + ", " + "[ tel ] : " + tel);

try {
	Context context = new InitialContext();
	DataSource source = (DataSource) context.lookup("java:comp/env/jdbc/myconn");
	conn = source.getConnection();
} catch (Exception e) {
}

// CheckID
if (route.equalsIgnoreCase("CheckID") || secondRoute.equalsIgnoreCase("CheckID")) {
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
		register = true;
		out.println("<html><head><script>alert('사용 가능 아이디');</script></head></html>");
		if (secondRoute.equalsIgnoreCase("historyBack")) {
	out.println("<html><head><script>history.back();</script></head></html>");
		}
		/* pageContext.forward("Round21_02_Page_Register.jsp"); */
	} finally {
		System.out.println("register : " + register);
		if (register) {
	System.out.println("아이디 확인 완료");
		} else {
	if (conn != null)
		conn.close();
	conn = null;
	out.println("<html><head><script>alert('이미 사용 중인 아이디');");
	out.println("history.back();</script></head></html>");
		}
	}
}
if (!secondRoute.equalsIgnoreCase("historyBack")) {

	if (!route.equalsIgnoreCase("deleteID")) {
		try {
	String query = "insert into user_tb values (null,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, pw);
	pstmt.setString(4, tel);
	System.out.println("test11");
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
		if (secondRoute.equalsIgnoreCase("ManagerPage")) {
	System.out.println("id : " + id + ", " + "pw : " + pw + ", " + "tel : " + tel);
	System.out.println("s : " + route);
	System.out.println("ss : " + secondRoute);
	out.println("<html><head><script>alert('회원 등록 완료');</script></head></html>");
	pageContext.forward("Round21_02_Page_Main.jsp?id=1&" + paging);
	return;
		} else {
	session.setAttribute("name", name);
	session.setAttribute("id", id);
	session.setAttribute("tel", tel);
	session.setAttribute("pw", pw);
	pageContext.forward("Round21_02_Page_Login.jsp");
	return;
		}
	}
	// 삭제
	else if (route.equalsIgnoreCase("deleteID")) {
		try {
	String query = "delete from user_tb where num = ?";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setString(1, num);
	pstmt.executeUpdate();
	pstmt.close();
		} catch (Exception ex) {
	out.println("<html><head><script>alert('삭제 처리 중 오류 발생');</script></head></html>");
	return;
		} finally {
	if (conn != null)
		conn.close();
	conn = null;
		}
		out.println("<html><head><script>alert('" + num + "번의 회원 삭제 완료');</script></head></html>");
		pageContext.forward("Round21_02_Page_Main.jsp?id=1");
		return;
	}
}
// 자동추가
if (route.equalsIgnoreCase("autoInsert")) {
	try {
		String query = "insert into user_tb values (null,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, "2");
		pstmt.setString(2, "2");
		pstmt.setString(3, "2");
		pstmt.setString(4, "2");
		for (int a = 1; a <= insertCount; a++) {
	pstmt.executeUpdate();
		}
		pstmt.close();
	} catch (Exception ex) {
		pageContext.forward("Round21_02_Page_Register.jsp?from=CheckID");
		return;
	} finally {
		if (conn != null)
	conn.close();
		conn = null;
	}
	pageContext.forward("Round21_02_Page_Main.jsp?id=1&" + paging);
	return;
}
%>