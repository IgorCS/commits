package br.com.caelum.tarefas.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 Connection conexao = DriverManager.getConnection(
          "sql server");
 */



public class Conexao {
	public  Connection getConnection() {
		System.out.println("conectando_no_sql_server_2008!!!");
		try {
		
				//Class.forName("com.mysql.jdbc.Driver");
			
			  
           DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver()); //Essa linha foi a diferença 
			//DriverManager.registerDriver(new com.);
			return DriverManager.getConnection("jdbc:sqlserver://./cades", "sa", "root");
		       
        } catch (SQLException e) { 
        	e.printStackTrace();  
            throw new RuntimeException(e);  
              
        }  
    }  
}  

