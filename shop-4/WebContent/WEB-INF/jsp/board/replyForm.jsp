<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/WEB-INF/jsp/board/replyForm.jsp --%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� ��� ����</title>
</head>
<body>
<form:form modelAttribute="board" action="reply.shop" method="post"
   name="boardform">
<input type="hidden" name="num" value="${board.num}">
<input type="hidden" name="ref" value="${board.ref}">
<input type="hidden" name="refLevel" 
       value="${board.refLevel}">
<input type="hidden" name="refStep" 
       value="${board.refStep}">
   <table border="1" cellspacing="0" cellpadding="0">
   <tr align="center">
     <td colspan="2">Spring �Խ���</td></tr>
   <tr><td>�ۼ���</td>
   	  <td><form:input path="name"/>
   	  	  <font color="red"><form:errors path="name"/></font>
      </td></tr>  
   <tr><td>��й�ȣ</td>
      <td><form:password path="pass" />
      	  <font color="red"><form:errors path="pass" /></font></td></tr>  
   <tr><td>����</td>
      <td><form:input path="subject"/>
      	  <font color="red"><form:errors path="subject" /></font>
      </td></tr>  
   <tr><td>����</td>
      <td><form:textarea path="content" rows="15" 
          cols="67" /></td></tr>
   <tr><td colspan="2">
   <a href="javascript:document.boardform.submit()">
   [��۵��]</a>
   <a href="list.shop">[���]</a>
   </td></tr>   
   </table></form:form>
</body>
</html>