<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="vda"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar tarefas</title>
<script type="text/javascript" src="resources/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="resources/js/jquery-ui-1.7.3.custom.min.js"></script>



<title>tarefas</title>
<link rel="stylesheet" href="<c:url value="resources/css/960.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/fluid.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet"
	href="<c:url value="resources/css/template.css" />" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/colour.css" />"
	type="text/css" media="screen" charset="utf-8" />





</head>

<body>
	<h3 id="head">Adicionar tarefas, ${usuarioLogado.nome}</h3>

	<div id="content" class="container_16 clearfix">
		<div class="grid_6">

			<form:errors path="tarefa.descricao" />
			<form action="adicionaTarefa" method="post">
				Digite o problema do chamado aqui:<br />
				<center>
					<textarea name="descricao" rows="5" cols="100"></textarea>
				</center>
				<br /> <br /> <input type="text" name="nomeUsuario"
					value="${usuarioLogado.nome}" readonly /><br /> 

				<jsp:useBean id="dataAbertura" class="java.util.Date" />
				
				<!--
				Data de Abertura:
				<br /> <input type="text" name="dataAbertura"
					value="<fmt:formatDate   type="both" value="${dataAbertura}" />" readonly />
                   <!--  <vda:campoData id="dataAbertura" />
              <br /> <br /> <input type="submit" value="Adicionar">--> 
              Data de Abertura:
				<br /> <input type="text" name="dataAbertura"
					value="<fmt:formatDate   value="${dataAbertura}" />" readonly />
                    <vda:campoData id="dataAbertura" />
              <br /> <br /> <input type="submit" value="Adicionar">
			</form>
		</div>
	</div>
</body>
</html>