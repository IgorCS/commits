<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*" %>
<html>
<head><title>Aprendendo-JSP</title>
</head>
<body>

<%
  // Este exemplo mostra como paginar os resultados de uma
  // tabela MySQL
  // o nome da base de dados é "test"
 
  String url = "jdbc:mysql://localhost/cpi";
  String usuario = "root";
  String senha   = "root";
  
  Connection conn = null;
  
  try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection(url, usuario, senha);
  }
  catch(SQLException ex){
    out.println("SQLException: " + ex.getMessage() + "<br>");
    out.println("SQLState: "     + ex.getSQLState() + "<br>");
    out.println("VendorError: "  + ex.getErrorCode() + "<br>");
  }
  catch(Exception e){
    out.println("Problemas ao tentar conectar com o banco de dados");
  }
  
  // conn é a conexão com o banco de dados
  int limit = 10; // quantidade de resultados por página                
  
  // obtém a quantidade de registros
  PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(*) AS c FROM TAREFAS");
  ResultSet rs = pstmt.executeQuery();
  rs.next();
  int total_rows = Integer.parseInt(rs.getString("c"));
  String pagina = request.getParameter("pagina"); 
  // página atual
  if(pagina == null){
     pagina = "1";
  }
  
  int limitValue = (Integer.parseInt(pagina) * limit) - limit;  
  
  PreparedStatement pstmt2 = conn.prepareStatement("SELECT * FROM TAREFAS LIMIT " + limitValue + ", " + limit);
  ResultSet rs2 = pstmt2.executeQuery();
  
  while(rs2.next()){
    int id = rs2.getInt("ID");
    out.println("ID: " + id + "<br>");
    String nome = rs2.getString("DESCRICAO");
    out.println("DESC: " + nome + "<br>");
    }
  
  int anterior;
  if(Integer.parseInt(pagina) != 1){  
    anterior = Integer.parseInt(pagina) - 1; 
    out.println("<a href=?pagina=" + anterior + ">" + limit + " Anteriores</a>");
  }
  else 
    out.println(limit + "Anteriores");
    int numOfPages = total_rows / limit;  
    int i;
  
  for(i = 1; i <= numOfPages; i++)   { 
    if(i == Integer.parseInt(pagina)){ 
      out.println("<b>" + i + "</b> "); 
    }
    else{ 
      out.println("<a href=?pagina=" + i + ">" + i + "</a> ");  
    } 
  }
  
  if((total_rows % limit) != 0){ 
    if(i == Integer.parseInt(pagina)){ 
      out.println(i + " "); 
    }
    else{ 
      out.println("<a href=?pagina=" + i + ">" + i + "</a> "); 
    } 
  } 

  int proxima;
  if((total_rows - (limit * Integer.parseInt(pagina))) > 0){ 
    proxima = Integer.parseInt(pagina) + 1; 
          
    out.println("<a href=?pagina=" + proxima + ">Próximos " + limit + "</a>");  
  }
  else 
    out.println("Próximos " + limit);   
%>

</body>
</html>