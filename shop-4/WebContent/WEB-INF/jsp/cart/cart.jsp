<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ٱ���</title>
</head>
<body>
<h2>��ٱ��� ��ǰ</h2>
<table>
	<tr><td>��ǰ��</td><td>����</td>
		<td>����</td><td>�հ�</td>
	</tr>
	<c:set var="tot" value="${0}" />
	<c:forEach items="${cart.itemList}" var="itemSet" varStatus="stat">
		<tr><td>${itemSet.item.name}</td>
			<td>${itemSet.item.price}</td>
			<td>${itemSet.quantity}</td>
			<td>${itemSet.item.price * itemSet.quantity}
			<a href="cartDelete.shop?index=${stat.index}">��</a></td>
		</tr>
		<c:set var="tot" value="${tot+(itemSet.item.price * itemSet.quantity)}" />
	</c:forEach>
	<tr><td colspan="4" align="right">
	�� ���� �ݾ�:${tot}��</td></tr>
</table><br>
${message}<br>
<a href="../item/list.shop">��ǰ���</a><br>
<a href="../checkout/checkout.shop">����ϱ�</a><br>
</body>
</html>