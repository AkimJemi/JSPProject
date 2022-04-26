<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function move_list(){
	location.href='Round23_Page_BBS_List.jsp';
}
</script>



</head>
<body>

	<center>
		<h2>게시판 글쓰기</h2>
		<form method="post" action="Round23_Page_BBS_Write_Process.jsp">
			<table border='1' width='500'>
				<tr>
					<th width='150'>글쓰기</th>
					<th><input type='text' name='content_title' size='40' /></th>
				</tr>
				<tr>
					<th width='150'>작성자</th>
					<th><input type='text' name='content_writer' size='40' /></th>
				</tr>
				<tr>
					<td colspan='2'><textarea name='content_contents' rows="8"
							cols="60"></textarea></td>
				</tr>
			</table>
			<table border='0' width='500'>
				<tr>
					<th align='left'><input type="button" value="리스트로"
						onClick="move_list()" />&nbsp;</th>
				</tr>
				<tr>
					<td align='right'><input type="submit" value="글쓰기" /></td>
					<input type="reset" value="초기화" />
					</td>
					<td></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>