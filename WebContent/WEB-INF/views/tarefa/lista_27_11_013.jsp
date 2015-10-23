<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum"%>
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

<script type="text/javascript">

var url = window.location;
var urlString = url.toString();
var urlArray1= urlString.split("http://localhost:8080/ocorrencia-cpi/listaTarefas?pager.offset=");
var urlArray2 = urlString;
document.write(urlArray1);
document.write("<br />") ;
document.write(urlArray2);
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



<!--PAGINAÇÃO GOLIMAR-->
<script type="text/javascript" src="resources/js/smartpaginator.js"></script>
<link rel="stylesheet"
	href="<c:url value="resources/css/smartpaginator.css" />"
	type="text/css" media="screen" charset="utf-8" />
<!-- Paginatione -->
<!-- SCRIPT DA PAGINACAO -->
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





</head>
<body>
	<c:set value="15" var="pageSize" />
	<c:choose>
		<c:when test="${empty param.s}">
			<c:set var="rowStart" value="1" />
		</c:when>
		<c:otherwise>
			<c:set var="rowStart" value="${param.s}" />
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty param.e}">
			<c:set var="rowEnd" value="${pageSize}" />
		</c:when>
		<c:otherwise>
			<c:set var="rowEnd" value="${param.e}" />
		</c:otherwise>
	</c:choose>
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
$.post("finalizaDesc",{'id' : id},function(){
// selecionando o elemento html através da ID e alterando o HTML dele
$("#tarefadesc_"+id).html("Final");
});
}
</script>
	<style type="text/css">
#pagination {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -110px;
	margin-top: -40px;
}
</style>


	<!--PAGINAÇÂO-->
	<h3 id="head">Listagem de Tarefas-Bem vindo, ${usuarioLogado.nome}</h3>
	<ul id="navigation">

		<li><span class="active"><a href="loginForm">SAIR</a></span></li>

		<li><a href="#">Sistemas</a></li>

	</ul>
	<span id="total"></span>
	<div id="content" class="container_16 clearfix">

		<table class="mytab">
			<thead>
				<tr>
				<tr>
					<th>Processo</th>
					<center>
						<th>Descrição</th>
					</center>
					<th>Finalizado?</th>
					<th>Data de finalização</th>
					<th>Data de Abertura</th>
					<th>Usuario</th>
					<th>Responsável</th>
					<th>Nota</th>
					<th>Alterar</th>
					<th>Remover</th>
				</tr>


				<pg:pager  maxPageItems="15" maxIndexPages="15"
					export="offset,currentPageNumber=pageNumber" scope="request">

					<c:forEach items="${tarefas}" var="tarefa" varStatus="id">

            
        
						<pg:item>

							<td><input type="hidden" value="${tarefa.id}"
								id="TB_closeWindowButton"> <!--  <a href="finalizaOS?id=${tarefa.id}"> -->
								<a href="finalizaOS?id=${tarefa.id}"
								?KeepThis="true&TB_iframe=true&height=400&width=700"
								title="Finaliza Ocorrência" class="thickbox"> <input
									type="submit" value="${tarefa.id}">
							</a></td>

							<!--<c:if test="${tarefa.finalizado eq false}">
							            <td id="tarefadesc_${tarefa.id}"><a
								         href="finalizaOS?id=${tarefa.id}">${tarefa.id}</a>
							            </td>
						               </c:if>  -->
							<!-- <td>
								       <a class="opener" href="#"
									   title="Pendente com o Cliente"> </td> -->
							<c:if test="${tarefa.finalizado eq false}">
								<td id="tarefadesc_${tarefa.id}">
									<!-- Aqui ele vai para a página de mostraTarefa(e finaliza) -->
									<!-- <a href="finalizaOS?id=${tarefa.id}"--> <a href=""
									onClick="finalizaDescricao(${tarefa.descricao})">${tarefa.descricao}</a>
								</td>

							</c:if>
							<c:if test="${tarefa.finalizado eq true}">
								<td>${tarefa.descricao}</td>
							</c:if>
							<c:if test="${tarefa.finalizado eq false}">
								<td id="tarefa_${tarefa.id}"><a href="#" id="label warning"
									class="label warning" onClick="finalizaAgora(${tarefa.id})">Finaliza?</a>
									<!--obs:(tem que ficar dentro do onclick)=>finalizaAgora(${tarefa.id})-->

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
							<td>${tarefa.nomeUsuario}</td>
							<td>${tarefa.responsavel}</td>
							<td>${tarefa.nota}</td>
							<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
							<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
							</tr>
						</pg:item>
					</c:forEach>
			</thead>
		</table>


 
<pg:index>  
  
     <pg:first>  
        <a href='<c:out value="${pageUrl}" />'>[Primeira]</a>  
     </pg:first>  
          
    <pg:prev>  
        <a href='<c:out value="${pageUrl}" />'>[Anterior]</a>  
    </pg:prev>   
      
  <!--    <pg:pages>  
        <a href='<c:out value="${pageNumber}"/>'></a>  
    </pg:pages> -->   
 
  
    
 <pg:pages>   
<%
String text = pageUrl;  
text  = pageUrl.replaceAll("[-ocorrencia-cpi/WEB-INF/views/tarefa/lista.jsp?pager.offset=]", ""); 
Integer numero = Integer.parseInt(text);
%>

<!--  for (int cont = 15; cont <= 15; cont++)>-->

     <a href="listaTarefas?pager.offset=<%=numero%>"/><c:out value="${pageNumber}"/></a> 
     </pg:pages> 
     <pg:next>  
<%
String text = pageUrl;  
text  = pageUrl.replaceAll("[-ocorrencia-cpi/WEB-INF/views/tarefa/lista.jsp?pager.offset=]", ""); 
Integer numero = Integer.parseInt(text);
%>
    <a href="listaTarefas?pager.offset=<%=numero%>"/>[Proxima(<%=numero%>)]</a>  
    </pg:next> 
   
         
    <pg:last>  
        <a href='<c:out value="${pageUrl}" />'>[Ultima]</a>  
    </pg:last>   
      
    <a href="javascript:window.close();"><strong>Fechar</strong></a>  
  
  </pg:index>  
		
	</div>
	</pg:pager>



	<br>
	<br>
</body>
</html>