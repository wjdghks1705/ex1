<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������</title>
<script type="text/javascript" src="//cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
</head>
<body>
<form name="mailform" method="post" action="mail.shop" enctype="multipart/form-data">
	<table border="1" cellpadding="0" cellspacing="0" width="100%">
		<tr><td>������ ���</td>
			<td>trace666@naver.com</td>
		</tr>
		<tr><td>�޴»��</td>
			<td>
				<input type="text" name="recipient" size="100" 
				value='<c:forEach items="${userList}" var="user">${user.userName} &lt;${user.email}&gt;,</c:forEach>'>
			</td>
		</tr>
		<tr><td>����</td>
			<td><input type="text" name="title" size="100">
			</td></tr>
		<tr><td>�޼�������</td>
		<td><select name="mtype">
				<option value="text/html; charset=euc-kr">HTML</option>
				<option value="text/plain; charset=euc-kr">TEXT</option>
			</select></td></tr>
		<tr><td>÷������</td>
			<td><input type="file" name="file1"></td></tr>
		<tr><td colspan="2">
			<textarea name="editor1" cols="120" rows="10"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace("editor1");
			</script>
			</td></tr>
			<tr><td colspan="2" align="center">
			<input type="submit" value="���Ϻ�����">
			</td></tr>
	</table>
</form>
</body>
</html>