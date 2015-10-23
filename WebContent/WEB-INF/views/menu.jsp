<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/js/glow/1.7.0/core"></script>
<script type="text/javascript" src="resources/js/jquery-1.3.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>menu</title>
<link rel="stylesheet" href="<c:url value="resources/css/960.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/fluid.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet"
	href="<c:url value="resources/css/template.css" />" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/colour.css" />"
	type="text/css" media="screen" charset="utf-8" />

<script language="JavaScript" type="text/javascript">
	function validaForm() {
		var u = seleciona.selecionaUsuario;
		if (u.value == "A") {
			location.href = "listaTarefas";

		} else if (u.value == "T") {
			location.href = "listaOS";

		} else if (u.value == "C") {
			location.href = "lista_Ocorrencia";

		} else if (u.value == "AL") {
			location.href = "lista_Ocorrencia";
		} else if (u.value == "") {
			location.href = "lista_Ocorrencia";
		}
	}
</script>


</head>
<body>
	<center>
		<h2>Página inicial da Lista de Tarefas</h2>
		<p>
			Area do Usuário,Bem Vindo:${usuario.nome} <a href="logout">Sair
				do sistema</a>
		</p>
		<form method="POST" name="seleciona">
			<select name="selecionaUsuario">

				<option value="${usuarioLogado.tipoUsuario}">${usuarioLogado.login}</option>

			</select>

			<!--   <a href="listaTarefas">Clique aqui</a>para acessar a lista de tarefas-->
			<br> <br> <input type="button" value="Entrar"
				onclick="validaForm()" />
		</form>
	</center>
</body>
</html>