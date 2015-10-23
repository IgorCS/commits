<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sucesso</title>
<script language="JavaScript" type="text/javascript">
	function validaForm() {
		var u = seleciona.selecionaUsuario;
		if (u.value == "A") {
			location.href = "listaTarefas";
		} else if (u.value == "T") {
			location.href = "listaOS";
		} 
		else if ((u.value == "AL")||(u.value == "C")) {
			location.href = "lista_Ocorrencia";
		}
		
	}
</script>
</head>
<body>
Nova tarefa adicionada com sucesso!
<form method="POST" name="seleciona">
			<select name="selecionaUsuario">

				<option value="${usuarioLogado.tipoUsuario}">${usuarioLogado.nome}</option>

			</select>

			<!--   <a href="listaTarefas">Clique aqui</a>para acessar a lista de tarefas-->
			<!--  <td><a href="listaOS">Voltar</a> -->
			  <br> <br> <input type="button" value="Voltar"
				onclick="validaForm()" />
		</form>

 <!--  <a href="javascript:window.history.go(-2)">Voltar</a>-->
 </td>
</td>
</body>
</html>