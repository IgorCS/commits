<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function finalizaAgora(id) {
$.get("finalizaTarefa?id=" + id);
}
</script>
<script type="text/javascript">
function finalizaDesc(id) {
$.get("finalizaDescricao?id=" + id);
}
</script>



<head>
<script type="text/javascript"
	src="resources/js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/glow/1.7.0/core"></script>
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


	<br>
	<script type="text/javascript"><br>
$(document).ready(function() {<br>
    $('.efeito_fade').append('<span class="hover"></span>').each(function () {<br>
        var $span = $('> span.hover', this).css('opacity', 0);<br>
        $(this).hover(function () {<br>
            $span.stop().fadeTo(500, 1);<br>
        }, function () {<br>
            $span.stop().fadeTo(500, 0);<br>
        });<br>
    });<br>
});<br>
</script>


	<script type="text/javascript">
function finalizaAgora(id) {
$.post("finalizaTarefa", {'id' : id}, function() {
// selecionando o elemento html através da ID e alterando o HTML dele
$("#tarefa_"+id).html("Atendido");
});
}
</script>

	<script type="text/javascript">
function finalizaDescricao(id) {
$.post("finalizaDesc", {'id' : id}, function() {
// selecionando o elemento html através da ID e alterando o HTML dele
$("#tarefadesc_"+id).html("Final");
});
}
</script>
	<h1 id="head">Listagem de Tarefas-Bem vindo,
		${usuarioLogado.nome}-${usuarioLogado.tipoUsuario} <a href="logout"><button class="btn danger">Sair
					</button></a></h1>
	<div id="content" class="container_16 clearfix">
		<div class="grid_4">
			<p>

				<label>Username<small></small>
				</label> <input type="text" />
			</p>
		</div>

		<div class="grid_5">
			<p>
				<label>Department</label> <select>
					<option>Development</option>
					<option>Marketing</option>
					<option>Design</option>
					<option>IT</option>
				</select>
			</p>
		</div>

		<!-- <div class="grid_16">
			<table>
				<thead>
					<tr>

						<th colspan="2" width="10%">Actions</th>
					</tr>
				</thead>
 -->

		<style type="text/css">
td.datacellone {
	background-color: #FFFFFF;
	color: black;
}

td.datacelltwo {
	background-color: #DCDCDC;
	color: black;
}
</style>



		<!--  <table>



			<tr>
				<td class="datacelltwo">
			</thead>
			<a href="logout"><button class="btn danger">Sair
					</button></a>



			<!-- <a href="#" id="seu_botao" class="efeito_fade"></a><br>
			<br />
			<br>

		</table>-->

		<table class="mytab">

			<thead>
				<tr>
				<tr>
					<th>Processo</th>
					<th>Descrição</th>
					<th>Atendido?</th>
					<th>Data de finalização</th>
					<th>Data de Abertura</th>
					<th>Cliente</th>
					<th>Nota</th>
				</tr>
				</tr>



				<c:forEach items="${tarefas}" var="tarefa" varStatus="id">

					<tr bgcolor="#${id.count % 2 == 0 ? 'DCDCDC' : 'F5F5F5'}">
					
					<td>${tarefa.id}<a id="finalized-4910" class="pc important finalized" title="PENDENTE COM CLIENTE" href="/occurrences/4910/finalized"></a>
<img title="Cliente visualizou o último comentário" src="resources/css/orange.png"></td>
						



						<c:if test="${tarefa.finalizado eq false}">
							<td id="tarefadesc_${tarefa.id}"><a
								href="finalizaOS?id=${tarefa.id}"
								onClick="finalizaDescricao(${tarefa.descricao})">${tarefa.descricao}</a>
							</td>
						</c:if>
						<c:if test="${tarefa.finalizado eq true}">
							<td>${tarefa.descricao}</td>
						</c:if>


						<c:if test="${tarefa.finalizado eq false}">

							<td id="tarefa_${tarefa.id}"><a href="#" id="label warning"
								class="label warning" onClick="finalizaAgora(${tarefa.id})" onClick="history.go(0)">Atender</a>
							</td>
						</c:if>
						<c:if test="${tarefa.finalizado eq true}">
							<td id="tarefa_${tarefa.id}"><a href="" id="label success"
								class="label success" onClick="">SIM</a>
							</td>
						</c:if>

						<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
								pattern="dd/MM/yyyy" /></td>
						<td><fmt:formatDate value="${tarefa.dataAbertura.time}"
								pattern="dd/MM/yyyy" /></td>
						<!--  <td>${tarefa.nomeUsuario}</td>-->
						<td>${tarefa.nomeUsuario}</td>
						<td>${tarefa.nota}</td>
						<!--<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
			   <td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>-->
					</tr>
				</c:forEach>
			<tfoot>
				<tr>
					<td colspan="5" class="pagination"><span class="active curved">1</span><a
						href="#" class="curved">2</a><a href="#" class="curved">3</a><a
						href="#" class="curved">4</a> ... <a href="#" class="curved">10million</a>
					</td>
				</tr>
			</tfoot>
		</table>
		<a href="novaTarefa">Criar nova tarefa</a>
	</div>
</body>
</html>