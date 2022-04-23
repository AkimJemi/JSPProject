<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="장바구니 처리" %>
<%@ page import="java.util.*, round22.base.*" %>
<%
   ArrayList baguni = null;
Object obj = session.getAttribute("jang");
if(obj ==null) baguni = new ArrayList();
else baguni = (ArrayList)obj;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 장바구니</title>
</head>
<body>
   <center>
      <h2>장바구니</h2>
      <table width ='600' border="1">
      <tr height="25">
         <th width ="60">번호</th>
         <th width ="300">제품명</th>
         <th width ="60">수량</th>
         <th width ="80">가격</th>
         <th width ="100">총가격</th>
      </tr>
      <%
      if(baguni.size() ==0){
         out.println("<tr><td align='center' colspan='5'>");
         out.println("구입하신 물품이 없음");
         out.println("</td></tr>");
      }
      else{
         int total = 0;
         for(int i = 0 ; i < baguni.size(); ++i){
            JangBaguni jang = (JangBaguni)baguni.get(i);
            out.println("<tr><td align='center'>");
            out.println(i + 1 + "</td>");
            out.println("<td align ='left'>" + jang.getName()+"</td>");
            out.println("<td align ='right'>" + jang.getCnt()+"개</td>");
            out.println("<td align ='right'>" + jang.getPrice()+"원</td>");
            out.println("<td align ='right'>" + jang.getCnt() * jang.getPrice());
            out.println("원</td></tr>");
            total += jang.getCnt() * jang.getPrice();
         }
            out.println("<tr><td align='right' colspan='4'>전체합계</td>");
            out.println("<td align ='right'>" + total + "원</td></tr>");
      }
      %>
      </table>
   </center>
</body>
</html>