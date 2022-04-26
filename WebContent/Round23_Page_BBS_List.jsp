<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
ArrayList<round23.dto.BoardDTO> list = (ArrayList<round23.dto.BoardDTO>) session.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function move_write() {
		location.href = 'Round23_Page_BBS_Write.jsp';
	}
</script>
</head>
<body>
	<center>
		<h2>게시판</h2>
		<table border='0' width='500'>
			<tr>
				<td align='right'><input type='button' value='글쓰기'
					onClick='move_write()' /></td>
		</table>
		<table border='1' width='500'>
			<tr height='25'>
				<th width='60'>번호</th>
				<th width='200'>제목</th>
				<th width='90'>작성자</th>
				<th width='100'>작성일</th>
			</tr>
			<%
			if (list == null || list.size() == 0) {
			%>
			<tr>
				<td colspan='4' align='center'>등록된 글이 없습니다.</td>
				<%
				} else {
				for (int i = 0; i < list.size(); ++i) {
					round23.dto.BoardDTO dto = (round23.dto.BoardDTO) list.get(i);
				%>
			
			<tr>
				<td align="center"><%=dto.getContent_num()%></td>
				<td align="left"><%=dto.getContent_title()%></td>
				<td align="center"><%=dto.getContent_writer()%></td>
				<td align="center"><%=dto.getContent_regdate()%></td>
			</tr>
			<%
			}
			}
			%>
			</tr>
		</table>
	</center>
</body>
</html>