package br.com.caelum.tarefas.modelo;



import java.util.Calendar;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.TarefaDAO;

public class Tarefa {

	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa) {
		TarefaDAO dao = new TarefaDAO();
		dao.altera(tarefa);
		return "redirect:listaTarefas";
	}

	private Long id;
	@NotNull
	@Size(min = 5)
	private String descricao;
	private boolean finalizado;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar dataFinalizacao;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	// yyyy/mm/dd h:mm:ss a
	private Calendar dataAbertura;
	private String nomeUsuario;

	public String getNomeUsuario() {
		return nomeUsuario;
	}

	public void setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}

	public String Responsavel;

	public String getResponsavel() {
		return this.Responsavel;
	}

	public void setResponsavel(String responsavel) {
		Responsavel = responsavel;
	}

	private String tipoUsuario;

	public String getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	// @DateTimeFormat(pattern = "dd/MM/yyyy")
	// @NotNull
	// @Size(min = 5)
	// private Calendar dataAbertura;

	private String nota;

	public String getNota() {
		return nota;
	}

	public void setNota(String nota) {
		this.nota = nota;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public boolean isFinalizado() {
		return finalizado;
	}

	public void setFinalizado(boolean finalizado) {
		this.finalizado = finalizado;
	}

	public Calendar getDataFinalizacao() {
		return dataFinalizacao;
	}

	public void setDataFinalizacao(Calendar dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}

	public Calendar getDataAbertura() {
		return dataAbertura;
	}

	public void setDataAbertura(Calendar dataAbertura) {
		this.dataAbertura = dataAbertura;
	}

}
