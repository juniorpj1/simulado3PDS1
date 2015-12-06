<%@page import="dominio.Pedido"%>
<%@page import="dominio.ItemPedido"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detalhes</title>
</head>

<body>
	<h2>Detalhes do Pedido</h2>
	<%
		List<Integer> aux = new ArrayList<>();
		List<String> aux2 = new ArrayList<>();
		List<BigDecimal> aux3 = new ArrayList<>();
		Pedido x = (Pedido) request.getAttribute("pedido");

		for (int i = 0; i < x.getItens().size(); i++) {
			aux.add(x.getItens().get(i).getQuantidade());
		}

		for (int i = 0; i < x.getItens().size(); i++) {
			aux2.add(x.getItens().get(i).getProduto().getNome());
		}

		for (int i = 0; i < x.getItens().size(); i++) {
			aux3.add(x.getItens().get(i).getProduto().getPreco());
		}
	%>
	<table border="1">
		<tr>
			<td>Código</td>
			<td>Data</td>
			<td>Preço Total</td>
			<td>Quantidade</td>
			<td>Nome do Produto</td>
			<td>Subtotal</td>
		</tr>

		<tr>
			<td><%=x.getCodPedido()%></td>
			<td><%=x.getData()%></td>
			<td><%=x.precoTotal()%></td>
			<td><%=aux.toString()%></td>
			<td><%=aux2.toString()%></td>
			<td><%=aux3.toString()%></td>
		</tr>

	</table>
</body>
</html>