<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� �� ����</title>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="0" width="100%">
	<tr><td colspan="2">Spring �Խù� �� ����</td></tr>
	<tr><td width="15%">����</td>
		<td width="85">${board.subject}</td></tr>
	<tr><td>�ۼ���</td><td>${board.name}</td></tr>
	<tr><td>����</td><td>
		<table width="100%" height="250">
			<tr><td>${board.content}</td></tr>
		</table>
	</td></tr>
	<tr><td>÷������</td><td>
		<c:if test="${not empty board.fileUrl}">
			<a href="filedown.shop?filename=${board.fileUrl}">${board.fileUrl}</a>
		</c:if>&nbsp;</td></tr>
		<tr><td colspan="2">
			<a href="replyForm.shop?num=${board.num}">[�亯]</a>
			<a href="updateForm.shop?num=${board.num}">[����]</a>
			<a href="deleteForm.shop?num=${board.num}">[����]</a>
			<a href="list.shop">[���]</a>
		</td></tr>
</table>
</body>
</html>