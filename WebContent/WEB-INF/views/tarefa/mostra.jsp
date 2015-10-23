<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum"%>
<html>
<head>
<script type="text/javascript">
function ExibeNota(id) {
document.getElementById('nota').style.display = id.checked? 'block' : 'none';
}
</script>
<script type="text/javascript" src="resources/js/glow/1.7.0/core"></script>
<script type="text/javascript" src="resources/js/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/thickbox.js"></script>
<link rel="stylesheet" href="<c:url value="resources/css/960.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/fluid.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet"
	href="<c:url value="resources/css/template.css" />" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/colour.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet"
	href="<c:url value="resources/css/thickbox.css" />" type="text/css"
	media="screen" charset="utf-8" />

</head>

<body>
	<h3>Alterar tarefa - ${tarefa.id}</h3>
	<form action="alteraTarefa" method="post">
		<input type="hidden" name="id" value="${tarefa.id}" />Descrição:<br />
		<input type="hidden" name="tipoUsuario"
			value="${usuarioLogado.tipoUsuario}" /><br />
		<textarea name="descricao" cols="100" rows="5">${tarefa.descricao}</textarea>
		<br /> Usuario que gerou a tarefa:<br />${tarefa.nomeUsuario}<br />
		<br />Responsável:<br />
		
		
		<b><select name="responsavel" id="responsavel">
				<c:forEach items="${usuarios}" var="usuario">
					<!--<c:out value="${'<tag> , &'}"/>-->
					<option value="${usuario.nome}">
						<c:out value="${usuario.nome}" />
					</option>
				</c:forEach>
		</select></b> 
		
		
		
		<br />Finalizado? <input type="checkbox" name="finalizado"
			value="true" ${tarefa.finalizado?'checked':''}
			onclick="ExibeNota(this);" /><br />Dê sua Nota:<select name="nota"
			id="nota">
			<option value="">${tarefa.nota}</option>
			<option value="5">5</option>
			<option value="7">7</option>
			<option value="10">10</option>
		</select> <br />Data de finalização: <br /> <input type="text"
			name="dataFinalizacao"
			value="<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" />" />
		<br /> Data de Abertura: <br /> <input type="text"
			name="dataAbertura"
			value="<fmt:formatDate value="${tarefa.dataAbertura.time}" pattern="dd/MM/yyyy" />" />
		<br /> <br />

		<td id="tarefa_${tarefa.id}"><a href="listaTarefas"
			onClick="finalizaAgora(${tarefa.id})">Enviar</a></td> <input type="submit"
			value="Alterar" />
		<!-- 
	 <div align="center">
<form name="senddata" method="post" action="index.php?area=preco_prod">
<input name="TextoProd" type="hidden" value="precos/bolos.txt"/>
<input name="enviar" type="submit" value="Tabela de preços">
</form>
</div>
	  -->
	</form>
</body>
</html>