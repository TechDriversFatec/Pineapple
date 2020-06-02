<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<jsp:useBean id="fdao" class="br.com.pineapple.dao.FuncionarioDAO"/>
	
	<%@ page import ="java.util.ArrayList"%>
	<%@ page import ="java.util.List"%>
	<%@ page import ="br.com.pineapple.domain.Funcionario"%>
</head>
<body>
<%
	String cpf = request.getParameter("u");

	Funcionario f1 = new Funcionario();
	f1.setCpf(cpf);

	Funcionario f2 = fdao.consultarCPF(f1);
	
	String[] splitFuncionario = f2.toString().split(" ");

%>

<form action = "../FuncionarioUpdate" method="post">
	 <input type="text" id="cpf" name="cpf" value=<%= splitFuncionario[0] %>><br><br>
	 <input type="text" id="nome" name="nome" value=<%= splitFuncionario[1] %>><br><br>
	 <input type="text" id="email" name="email" value=<%= splitFuncionario[2] %>><br><br>
	 
	 <input type="submit" value="Atualizar !">
 </form>
   
</body>
</html>