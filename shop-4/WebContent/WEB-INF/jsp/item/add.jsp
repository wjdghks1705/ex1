<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><spring:message code="itemAdd.title" /></title>
</head>
<body>
<h2><spring:message code="itemAdd.title" /></h2>
<form:form modelAttribute="item"
	action="register.shop"
	enctype="multipart/form-data">
	<table>
		<tr><td>��ǰ��</td>
			<td><form:input path="name" maxlength="20"/></td>
			<td><font color="red">
			<form:errors path="name" /></font></td></tr>
		<tr><td>����</td>
			<td><form:input path="price" maxlength="6"/></td>
			<td><font color="red">
			<form:errors path="price" /></font></td></tr>
		<tr><td>��ǰ�̹���</td>
			<td colspan="2">
			<input type="file" name="picture"></td></tr>
		<tr><td>��ǰ����</td>
			<td><form:textarea path="description" cols="50" rows="5" /></td>
			<td><font color="red">
			<form:errors path="description" /></font></td>
			</tr>
			<tr><td colspan="3">
				<input type="submit" value="���">&nbsp;
				<input type="button" value="���"
					onclick="location.href='list.shop'">
			</td></tr>
	</table>
	</form:form>
</body>
</html>