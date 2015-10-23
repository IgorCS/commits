package br.com.caelum.tarefas.filtro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import br.com.caelum.tarefas.jdbc.ConnectionFactory;


public abstract class FiltroConexao implements Filter {

	@Override
	public void destroy() {

	}

	// implementação do init e destroy, se necessário
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try {
			Connection connection = new ConnectionFactory().getConnection();
			//pendurando a connection na requisição
			request.setAttribute("conexao", connection);
			chain.doFilter(request, response);
			connection.close();
		    }catch(SQLException e){
		    throw new ServletException(e);
		}
	}
}
