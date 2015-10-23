package br.com.caelum.tarefas.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 Connection conexao = DriverManager.getConnection(
          "sql server");
 */



public class ConnectionSql {
	public  Connection getConnection() {
		System.out.println("conectando!!!");
		try {
		
				//Class.forName("com.mysql.jdbc.Driver");
            DriverManager.registerDriver(new com.sql.jdbc.Driver()); //Essa linha foi a diferença 
			return DriverManager.getConnection("jdbc:sql://localhost/cpi", "root", "root");
		       
        } catch (SQLException e) { 
        	e.printStackTrace();  
            throw new RuntimeException(e);  
              
        }  
    }  
}  

