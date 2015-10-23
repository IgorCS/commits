<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="vda"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript" src="resources/js/glow/1.7.0/core"></script>
<script type="text/javascript" src="resources/js/jquery-1.3.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

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
	<h3>Faça seu Cadastro</h3>
	<div id="content" class="container_16 clearfix">
		<div class="grid_6">
  
			
			
			<form action="cadastroAluno" method="post">
			            <p>
			            <form:errors path="usuario.login" />
						Login(Acesso ao Sistema)
						<strong>Igual o SAE-CADES:</strong><input type="text" 
						name="login" value="${usuario.login}">
						<br>
						<strong>Nome:</strong><input type="text" 
						name="nome" value="${usuario.nome}">
						<br>
						<form:errors path="usuario.senha" />
				         - <strong>Senha:</strong><input type="password" name="senha" ><br> 
				       			       
				       <!--   Prédio:<input type="text" readonly="readonly" name="predio" value="${usuario.predio}"><br>
				        
				        <br /> -->   
	<!--  Prédio:Testes
		<b><select name="predio" id="predio">
				
					<c:out value="${'<tag> , &'}"/>
					<option value="${usuario.predio}">
						<c:out value="${usuario.predio}" />
					</option>
				
		</select></b> -->
		
		Prédio: <br /><strong>2</strong>-Pires de Castro, <strong>3</strong>-Area Leão ,
		<strong>4</strong>-Ilhotas<br />
		<select name="predio"
			id="predio">
			
			<option  value="${usuario.predio}">${usuario.predio}</option>
			<option  value="${2}">Pires de Castro</option>
			<option  value="${3}">Area Leão</option>
			<option  value="${3}">Ilhotas</option>
		</select> 
				        
                       Turma:<input type="text" readonly="readonly" name="turma" value="${usuario.turma}"><br>
				       <form:errors path="usuario.email" />
				       <strong> Email:</strong><input type="text" name="email" value="${usuario.email}"><br>
				       <form:errors path="usuario.telefone" />
				       <strong> Contato(cell):</strong><input type="text" name="telefone"><br>
				       <br /> 
					   <input type="submit" value="Cadastra">
					   </p>
					</form>
		</div>
	</div>
</body>
</html>