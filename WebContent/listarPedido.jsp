<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Empresas</title>
</head>

<body>
	<h2>Lista de Empresas</h2>
	<br />

	<table border=1>
		<thead>
			<tr>
				<th>Código</th>
				<th>Data</th>
				<th>Preço Total</th>
				<th colspan=2>Ação</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lista}" var="x">
				<tr>
				
					<td>${x.codPedido}</td>
					<td>${x.data}</td>
					<td>${x.precoTotal()}</td>
					
			<td><a href="<%=request.getContextPath()%>/Questao1Servlet?cmd=detalhes&cod=${x.codPedido}">Mostrar detalhes</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>