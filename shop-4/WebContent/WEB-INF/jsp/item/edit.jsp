<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><spring:message code="itemEdit.title" /></title>
</head>
<body>
	<h2><spring:message code="itemEdit.title" /></h2>
	<form:form modelAttribute="item"
		action="update.shop"
		enctype="multipart/form-data">
		<form:hidden path="id"/>
		<form:hidden path="pictureUrl"/>
		<table>
			<tr><td>��ǰ��</td>
				<td><form:input path="name" /></td>
				<td><font color="red">
				<form:errors path="name" />
				</font></td>
			</tr>
			<tr><td>����</td>
				<td><form:input path="price" /></td>
				<td><font color="red">
				<form:errors path="price" />
				</font></td>
			</tr>
			<tr><td>��ǰ�̹���</td>
				<td><input type="file" name="picture"/></td>
				<td>${item.pictureUrl }</td>
			</tr>
			<tr><td>��ǰ����</td>
				<td><form:textarea path="description" cols="50" rows="10"/></td>
				<td><font color="red">
				<form:errors path="description" />
				</font></td>
			</tr>
			<tr><td colspan="3">
				<input type="submit" value="����" />
				<input type="button" value="���"
					onclick="location.href='list.shop'">
		</table>	
	</form:form>
</body>
</html>