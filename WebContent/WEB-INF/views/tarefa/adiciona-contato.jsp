<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum" %>
<head>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.7.3.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js\jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.7.3.custom.min.js"></script>
</head>
<body>
<form action="adicionaContato">
Nome: <input type="text" name="nome" /><br />
E-mail: <input type="text" name="email" /><br />
Endereço: <input type="text" name="endereco" /><br />
Data Nascimento: <caelum:campoData id="id" /><br />
<input type="submit" value="Gravar"/>
</form>
</body>
</html>
