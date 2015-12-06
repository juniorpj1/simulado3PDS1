<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Formúlario de Datas</title>
</head>

<body>
	
	<h1>Formulário de Datas para Pedidos</h1>
	
	<form action="<%=request.getContextPath()%>/Questao1Servlet" method="post">
	
	Data Inicial: <input type="text" name="dataInicial" /><br />
	Data Final: <input type="text" name="dataFinal" /><br />
	
	<input type="submit" value="Gravar" />
	
	</form>
	
	
</body>

</html>