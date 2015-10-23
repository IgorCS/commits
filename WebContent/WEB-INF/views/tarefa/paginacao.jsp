<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
 <%
ArrayList teste = new ArrayList();
 teste.add("maça");
 teste.add("pêra");
 teste.add("banana");
 teste.add("uva");
 teste.add("melancia");
 teste.add("mamão");
 teste.add("melão");
 
 pageContext.setAttribute("lista", teste);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paginação</title>
</head>
<body>

<pg:pager id="p" maxPageItems="2" maxIndexPages="10" export="offset,currentPageNumber=pageNumber" scope="request">
  <pg:param name="keywords"/>

<c:forEach var="item" items="${lista}">
  <pg:item>
	
	- ${item}	<br>
	
	</pg:item>
</c:forEach>

<br><br>

 <pg:index>
    <pg:prev>
      <a href="<%= pageUrl %>">&lt;&lt; Anterior</a>
    </pg:prev>
    <pg:pages>
       <a href="<%= pageUrl %>"><%= pageNumber %></a> 
    </pg:pages>
    <pg:next>
      <a href="<%= pageUrl %>">Próximo &gt;&gt;</a>
    </pg:next>
  </pg:index>
</pg:pager>

</body>
</html>