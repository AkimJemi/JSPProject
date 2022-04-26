<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="round23.dao.*"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="board" class="round23.dto.BoardDTO" scope="request">
	<jsp:setProperty name="board" property="*" />
</jsp:useBean>

<%
BoardDAO dao = new BoardDAO();
int result = dao.registerMember((round23.dto.BoardDTO) request.getAttribute("board"));
session.setAttribute("list", dao.getBoardList());
%>

<script language = 'javascript'>

 if(<%= result %> == -1){
    alert('저장에 실패했습니다.');
    history.go(-1);
 }
 else{
    alert('성공적으로 저장되었습니다.');
    location.href= 'Round23_Page_BBS_List.jsp';
 }
</script>
