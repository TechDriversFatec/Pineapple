<%@page import="java.sql.SQLException"%>
<html>
	<%@page import="java.util.ArrayList"%>
	<%@ page import ="java.util.List"%>
	<%@ page import ="br.com.pineapple.domain.Projeto"%>
	<jsp:useBean id="pdaoG" class="br.com.pineapple.dao.ProjetoDAO"/>
	
	<div class="conteudo">
	<h1>Relatório</h1>
	<span style="color: black;">
	<div style="position:relative" class="gantt" id="GanttChartDIV"></div>
	</div>
	</span>
	
	<script>
	// here's all the html code neccessary to display the chart object

	  // Future idea would be to allow XML file name to be passed in and chart tasks built from file.

	  var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'day');

		g.setShowRes(1); // Show/Hide Responsible (0/1)
		g.setShowDur(1); // Show/Hide Duration (0/1)
		g.setShowComp(1); // Show/Hide % Complete(0/1)
	    g.setCaptionType('Resource');  // Set to Show Caption (None,Caption,Resource,Duration,Complete)

	  //var gr = new Graphics();
	   
	  if( g ) {
		<%
			ArrayList<Projeto> listar = pdaoG.listar();

			for(Projeto projetos : listar){
		%>


	    // Parameters             (pID, pName,                  pStart,      pEnd,        pColor,   pLink,          pMile, pRes,  pComp, pGroup, pParent, pOpen, pDepend, pCaption)
		
		// You can also use the XML file parser JSGantt.parseXML('project.xml',g)

	    //g.AddTaskItem(new JSGantt.TaskItem(1,   'Define Chart API',     '',          '',          'ff0000', 'http://google.com', 0, 'Brian',     0, 1, 0, 1));
	    //g.AddTaskItem(new JSGantt.TaskItem(11,  'Chart Object',         '7/20/2008', '7/20/2008', 'ff00ff', 'http://www.yahoo.com', 1, 'Shlomy',  100, 0, 1, 1));
	    //g.AddTaskItem(new JSGantt.TaskItem(12,  'Task Objects',         '',          '',          '00ff00', '', 0, 'Shlomy',   40, 1, 1, 1));
	    //g.AddTaskItem(new JSGantt.TaskItem(121, 'Constructor Proc',     '7/21/2008', '8/9/2008',  '00ffff', 'http://www.yahoo.com', 0, 'Brian T.', 60, 0, 12, 1));
	    //g.AddTaskItem(new JSGantt.TaskItem(122, 'Task Variables',       '8/6/2008',  '8/11/2008', 'ff0000', 'http://google.com', 0, 'Brian',         60, 0, 12, 1,121));
		//g.AddTaskItem(new JSGantt.TaskItem(123, 'Task by Minute/Hour',       '8/6/2008',  '8/11/2008 12:00', 'ffff00', 'http://google.com', 0, 'Ilan',         60, 0, 12, 1,121));
	    //g.AddTaskItem(new JSGantt.TaskItem(124, 'Task Functions',       '8/9/2008',  '8/29/2008', 'ff0000', 'http://google.com', 0, 'Anyone',   60, 0, 12, 1, 0, 'This is another caption'));
	    var nome = "<%= projetos.getNome() %>"
	    var inicio = "<%= projetos.getInicio() %>"
	    var entrega = "<%= projetos.getEntrega() %>"
	    var i = 1
	    g.AddTaskItem(new JSGantt.TaskItem(i,   nome,    inicio , entrega , 'ffff00', 'http://google.com', 0, 'Brian',    20, 0, 0, 1,122));
	    
	    i++;

	 	<%
			}
	 	%>
		
	    g.Draw();	
	    g.DrawDependencies();

	  }

	  else

	  {

	    alert("not defined");

	  }
	</script>
</html>