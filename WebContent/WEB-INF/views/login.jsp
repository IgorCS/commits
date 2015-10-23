<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0046)http://localhost:8080/ocorrencia-cpi/loginForm -->
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
	<center>
		<h1 id="head">Gerenciador de Ocorr�ncias</h1>
		<div id="content" class="container_16 clearfix">
			<div class="grid_6"></div>

			<div class="grid_6">
				<div class="box">
                  <h2>P�gina de Login das Tarefas</h2>
					<form action="efetuaLogin" method="post">
						    Login:<input type="text" name="login"><br>Senha:<input
							type="password" name="senha"><br> <br><input
							type="submit" value="Login">
							<a href="cadastroUsuario">Fa�a seu Cadastro</a>
					</form>
				</div>
			</div>
		</div>


		<div id="foot">
			Copyright � igor carvalho soares - <a
				href="http://www.colegiocpi.com/">http://www.colegiocpi.com</a>
		</div>
	</center>

</body>
</html>