<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���</title>
</head>
<body>
<form:form modelAttribute="user" method="post" action="userEntry.shop">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
			<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table>
		<tr><td>���̵�</td>
			<td><form:input path="userId" />
				<font color="red"><form:errors path="userId" /></font>
			</td></tr>
		<tr><td>��й�ȣ</td>
			<td><form:password path="password" />
				<font color="red"><form:errors path="password" /></font>
			</td></tr>
		<tr><td>�̸�</td>
			<td><form:input path="userName" />
				<font color="red"><form:errors path="userName" /></font>
			</td></tr>	
		<tr><td>��ȭ��ȣ</td>
			<td><form:input path="phoneNo" />
				<font color="red"><form:errors path="phoneNo" /></font>
			</td></tr>
		<tr><td>�����ȣ</td>
			<td><form:input path="postCode" />
				<font color="red"><form:errors path="postCode" /></font>
			</td></tr>
		<tr><td>�ּ�</td>
			<td><form:input path="address" />
				<font color="red"><form:errors path="address" /></font>
			</td></tr>
		<tr><td>�̸���</td>
			<td><form:input path="email" />
				<font color="red"><form:errors path="email" /></font>
			</td></tr>
		<tr><td>�������</td>
			<td><form:input path="birthDay" />
				<font color="red"><form:errors path="birthDay" /></font>
			</td></tr>
			<tr><td colspan="2" align="center">
			<input type="submit" value="���">
			<input type="reset" value="�ʱ�ȭ">
			</td></tr>	
	</table>
</form:form>
</body>
</html>