<jsp:useBean id="teste" class="br.com.pineapple.bean.testeBean" type="br.com.pineapple.bean.testeBean" scope="page"></jsp:useBean>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property="*" name="teste"/>
	
	<jsp:getProperty property="nome" name="teste"/><br>
	<jsp:getProperty property="idade" name="teste"/>
</body>
</html>