<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ���� Ȯ��</title>
</head>
<body>
<h2>��ǰ ���� Ȯ��</h2>
<table>
	<tr><td>��ǰ��</td><td>${item.name }</td></tr>
	<tr><td>��ǰ����</td><td>${item.price }</td></tr>
	<tr><td>��ǰ�̹���</td><td><img src='../img/${item.pictureUrl }' width='200' height='250'></td></tr>
	<tr><td>��ǰ����</td><td>${item.description }</td></tr>
	<tr><td colspan="2">
		<input type="button" value="����" onclick="location.href='delete.shop?id=${item.id}'">
		<input type="button" value="���" onclick="location.href='list.shop'">
		</td>
	</tr>
</table>
</body>
</html>