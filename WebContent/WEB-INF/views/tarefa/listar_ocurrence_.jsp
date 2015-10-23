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
<script type="text/javascript" src="resources/js/jquery-1.4.4.min.js"></script>
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
	href="<c:url value="resources/css/template.css" />" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/colour.css" />"
	type="text/css" media="screen" charset="utf-8" />

<!-- <link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://c.fzilla.com/1286136086-jquery.js"></script>
<script src="http://c.fzilla.com/1291523190-jpaginate.js"></script> -->


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<!-- PAGINAÇÂO GOLIMAR -->
<script type="text/javascript" src="resources/js/smartpaginator.js"></script>
<link rel="stylesheet"
	href="<c:url value="resources/css/smartpaginator.css" />"
	type="text/css" media="screen" charset="utf-8" />
<!-- Paginatione -->



</head>
<body>

<!--PAGINAÇÂO-->


	<script>
		$("#contente").jPaginate({
			items : 4,
			paginaton_class : "myownclass"
		});
		$(document).ready(function() {
			$("#content").jPaginate();
		});
	</script>
	
	<script type="text/javascript">
        $(document).ready(function () {
            
            $('#black-contents').css('display', 'none');
            $('ul li').click(function () {
               
               
                $('#black-contents').css('display', 'none');
               
                if ($(this).attr('id') == '3') $('#black-contents').css('display', '');
            });
             $('#black').smartpaginator({ totalrecords: 5, recordsperpage: 1, datacontainer: 'divs', dataelement: 'div', initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'black' });
            $('#r').html('Page # ' + newPage);
            });
    </script>
	
	
	<!--PAGINAÇÂO-->

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

		<div class="grid_16">
			<table>
				<thead>
					<tr>



						<!-- <form>
					<input type="hidden" value="${usuarioLogado.nome}" id="txtValor"> <input type="submit"
					id="btnEnviar" value="${usuarioLogado.nome}" >
		             </form>-->


					</tr>
				</thead>


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


				<a href="logout"><button class="label warning">SAIR DO
						SISTEMA</button></a>
				<br />
				<br>
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


						<!-- navigation holder -->
						<div class="holder"></div>

						<!-- item container -->
						<ul id="itemContainer">




							<c:forEach items="${tarefas}" var="tarefa" varStatus="id">
								<div id="contente">
									<td>${tarefa.id}</td>
									<td>${tarefa.responsavel}</td>
									<td>${tarefa.nota}</td>
									</tr>
							</c:forEach>

						</ul>
					</thead>
				</table>


				<a href="novaTarefa">Criar nova tarefa</a>
			</table>
		</div>
	</div>

	
		<tfoot>
			<tr>


				<form name="paginationoptions">
                <p><label for="items_per_page">Number of items per page</label><input type="text" value="5" name="items_per_page" id="items_per_page" class="numeric"/></p>
                <p><label for="num_display_entries">Number of pagination links shown</label><input type="text" value="10" name="num_display_entries" id="num_display_entries" class="numeric"/></p>
                <p><label for="num">Number of start and end points</label><input type="text" value="2" name="num_edge_entries" id="num_edge_entries" class="numeric"/></p>
                <p><label for="prev_text">"Previous" label</label><input type="text" value="Prev" name="prev_text" id="prev_text"/></p>
                <p><label for="next_text">"Next" label</label><input type="text" value="Next" name="next_text" id="next_text"/></p>
                <input type="button" id="setoptions" value="Set options" />
            </form>
							
			</tr>
		</tfoot>
</body>
</html>