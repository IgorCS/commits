package br.com.caelum.tarefas.modelo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


public class Usuario {
	
	public  String nome;
	@NotNull
	@Size(min = 5)
	public String senha;
	private String tipoUsuario;
	
	private String matricula;
	@NotNull
	@Size(min = 5)
	private String login;
	public String setor;
	private int predio;
	private String turma;
	@NotNull
	@Size(min = 5)
	private String email;
	@NotNull
	@Size(min = 5)
	private String telefone;

	
	public String getTurma() {
		return turma;
	}

	public void setTurma(String turma) {
		this.turma = turma;
	}
	
	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getSetor() {
		return setor;
	}

	public void setSetor(String setor) {
		this.setor = setor;
	}

	public int getPredio() {
		return predio;
	}

	public void setPredio(int predio) {
		this.predio = predio;
	}

	
    public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String usuario) {
		this.nome = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
