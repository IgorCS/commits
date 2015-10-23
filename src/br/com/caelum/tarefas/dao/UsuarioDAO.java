package br.com.caelum.tarefas.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.caelum.tarefas.jdbc.ConnectionFactory;
import br.com.caelum.tarefas.modelo.Usuario;

public class UsuarioDAO {
	Usuario user = new Usuario();

	Connection connection;

	public UsuarioDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void cadastraUsuario(Usuario usuario) {
		// int count=1;
		String sql = "insert into usuarios(nome,login,senha,setor,predio,telefone,email) "
				+ "values (?,?,md5(?),?,?,?,?)";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);

			// return retorna;
			// System.out.println("Hash=>"+retorna) ;
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getLogin());
			stmt.setString(3, usuario.getSenha());
			stmt.setString(4, usuario.getSetor());
			stmt.setLong(5, usuario.getPredio());
			stmt.setString(6, usuario.getTelefone());
			stmt.setString(7, usuario.getEmail());
			//stmt.setString(8, usuario.getTurma());
			
            System.out.println("Usuario "+usuario.nome+" Cadastrado.");
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		

	}
	
	

	public List<Usuario> lista(String login) {
		try {

			List<Usuario> usuarios = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from usuarios");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setLogin(rs.getString("login"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSenha(rs.getString("Senha"));
				usuario.setMatricula(rs.getString("Matricula"));
				usuario.setTipoUsuario(rs.getString("tipousuario"));
				usuario.setPredio(rs.getInt("predio"));
			}

			return usuarios;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public void cadastraAluno(Usuario usuario) {
		// int count=1;
		String sql = "insert into usuarios(nome,login,senha,setor,predio,telefone,email,turma,matricula) "
				+ "values (?,?,md5(?),?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);

			 // return retorna;
			// System.out.println("Hash=>"+retorna) ;
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getLogin());
			stmt.setString(3, usuario.getSenha());
			stmt.setString(4, usuario.getSetor());
			stmt.setInt(5, usuario.getPredio());
			stmt.setString(6, usuario.getTelefone());
			stmt.setString(7, usuario.getEmail());
			stmt.setString(8, usuario.getTurma());
			stmt.setString(9, usuario.getMatricula());
			
            System.out.println("Usuario "+usuario.nome+"::"+usuario.getLogin()+" Cadastrado.");
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		

	}

	public boolean existeUsuario(Usuario usuario) {
		String sql = "select * from usuarios where login= ?  and senha= ? ";

		/*
		 * ResultSet rs = stmt.executeQuery();
		 * System.out.println(usuario.getTipo_usuario());
		 */

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);

			// Criptografia criptografia = new Criptografia();
			String senha = (usuario.getSenha());
			MessageDigest md = null;
			try {
				md = MessageDigest.getInstance("MD5");
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			md.update(senha.getBytes());
			BigInteger hash = new BigInteger(1, md.digest());
			String retorna = hash.toString(16);
			// String retornaSenha1 = hash.toString(16);
			// if (retorna.length() %2 != 0)

			// return retorna;
			System.out.println("Hash:" + retorna);

			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, retorna);
			// stmt.setString(3, usuario.getNome());

			// stmt.setString(3, criptografia.usuario.getSenha());
			// System.out.println(criptografia.usuario.getSenha());
			stmt.execute();

			ResultSet rs = stmt.executeQuery();

			// verifica se existe retorno na consulta
			if (rs.next()) {
				usuario.setTipoUsuario(rs.getString("tipousuario"));
				usuario.setNome(rs.getString("nome"));
				usuario.setLogin(rs.getString("login"));
				System.out.println("V:" + usuario.getNome() + "-"
						+ usuario.getTipoUsuario() + " -> "
						+ usuario.getLogin());
				stmt.close();
				return true;
			} else {
				System.out.println("F");
				stmt.close();
				return false;
			}

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean existeAluno(Usuario usuario) {
		String sql = "select * from usuarios where matricula= ?";
        try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setString(1, usuario.getMatricula());
            stmt.execute();
            ResultSet rs = stmt.executeQuery();
            // verifica se existe retorno na consulta
			if (rs.next()) {
				usuario.setTipoUsuario(rs.getString("tipousuario"));
				usuario.setNome(rs.getString("nome"));
				usuario.setMatricula(rs.getString("matricula"));
				usuario.setNome(rs.getString("nome"));
				usuario.setPredio(rs.getInt("predio"));
				usuario.setTurma(rs.getString("turma"));
				usuario.setEmail(rs.getString("email"));
				usuario.setLogin(rs.getString("login"));
				usuario.setTelefone(rs.getString("telefone"));
				System.out.println("Retorna:" + usuario.getNome()+"-"
						+ usuario.getTipoUsuario() + " -> "
						+ usuario.getMatricula()
						+ " -> "+usuario.getPredio()
						+ " -> "+usuario.getTurma()
						+ " -> "+usuario.getEmail()
						+ " -> "+usuario.getLogin()
						+ " -> "+usuario.getTelefone()
						);
				stmt.close();
				return true;
			} else {
				System.out.println("Não Retornou Nada");
				stmt.close();
				return false;
			}

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
