package br.com.caelum.tarefas.jdbc;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 Connection conexao = DriverManager.getConnection(
 "sql server");
 */

public class ConnectionFactory {
	public Connection getConnection() {
		System.out.println("conectando!!!");
		try {

			// Class.forName("com.mysql.jdbc.Driver");
        //jdbc:mysql://localhost:3306/db?zeroDateTimeBehavior=convertToNull 
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());   // Essa
																		// linha
																	   // foi a
																	  // diferença
			return DriverManager.getConnection("jdbc:mysql://localhost/cpi",
					"root", "root");
			//

		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);

		}
	}
}
