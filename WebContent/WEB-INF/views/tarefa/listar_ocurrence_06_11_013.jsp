<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<script type="text/javascript"
	src="resources/js/jquery.leanModal.min.js"></script>
<script type="text/javascript" src="resources/js/glow/1.7.0/core"></script>
<script type="text/javascript"
	src="http://gettopup.com/releases/latest/top_up-min.js"></script>
<title>tarefas</title>
<link rel="stylesheet" href="<c:url value="resources/css/960.css" />"
	type="text/css" media="screen" charset="utf-8" />


<link rel="stylesheet" href="<c:url value="resources/css/fluid.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet"
	href="<c:url value="resources/css/thickbox.css" />" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet"
	href="<c:url value="resources/css/template.css" />" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/colour.css" />"
	type="text/css" media="screen" charset="utf-8" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<script type="text/javascript" src="resources/js/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/thickbox.js"></script>



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
$("#tarefa_"+id).html("Finalizado");
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

	<h1 id="head">Listagem de Tarefas-Bem vindo, ${usuarioLogado.nome}</h1>
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



		<table>
			<div id="dialog" title="Basic dialog"></div>
			<button class="opener">Modal</button>
			<tr>
				<td class="datacelltwo">
			</thead>
			<a href="logout"><button class="label warning">Sair</button></a>



			<!--<a href="#" id="seu_botao" class="efeito_fade"></a><br>-->
			<br />
			<br>

		</table>

		<table class="mytab">

			<thead>
				<tr>
				<tr>
					<th>Processo</th>
					<th>Descrição</th>
					<th>Finalizado?</th>
					<th>Data de finalização</th>
					<th>Data de Abertura</th>
					<th>Responsável</th>
					<th>Nota</th>
				</tr>
				</tr>


				<pg:pager id="p" maxPageItems="10" maxIndexPages="10"
					export="offset,currentPageNumber=pageNumber" scope="request">
					<pg:param name="keywords" />
					<c:forEach items="${tarefas}" var="tarefa" varStatus="id">



						<tr bgcolor="#${id.count % 2 == 0 ? 'DCDCDC' : 'F5F5F5'}">

							<!-- 
					<td><a id="finalized-5001" class="pc important finalized" 
					href="/occurrences/5001/finalized" 
					title="PENDENTE COM CLIENTE">  </a><img src="/images/orange.png" 
					title="Cliente visualizou o último comentário"></img></td>
					altera id="opener" por class="opener" e no js $(".opener").
					 -->



							<td><a href="finalizaOS?id=${tarefa.id}">
									title="Pendente com o Cliente"> 00${tarefa.id}</td>


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
									class="label warning" onClick="finalizaAgora(${tarefa.id})">Finaliza?</a>

								</td>
							</c:if>
							<c:if test="${tarefa.finalizado eq true}">
								<td id="tarefa_${tarefa.id}"><a href="#" id="label success"
									class="label success">Finalizada</a> <!--  <td><span class="label warning">Finalizada</span></td>-->
							</c:if>

							<c:if test="${tarefa.finalizado eq false}">
								<td id="tarefa_${tarefa.id}"><a href="#" id="label notice"
									class="label notice" onClick="">Em Atendimento</a></td>
							</c:if>


							<c:if test="${tarefa.finalizado eq true}">
								<td id="tarefa_${tarefa.id}"><a href="#" id="label"
									class="label" onClick=""><fmt:formatDate
											value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" />
								</a> <!-- <td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
							pattern="dd/MM/yyyy" /> --></td>
							</c:if>
							<td><fmt:formatDate value="${tarefa.dataAbertura.time}"
									pattern="dd/MM/yyyy" /></td>
							<!--  <td>${tarefa.nomeUsuario}</td>-->
							<td>${tarefa.responsavel}</td>
							<td>${tarefa.nota}</td>
							<!--<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
			   <td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>-->
						</tr>
					</c:forEach>

					<tr>
		

		<a href="novaTarefa">Criar nova tarefa</a>
	</div>
	<pg:index>
		<pg:prev>
			<a href="page?p.offset=<%=--pageNumber%>">&lt;&lt; Anterior</a>
			<!--  <a href="ocorrencia-cpi/page=?p.offset=?">&lt;&lt; Anterior</a>-->
		</pg:prev>
		<pg:pages>
			<a href="page?p.offset=<%=pageNumber%>"><%=pageNumber%></a>
		</pg:pages>
		<pg:next>

			<a href="page?p.offset=<%=++pageNumber%>">Próximo &gt;&gt;</a>
			<!--  <a href="<%=pageUrl%>"><%=pageNumber%></a> -->
			<!--<a href="ocorrencia-cpi/page=?p.offset=?">Próximo &gt;&gt;</a>-->
		</pg:next>
	</pg:index>
	</pg:pager></table>
</body>
</html>