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
<script type="text/javascript" src="resources/js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery.leanModal.min.js"></script>
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






    <script src="http://c.fzilla.com/1286136086-jquery.js"></script>  
    <script src="http://c.fzilla.com/1291523190-jpaginate.js"></script>  
    <script> 
    $("#content").jPaginate({items: 4, paginaton_class: "myownclass"});  
    $(document).ready(function(){  
        $("#content").jPaginate();                         
    });  
    </script>  


</head>
<body>



	


							<tr bgcolor="#${id.count % 2 == 0 ? 'DCDCDC' : 'F5F5F5'}">


		 <div id='content'>  
        <p>1Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>  
        <p>Vestibulum consectetur ipsum sit amet urna euismod imperdiet aliquam urna laoreet.</p>  
        <p>Curabitur a ipsum ut elit porttitor egestas non vitae libero.</p>  
        <p>Pellentesque ac sem ac sem tincidunt euismod.</p>  
        <p>2Duis hendrerit purus vitae nibh tincidunt bibendum.</p>  
        <p>Nullam in nisi sit amet velit placerat laoreet.</p>  
        <p>Nulla sed purus et tellus convallis scelerisque.</p>  
        <p>Nam at justo ut ante consectetur faucibus.</p>  
        <p>Proin dapibus nisi a quam interdum lobortis.</p>  
        <p>Nunc ornare nisi sed mi vehicula eu luctus mauris interdum.</p>  
        <p>Mauris auctor suscipit tellus, at sodales nisi blandit sed.</p>  
    </div>  
   
    </tr>
</body>
</html>