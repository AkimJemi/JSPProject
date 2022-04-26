<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String idValue = request.getParameter("id");

Connection conn = null;
PreparedStatement pstmtItem = null;
PreparedStatement pstmtDetail = null;

String jdbcDriver = "jdbc:mysql://localhost:3306/world?"  + "useUnicode=true&characterEncoding=utf8";

String dbUser = "root";
String dbPass = "1234";

Throwable occuredException = null;

try {
	int id = Integer.parseInt(idValue);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	conn.setAutoCommit(false);
	
	
	pstmtItem = conn.prepareStatement("insert into item values(?,?)");
	pstmtItem.setInt(1, id);
	pstmtItem.setString(2, "상품 이름" + id);
	pstmtItem.executeUpdate();
	if (request.getParameter("error") != null) {
		throw new Exception("의도적 익셉션 발생");
	}
	pstmtDetail = conn.prepareStatement("insert into item_detail values(?,?)");
	pstmtDetail.setInt(1, id);
	pstmtDetail.setString(2, "상세 설명" + id);
	pstmtDetail.executeUpdate();
	conn.commit();
} catch (Throwable e) {
	if (conn != null) {
		try {
	conn.rollback();

		} catch (SQLException ex) {
		}
	}

	occuredException = e;
} finally {
	if (pstmtItem != null)
		try {
	pstmtItem.close();
		} catch (SQLException e) {
		}
	if (pstmtDetail != null)
		try {
	pstmtDetail.close();
		} catch (SQLException e) {
		}
	if (conn != null)
		try {
	conn.close();
		} catch (SQLException e) {
		}

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	if (occuredException != null) {
	%>
	에러 발생하엿음
	<%
	} else {
		
	%>데이터가 성공적으로 들어감
	<%
	}
	%>


</body>
</html>