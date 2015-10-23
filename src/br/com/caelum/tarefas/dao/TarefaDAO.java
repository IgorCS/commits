package br.com.caelum.tarefas.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.tarefas.jdbc.ConnectionFactory;
import br.com.caelum.tarefas.modelo.Tarefa;
import br.com.caelum.tarefas.modelo.Usuario;

public class TarefaDAO {
	Connection connection;

	public TarefaDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adiciona(Tarefa tarefa) {
		//int  count=1;
		//  for(String sql = "insert into tarefas (descricao,nomeUsuario,dataAbertura,responsavel) "
				//	+ "values (?,?,?,?)";  count <= 250 ; count++){
	          //  System.out.println(sql);
    String sql="insert into tarefas (descricao,nomeUsuario,dataAbertura,responsavel) "
				+ "values (?,?,?,?)";
	// INSERT INTO tabela(campo_da_data)VALUES(NOW())
		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, tarefa.getDescricao());
			stmt.setString(2, tarefa.getNomeUsuario());
			stmt.setDate  (3, (java.sql.Date) new Date(tarefa.getDataAbertura().getTimeInMillis()));
            stmt.setString(4, tarefa.getResponsavel());
			stmt.execute();
			stmt.close();
		} catch (SQLException e){
		  throw new RuntimeException(e);
		}
	 
	}
	
	
	
	
	

	public List<Tarefa> lista() {
		try {
			List<Tarefa> tarefas = new ArrayList<Tarefa>();
			// HashMap<String, String> mapa = new HashMap<String, String>();
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM tarefas ORDER BY id DESC");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()){

				//criando objeto tarefa
				Tarefa tarefa = new Tarefa();
				tarefa.setId(rs.getLong("id"));
				tarefa.setDescricao(rs.getString("descricao"));
				tarefa.setNomeUsuario(rs.getString("nomeUsuario"));
				tarefa.setResponsavel(rs.getString("responsavel"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));
				tarefa.setNota(rs.getString("nota"));
				// tarefa.setDataAbertura(rs.getDate("dataAbertura"));
                if (rs.getDate("dataFinalizacao") != null) {
					// montando data atraves do calendar
					Calendar dataFinalizacao = Calendar.getInstance();
					dataFinalizacao.setTime(rs.getDate("dataFinalizacao"));

					tarefa.setDataFinalizacao(dataFinalizacao);
				}
				if (rs.getDate("dataAbertura") != null) {
					// montando data atraves do calendar
					Calendar dataAbertura = Calendar.getInstance();
					dataAbertura.setTime(rs.getDate("dataAbertura"));

					tarefa.setDataAbertura(dataAbertura);
				}
				// adicionar objeto a lista
				tarefas.add(tarefa);
			}

			rs.close();
			stmt.close();
			System.out.println("Listagem Gerada.");
			return tarefas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remove(Tarefa tarefa) {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("delete from tarefas where id = ?");

			stmt.setLong(1, tarefa.getId());
			stmt.execute();
			stmt.close();

			System.out.println("Tarefa Excluida com SUCESSO!");

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Usuario> lista(String nome) {
		try {

			List<Usuario> usuarios = new ArrayList<Usuario>();
			PreparedStatement stmt = this.
					connection.prepareStatement("SELECT * FROM usuarios " +
					"WHERE tipoUsuario='T' OR tipoUsuario='A'");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setLogin(rs.getString("login"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSenha(rs.getString("Senha"));
				usuario.setSetor(rs.getString("Setor"));
				//usuario.setTipoUsuario(rs.getString("tipousuario"));
				usuarios.add(usuario);
			}
			rs.close();
			stmt.close();
			System.out.println("Listagem de Usuarios Gerada.");

			return usuarios;
		} catch (SQLException e) {
			throw new RuntimeException(nome);
			
		}
	}
	
	

	public Tarefa buscaPorId(Long id) {
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM tarefas INNER JOIN usuarios WHERE usuarios.tipoUsuario='T' "
							+ "OR usuarios.tipoUsuario='A' ORDER BY tarefas.id DESC");

			Usuario usuario = new Usuario();

			// stmt.setString(1, nome);
			// System.out.println("User name: " + user.getNome());
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// System.out.println(rs.getLong("id")+ " // " + id);
				if (id == rs.getLong("id")) {
					// criando objeto tarefa
					Tarefa tarefa = new Tarefa();
					tarefa.setId(rs.getLong("id"));
					usuario.setNome(rs.getString("nome"));
					tarefa.setDescricao(rs.getString("descricao"));
					tarefa.setFinalizado(rs.getBoolean("finalizado"));
					tarefa.setNomeUsuario(rs.getString("nomeUsuario"));
					tarefa.setResponsavel(rs.getString("responsavel"));
					tarefa.setTipoUsuario(rs.getString("tipoUsuario"));
					tarefa.setNota(rs.getString("nota"));
					if (rs.getDate("dataFinalizacao") != null) {
						// montando data atraves do calendar
						Calendar dataFinalizacao = Calendar.getInstance();
						dataFinalizacao.setTime(rs.getDate("dataFinalizacao"));

						tarefa.setDataFinalizacao(dataFinalizacao);
					}
					if (rs.getDate("dataAbertura") != null) {
						// montando data atraves do calendar
						Calendar dataAbertura = Calendar.getInstance();
						dataAbertura.setTime(rs.getDate("dataAbertura"));

						tarefa.setDataAbertura(dataAbertura);
					}
					System.out.println("retornada tarefa:" + tarefa.getId());
					return tarefa;
				}
			}
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void altera(Tarefa tarefa) {
		String sql = "update tarefas set descricao=?, finalizado=?, dataFinalizacao=?, nota=?, tipoUsuario=?, responsavel=?"
				    +"where id=?";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);

			stmt.setString(1, tarefa.getDescricao());
			stmt.setBoolean(2, tarefa.isFinalizado());
			if (tarefa.getDataFinalizacao() != null) {
				stmt.setDate(3, new Date(tarefa.getDataFinalizacao().getTimeInMillis()));
			} else {
				stmt.setDate(3, null);
			}
			stmt.setString(4, tarefa.getNota());
			stmt.setString(5, tarefa.getTipoUsuario());
			stmt.setString(6, tarefa.getResponsavel()); 
			
			stmt.setLong(7, tarefa.getId());

			stmt.execute();
			stmt.close();

			System.out.println("DADOS ALTERADOS COM SUCESSO!");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/*
	 public void altera(Tarefa tarefa) {
		String sql = "update tarefas set descricao=?, finalizado=?, dataFinalizacao=?, nota=?, tipoUsuario=?, responsavel=?"
				    +"where id=?";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);

			stmt.setString(1, tarefa.getDescricao());
			stmt.setBoolean(2, tarefa.isFinalizado());
			if (tarefa.getDataFinalizacao() != null) {
				stmt.setDate(3, new Date(tarefa.getDataFinalizacao()
						.getTimeInMillis()));
			} else {
				stmt.setDate(3, null);
			}
			stmt.setString(4, tarefa.getNota());
			stmt.setString(5, tarefa.getTipoUsuario());
			stmt.setString(6, tarefa.getResponsavel()); 
			
			stmt.setLong(7, tarefa.getId());

			stmt.execute();
			stmt.close();

			System.out.println("DADOS ALTERADOS COM SUCESSO!");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	 */

	public void finaliza(Long id) {

		Tarefa tarefa = new TarefaDAO().buscaPorId(id);

		String sql = "update tarefas set finalizado=?, dataFinalizacao=? where id=?";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setBoolean(1, true);
			stmt.setDate(2, new Date(Calendar.getInstance().getTimeInMillis()));
			stmt.setLong(3, tarefa.getId());
			stmt.execute();
			stmt.close();

			System.out.println("DADOS ALTERADOS");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	
	/*ESSA CONSULTA VAI CHAMAR AS TAREFAS DO TÉCNICO RESPONSÁVEL*/

	public List<Tarefa> tarefaTecnico(String login) {

		try {
			List<Tarefa> tarefas = new ArrayList<Tarefa>();
			// HttpSession session = (HttpSession);

			// session.getAttribute("usuarioLogado")
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM tarefas where responsavel=? ORDER BY tarefas.id DESC");
			
			 stmt.setString(1, login);
			System.out.println("User name:" + login);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				

				// criando objeto tarefa
				Tarefa tarefa = new Tarefa();
				tarefa.setId(rs.getLong("id"));
				tarefa.setDescricao(rs.getString("descricao"));
				tarefa.setNomeUsuario(rs.getString("nomeUsuario"));
				tarefa.setResponsavel(rs.getString("responsavel"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));
				tarefa.setNota(rs.getString("nota"));
				// tarefa.setDataAbertura(rs.getDate("dataAbertura"));

				if (rs.getDate("dataFinalizacao") != null) {
					// montando data atraves do calendar
					Calendar dataFinalizacao = Calendar.getInstance();
					dataFinalizacao.setTime(rs.getDate("dataFinalizacao"));

					//tarefa.setDataFinalizacao(dataFinalizacao);
				}
				if (rs.getDate("dataAbertura") != null) {
					// montando data atraves do calendar
					Calendar dataAbertura = Calendar.getInstance();
					dataAbertura.setTime(rs.getDate("dataAbertura"));

					tarefa.setDataAbertura(dataAbertura);
				}
				/*if (rs.getDate("dataAbertura") != null) {
					// montando data atraves do calendar
					Calendar dataAbertura = Calendar.getInstance();
					dataAbertura.setTime(rs.getDate("dataAbertura"));

					//tarefa.setDataAbertura(dataAbertura);
				}*/
				// adicionar objeto a lista
				tarefas.add(tarefa);
			}

			rs.close();
			stmt.close();
			System.out.println("Lista do Técnico!");
			return tarefas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	

	public List<Tarefa> tarefaUsuario(String nome) {

		try {
			List<Tarefa> tarefas = new ArrayList<Tarefa>();
			// HttpSession session = (HttpSession);

			// session.getAttribute("usuarioLogado")
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM tarefas where nomeUsuario = ? ORDER BY id DESC");
			// Usuario user = (Usuario) HttpSession.getAttribute("nome");
			stmt.setString(1,  nome);
			
			// System.out.println("User name: " + user.getNome());
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				try {
					throw new Exception("Não foi encontrado nenhum  Tecnico com o Nome: "+ nome);
									
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// criando objeto tarefa
				Tarefa tarefa = new Tarefa();
				tarefa.setId(rs.getLong("id"));
				tarefa.setDescricao(rs.getString("descricao"));
				tarefa.setNomeUsuario(rs.getString("nomeUsuario"));
				tarefa.setResponsavel(rs.getString("responsavel"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));
				tarefa.setNota(rs.getString("nota"));
				// tarefa.setDataAbertura(rs.getDate("dataAbertura"));

				if (rs.getDate("dataFinalizacao") != null) {
					// montando data atraves do calendar
					Calendar dataFinalizacao = Calendar.getInstance();
					dataFinalizacao.setTime(rs.getDate("dataFinalizacao"));

					tarefa.setDataFinalizacao(dataFinalizacao);
				}
				if (rs.getDate("dataAbertura") != null) {
					// montando data atraves do calendar
					Calendar dataAbertura = Calendar.getInstance();
					dataAbertura.setTime(rs.getDate("dataAbertura"));

					tarefa.setDataAbertura(dataAbertura);
				}
				// adicionar objeto a lista
				tarefas.add(tarefa);
			}

			rs.close();
			stmt.close();
			System.out.println("Lista gerada com Sucesso!");
			return tarefas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	

}
