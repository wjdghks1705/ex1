<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ֹ� �Ϸ�</title>
</head>
<body>
<h2>�ֹ��� �ּż� �����մϴ�.</h2>
<font color="greeb">��۹��� ��</font>
<table>
	<tr><td>����� ID</td><td>${loginUser.userId}</td></tr>
	<tr><td>�̸�</td><td>${loginUser.userName}</td></tr>
	<tr><td>�����ȣ</td><td>${loginUser.postCode}</td></tr>
	<tr><td>�ּ�</td><td>${loginUser.address}</td></tr>
	<tr><td>��ȭ��ȣ</td><td>${loginUser.phoneNo}</td></tr>
	<tr><td>�̸���</td><td>${loginUser.email}</td></tr>
</table><br><br>
<font color="green">�ֹ� ��ǰ ���</font>
<table><tr>
<th>��ǰ��</th><th>��ǰ����</th><th>����</th><th>�Ұ�</th>
</tr>
<c:forEach items="${sale.saleItemList}" var="saleItem">
	<tr><td>${saleItem.item.name}</td>
		<td>${saleItem.item.price}</td>
		<td>${saleItem.quantity}</td>
		<td>${saleItem.item.price * saleItem.quantity}</td>
	</tr>
</c:forEach>
</table>
<h2>�� �ֹ��ݾ� : ${totalAmount}</h2>
<a href="../item/list.shop">��ǰ��Ϻ���</a>
</body>
</html>