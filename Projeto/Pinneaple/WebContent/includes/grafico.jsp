<%@page import="br.com.pineapple.domain.TarProj"%>
<%@page import="br.com.pineapple.domain.Tarefa"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.SQLException"%>
<html>
    <%@page import="java.util.ArrayList"%>
    <%@ page import ="java.util.List"%>
    <%@ page import ="br.com.pineapple.domain.Projeto"%>
    <jsp:useBean id="pdaoG" class="br.com.pineapple.dao.ProjetoDAO"/>
    <jsp:useBean id="tdaoG" class="br.com.pineapple.dao.TarefaDAO"/>
    <jsp:useBean id="pdaoT" class="br.com.pineapple.dao.TarProjDAO"/>

        <div id="gantt_here" style='width:88%; height:98%; margin-left:130px; margin-top: 10px;'></div>

    <script>
        gantt.init("gantt_here");

        gantt.parse({
            data: [
            	<%
				ArrayList<Projeto> listaSelectP = pdaoG.listar();
            	int i = 1;
            	HashMap<String, Integer> mapPT = new HashMap<String, Integer>();
				for(Projeto projetosG : listaSelectP){
					String projeto = projetosG.getNome();
					String data = projetosG.getInicio();
            	%>
                { id: <%= i %>, text: "<%= projeto %>", start_date: "<%= data %>", duration: 18, progress: 0.4, open: false },
                
                <%
                mapPT.put(projeto, i);
                i++;
				}
                %>
                <%
                ArrayList<TarProj> listaSelectT = pdaoT.listar();
             	Tarefa tarefinha = new Tarefa();
                for(TarProj tarefaG : listaSelectT){
                	String tarefa = tarefaG.getNome_tarefa();
                	String projetoT = tarefaG.getNome_projeto();
                	tarefinha.setNome_tarefa(tarefa);
                	Tarefa consulta = tdaoG.consultarTarefa(tarefinha);
                	String[] splitTarefaG = consulta.toString().split(" ");
                	
                %>
                	{ id: <%= i %>, text: "<%= tarefa %>", start_date: "<%= splitTarefaG[1] %>", duration: 4, progress: 0.6, parent: <%= mapPT.get(projetoT)%> },
                <%
                i++;
                }
                %>
            ],
            links: [
                
            ]
        });
    </script>
</html>