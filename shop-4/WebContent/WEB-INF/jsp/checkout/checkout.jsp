<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ֹ� Ȯ�� ȭ�� </title>
</head>
<body>
<h2>����� ����</h2>
<table>
	<tr><td>������ ID</td><td>${loginUser.userId}</td></tr>
	<tr><td>�̸�</td><td>${loginUser.userName}</td></tr>
	<tr><td>�����ȣ</td><td>${loginUser.postCode}</td></tr>
	<tr><td>�ּ�</td><td>${loginUser.address}</td></tr>
	<tr><td>��ȭ��ȣ</td><td>${loginUser.phoneNo}</td></tr>
	<tr><td>�̸���</td><td>${loginUser.email}</td></tr>
</table><br>
<h2>�ֹ� ��ǰ ���</h2>
<table>
	<tr><th>��ǰ��</th><th>��ǰ����</th>
		<td>����</td><td>�ݾ�</td></tr>
	<c:forEach items="${itemList}" var="itemSet">
	<tr><td>${itemSet.item.name}</td>
		<td>${itemSet.item.price}</td>
		<td>${itemSet.quantity}</td>
		<td>${itemSet.item.price * itemSet.quantity}</td>
	</tr></c:forEach>
	<tr><td colspan="4" align="right">
	�� �ݾ�:${totalAmount}��</td></tr>
	<tr><td colspan="4" align="center">
		<a href="end.shop">Ȯ��</a>
		<a href="../item/list.shop">��ǰ���</a>
</table>
</body>
</html>