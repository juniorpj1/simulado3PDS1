<%@ page import="dominio.Pedido"%>
<%@ page import="dominio.ItemPedido"%>
<%@ page import="java.util.*"%>

<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Detalhes do Pedido</title>
</head>

<body>
	<h2>Pedido Detalhado</h2>
	<br />
	<%
		Pedido x = (Pedido) request.getAttribute("pedido");
		List<ItemPedido> itens = (List<ItemPedido>) request.getAttribute("detalhados");
	%>

	<table border="1">
		<tr>
			<th>Código</th>
			<th>Data</th>
			<th>Preço Total</th>
		</tr>

		<tr>
			<td><%=x.getCodPedido()%></td>
			<td><%=x.getData()%></td>
			<td><%=x.precoTotal()%></td>
		</tr>

	</table>
	<br />
	<h3>Itens do Pedido</h3>
	<table border=1>
		<thead>
			<tr>
				<th>Quantidade</th>
				<th>Subtotal</th>
				<th>Nome do produto</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${detalhados}" var="x">
				<tr>

					<td>${x.getQuantidade()}</td>
					<td>${x.subTotal()}</td>
					<td>${x.getProduto().getNome()}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>