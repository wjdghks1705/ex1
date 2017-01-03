<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><spring:message code="itemMenu.title" /></title>
</head>
<body>
<a href="create.shop">��ǰ���</a>
<table border="1">
	<tr>
		<th align="center" width="80">��ǰID</th>
		<th align="center" width="320">��ǰ��</th>
		<th align="center" width="100">����</th>
		<th align="center" width="80">����</th>
		<th align="center" width="80">����</th>
	</tr>
	<c:forEach items="${itemList}" var="item">
		<tr><td align="center">${item.id}</td>
		<td align="left">
		<a href="detail.shop?id=${item.id}">${item.name}</a></td>
		<td align="right">
		<f:formatNumber type="CURRENCY"
			currencySymbol="" value="${item.price}"
			minFractionDigits="0" />��</td>
		<td align="center">
			<a href="edit.shop?id=${item.id}">����</a></td>	
		<td align="center">
			<a href="confirm.shop?id=${item.id}">����</a></td>
		</tr>	
	</c:forEach>
</table>
</body>
</html>