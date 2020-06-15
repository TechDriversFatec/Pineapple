<html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:useBean id="tdao" class="br.com.pineapple.dao.TarefaDAO"/>
	
	<%@ page import ="java.util.ArrayList"%>
	<%@ page import ="java.util.List"%>
	<%@ page import ="br.com.pineapple.domain.Tarefa"%>
	
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<div class="conteudo">
		<form action="TarefaServlet" method="post" class="w3-container w3-card-4 w3-light-grey">
			  <h3>Cadastro de tarefas</h3>
			  <p>      
			  <label>Nome da Tarefa</label>
			  <input class="w3-input" type="text" name="nome_tarefa"></p>
			  <label>Data Inicio</label>
			  <input class="w3-input" type="text" name="data_inicio"></p>
			  <label>Data Entrega</label>
			  <input class="w3-input" type="text" name="data_termino"></p>
		  	  <input type="submit" class="cool-button" value="Cadastrar !">
		</form>
		<br>	
		<button class="cool-button" onclick="myFunction()">Mostrar cadastrados</button>
		<br>
		<div id="myDIV" style="margin-left: 10px;" class="w3-container w3-card-4 w3-light-grey">

			<table class="table">
				<thead>
				<tr>
					<td>Nome Tarefa</td>
					<td>Data Inicio</td>
					<td>Data Termino</td>
					<td>Alterar</td>
					<td>Excluir</td>
				</tr>
				</thead>
			<%
				ArrayList<Tarefa> Flista = tdao.listar();
			
				for(Tarefa tarefa : Flista){
			%>
			<tbody>
					<tr>
						<td><%= tarefa.getNome_tarefa() %></td>
						<td><%= tarefa.getData_inicio() %></td>
						<td><%= tarefa.getData_termino() %></td>		
						<td><a href='includes/editTarefa.jsp?u=<%= tarefa.getNome_tarefa() %>'>Alterar</a></td>
						<td><a href='includes/deleteTarefa.jsp?d=<%= tarefa.getNome_tarefa() %>'>Excluir</a></td>
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
	</div>
</html>