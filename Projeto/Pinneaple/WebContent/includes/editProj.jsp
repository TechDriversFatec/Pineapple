<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<jsp:useBean id="pdao" class="br.com.pineapple.dao.ProjetoDAO"/>
	
	<%@ page import ="java.util.ArrayList"%>
	<%@ page import ="java.util.List"%>
	<%@ page import ="br.com.pineapple.domain.Projeto"%>
</head>
<body>
<%
	String nome = request.getParameter("u");

	Projeto p1 = new Projeto();
	p1.setNome(nome);

	Projeto p2 = pdao.consultarNome(p1);
	
	String[] splitFuncionario = p2.toString().split(" ");

%>

<form action = "../ProjetoUpdate" method="post">
	 <input type="text" id="nome" name="nome" value=<%= splitFuncionario[0] %>><br><br>
	 <input type="text" id="inicio" name="inicio" value=<%= splitFuncionario[1] %>><br><br>
	 <input type="text" id="entrega" name="entrega" value=<%= splitFuncionario[2] %>><br><br>
	 
	 <input type="submit" value="Atualizar !">
 </form>
   
</body>
</html>