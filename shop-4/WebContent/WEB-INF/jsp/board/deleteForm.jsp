<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/WEB-INF/jsp/board/deleteForm.jsp --%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� ����</title>
</head>
<body>
<form name="deleteform" 
   action="delete.shop" method="post">
 <input type="hidden" 
        name="num" value="${param.num}">
 <table border="1" cellspacing="0" cellpadding="0">
   <tr><td>�Խñ� ��й�ȣ</td>
     <td><input type="password" name="pass"></td>
   </tr>
   <tr><td colspan="2">
   <a href="javascript:document.deleteform.submit()">
   [����]</a>
   <a href="list.shop">[���]</a></td></tr>
 </table></form></body></html>