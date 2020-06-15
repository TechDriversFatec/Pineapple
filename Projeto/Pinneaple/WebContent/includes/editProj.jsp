<%@page import="br.com.pineapple.dao.FuncionarioDAO"%>
<%@page import="br.com.pineapple.domain.ProjFunc" %>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<jsp:useBean id="pdao" class="br.com.pineapple.dao.ProjetoDAO"/>
	<jsp:useBean id="pfdao" class="br.com.pineapple.dao.ProjFuncDAO"/>
	<jsp:useBean id="fdao" class="br.com.pineapple.dao.FuncionarioDAO"/>
	
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
	
	String splitFuncionario[] = p2.toString().split(" ");

%>

<form action = "../ProjetoUpdate" method="post">
	 <input type="text" id="nome" name="nome" value=<%= splitFuncionario[0] %>><br><br>
	 <input type="text" id="inicio" name="inicio" value=<%= splitFuncionario[1] %>><br><br>
	 <input type="text" id="entrega" name="entrega" value=<%= splitFuncionario[2] %>><br><br>
	 
	 <input type="submit" value="Atualizar !">
 </form>
 <br>
 	  <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black">Editar Funcionarios</button>
 	  
    <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-black"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">�</span>
        
        <h3>Funcionarios</h3>
      </header>
      <div class="w3-container">


    <%@ page import ="java.util.ArrayList"%>
	<%@ page import ="java.util.List"%>
	<%@ page import ="br.com.pineapple.domain.Funcionario"%>
	
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
	<div class="conteudo">
		<br>
		<form action = "../ProjFuncServlet" method="post">
			<input type="text" id="nomeP" name="nomeP" hidden="true" value="<%= splitFuncionario[0] %>" >
				<select name="funcionarios" id="funcionarios">
					<%
					  	ArrayList<Funcionario> listaSelect = fdao.listar();
						
						for(Funcionario funcionario : listaSelect){
					  %>	  	
					  		 <option value = <%= funcionario.getCpf() %> > <%= funcionario.getNome() %> </option>
					  <%
						}
					  %>
				</select>
				<br>
			<input type="submit" value="Adicionar">
		
		</form>
		</div>	
		<br>
		<div id="myDIV" style="margin-left: 10px;" class="w3-container w3-card-4 w3-light-grey">
		
			<table class="table">
				<thead>
				<tr>
					<td>Nome</td>
					<td>E-mail</td>
					<td>Delete</td>
				</tr>
				</thead>
			<%	
				ProjFunc pj = new ProjFunc();	
				pj.setNome(nome);	
			
				ArrayList<ProjFunc> lista = pfdao.listar(pj);
				
				Funcionario f = new Funcionario();
				
				for(ProjFunc rel : lista){
					f.setCpf(rel.getCpf());
					f.setCpf(f.getCpf());
					Funcionario f2 = fdao.consultarCPF(f);
					String[] splitF = f2.toString().split(" ");
					
			%>
			<tbody>
					<tr>
						<td><%= splitF[1] %></td>
						<td>-</td>
						<td><a href='pjDelete.jsp?d=<%= splitFuncionario[0] + "&d2=" + f.getCpf() %>'>Excluir</a></td>
					</tr>
			<%
				}
			%>
			</tbody>
			</table>	

		</div>
		<br>
	 </div>
    </div>
  </div>
   
</body>
</html>