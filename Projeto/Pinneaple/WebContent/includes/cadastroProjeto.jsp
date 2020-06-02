	<%@page import="java.util.ArrayList"%>
	<%@ page import ="java.util.List"%>
	<%@ page import ="br.com.pineapple.domain.Projeto"%>
	<jsp:useBean id="pdao" class="br.com.pineapple.dao.ProjetoDAO"/>
	
<html>
	<div class="conteudo">	
		
		<form method="post" action="ProjetoServlet" class="w3-container w3-card-4 w3-light-grey">
			  <h3>Cadastro de projetos</h3>
			  <p>      
			  <label>Nome do projeto</label>
			  <input class="w3-input" type="text" id="nome" name="nome"></p>
			  <label>Data inicio</label>
			  <input class="w3-input" type="text" id="inicio" name="inicio"></p>
			  <label>Data entrega</label>
			  <input class="w3-input" type="text" id="entrega" name="entrega"></p>
		  	  <input type="submit" class="cool-button" value="Cadastrar !">
		</form>
		<br>
		<button class="cool-button" onclick="myFunction()">Mostrar cadastrados</button>
		<br>
		<div id="myDIV" style="margin-left: 10px;" class="w3-container w3-card-4 w3-light-grey">

			<table class="table">
				<thead>
				<tr>
					<td>Nome do projeto</td>
					<td>Data inicio</td>
					<td>Data termino</td>
					<td>Alterar</td>
					<td>Excluir</td>
				</tr>
				</thead>
			<%
				ArrayList<Projeto> listarG = pdao.listar();
			
				for(Projeto projeto : listarG){
			%>
			<tbody>
					<tr>
						<td><%= projeto.getNome() %></td>
						<td><%= projeto.getInicio() %></td>
						<td><%= projeto.getEntrega() %></td>
						<td><a href='includes/editProj.jsp?u=<%= projeto.getNome() %>'>Alterar</a></td>
						<td><a href='includes/deleteProj.jsp?d=<%= projeto.getNome() %>'>Excluir</a></td>
					</tr>
			<%
				}
			%>
			</tbody>
			</table>	

		</div>
		<script>
		function myFunction() {
		  var x = document.getElementById("myDIV");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
		

		</script>
		<br>
		<br>
	</div>
</html>