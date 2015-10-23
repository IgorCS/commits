package br.com.caelum.tarefas.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.TarefaDAO;
import br.com.caelum.tarefas.jdbc.ConnectionFactory;
import br.com.caelum.tarefas.modelo.Tarefa;
import br.com.caelum.tarefas.modelo.Usuario;

@Controller
public class TarefasController<JdbcTarefaDAO> extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ServletContext sc;

	private String jsp = "";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		sc = config.getServletContext();
		ConnectionFactory con = new ConnectionFactory();
		con.getConnection();
	}

	@RequestMapping("finalizaTarefa")
	public void finaliza(Long id, HttpServletResponse response) {
		TarefaDAO dao = new TarefaDAO();
		dao.finaliza(id);
		response.setStatus(200);
	}

	/*
	 * @RequestMapping("alteraTarefa") public String altera(Tarefa tarefa){
	 * TarefaDAO dao = new TarefaDAO(); System.out.println("bem 2");
	 * dao.altera(tarefa); return "redirect:listaTarefas"; }
	 */

	@RequestMapping("alteraTarefa")
	public String altera(Usuario usuario, Tarefa tarefa, HttpSession session) {
		TarefaDAO dao = new TarefaDAO();
		System.out.println("ok");
		dao.altera(tarefa);
		if (usuario.getTipoUsuario().equals("A")) {
			return "redirect:listaTarefas";
		} else if (usuario.getTipoUsuario().equals("AL")
				|| (usuario.getTipoUsuario().equals("C") || (usuario
						.getTipoUsuario().equals("")))) {
			return "redirect:lista_Ocorrencia";
			

		}

	/*	else if (usuario.getTipoUsuario().equals("AL")
				|| (usuario.getTipoUsuario().equals("C") || (usuario
						.getTipoUsuario().equals("")))) {
			return "redirect:lista_Ocorrencia";

		}*/
		
		else if (usuario.getTipoUsuario().equals("T")) {
			return "redirect:listaOS";
		}
		return "redirect:listaTarefas";

	}

	/*
	 * @RequestMapping("alteraTarefa") public String altera(Usuario
	 * usuario,Tarefa tarefa,HttpSession session){ TarefaDAO dao = new
	 * TarefaDAO(); //UsuarioDAO usuario = new UsuarioDAO();
	 * System.out.println("Redirecionando para página!!!"); dao.altera(tarefa);
	 * {if (usuario.getTipoUsuario().equals("AL")){return
	 * "tarefa/listar_ocurrence";} return "redirect:loginForm";} }
	 */

	/*
	 * @RequestMapping("alteraTarefa") public String altera(Usuario usuario) {
	 * //TarefaDAO dao = new TarefaDAO(); UsuarioDAO dao = new UsuarioDAO();
	 * System.out.println("bem 3"); //dao.altera(tarefa); //dao.altera(usuario);
	 * return "redirect:listaTarefas"; }
	 */

	@RequestMapping("listaTarefas")
	public String lista(Model model) {
		TarefaDAO dao = new TarefaDAO();
		model.addAttribute("tarefas", dao.lista());
		return "tarefa/lista";
	}

	/*
	 * @RequestMapping("listaOcurrences") public String ok(Model model) {
	 * TarefaDAO dao = new TarefaDAO(); model.addAttribute("tarefas",
	 * dao.lista()); return "tarefa/listaocurrence";}
	 */

	@RequestMapping("mostraTarefa")
	public String mostra(Long id, String nome, Model model) {
		TarefaDAO dao = new TarefaDAO();
		model.addAttribute("usuarios", dao.lista(nome));
		// System.out.println("Usuario:"+ dao.lista(nome));
		model.addAttribute("tarefa", dao.buscaPorId(id));
		// model.addAttribute("tarefas", dao.lista());
		return "tarefa/mostra";
	}

	@RequestMapping("finalizaOS")
	public String finalizar(Long id, String nome, Model model) {
		TarefaDAO dao = new TarefaDAO();
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/finalizar";
	}

	/*
	 * @RequestMapping("listaOS") public String listaocurrence(HttpSession
	 * session, Model model) { TarefaDAO dao = new TarefaDAO(); Usuario usuario
	 * = (Usuario) session.getAttribute("usuarioLouco");
	 * model.addAttribute("tarefas", dao.tarefaTecnico(usuario.getNome()));
	 * return "tarefa/listaocurrence";
	 * 
	 * @RequestMapping("listaTarefas") public String lista(Model model) {
	 * TarefaDAO dao = new TarefaDAO(); model.addAttribute("tarefas",
	 * dao.lista()); return "tarefa/lista"; }
	 * 
	 * 
	 * }
	 */

	@RequestMapping("listaOS")
	public String listaocurrence(HttpSession session, Model model) {
		TarefaDAO dao = new TarefaDAO();
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		model.addAttribute("tarefas", dao.tarefaTecnico(usuario.getNome()));
		return "tarefa/listaocurrence";
		/*
		 * @RequestMapping("listaTarefas") public String lista(Model model) {
		 * TarefaDAO dao = new TarefaDAO(); model.addAttribute("tarefas",
		 * dao.lista()); return "tarefa/lista"; }
		 */

	}

	@RequestMapping("lista_Ocorrencia")
	public String listar_ocurrence(HttpSession session, Model model) {
		TarefaDAO dao = new TarefaDAO();
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		model.addAttribute("tarefas", dao.tarefaUsuario(usuario.getNome()));
		return "tarefa/listar_ocurrence";
	}

	/*
	 * @RequestMapping("novaTarefa") public String form() { return
	 * "tarefa/formulario";
	 * 
	 * }
	 */

	/*
	 * @RequestMapping("efetuaLogin") public String efetuaLogin(Usuario usuario,
	 * HttpSession session) { if (new UsuarioDAO().existeUsuario(usuario)) {
	 * session.setAttribute("usuarioLogado", usuario); if
	 * (usuario.getTipoUsuario().equals("C")){ return "ok"; }else if
	 * (usuario.getTipoUsuario().equals("A")){ return "menu"; }else if
	 * (usuario.getTipoUsuario().equals("T")){ return "lista-os-cliente"; } }
	 * return "redirect:loginForm"; }
	 */

	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefa/formulario";

	}

	@RequestMapping("page")
	public String page(HttpSession session, Model model) {
		TarefaDAO dao = new TarefaDAO();
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		model.addAttribute("tarefas", dao.tarefaUsuario(usuario.getNome()));
		// model.addAttribute("tarefas", dao.tarefaTecnico(usuario.getLogin()));
		return "tarefa/page";
	}

	@RequestMapping("smart")
	// public String smart(HttpSession session, Model model){
	public String listaSmart(HttpSession session, Model model) {
		TarefaDAO dao = new TarefaDAO();
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		model.addAttribute("tarefas", dao.tarefaUsuario(usuario.getNome()));
		int quant = dao.lista().size();
		System.out.println("QUANTIDADE:" + quant);
		return "tarefa/smart";
	}

	@RequestMapping("paginacao")
	public String paginacao() {
		return "tarefa/paginacao";
	}

	/*
	 * @RequestMapping("lista_Ocorrencia") public String
	 * listar_ocurrence(HttpSession session, Model model) { TarefaDAO dao = new
	 * TarefaDAO(); Usuario usuario = (Usuario)
	 * session.getAttribute("usuarioLogado"); model.addAttribute("tarefas",
	 * dao.tarefaUsuario(usuario.getNome())); return "tarefa/listar_ocurrence";
	 * }
	 */

	@RequestMapping("relatorio")
	public String relatorio() {
		return "/index";

	}

	@RequestMapping("rel_abrir")
	public String relatorio_chamar() {
		return "tarefa/testes";
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		if (acao.equals("Relatorio")) {
			RelatorioUsuario.execute(sc, request, response);
		}
		// Redirecionando pagina
		RequestDispatcher rd = request.getRequestDispatcher(jsp);
		rd.forward(request, response);

	}

	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
		if (result.hasFieldErrors("descricao")
				|| (result.hasFieldErrors("dataAbertura"))) {
			return "tarefa/formulario";
		}
		TarefaDAO dao = new TarefaDAO();
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}

	/*
	 * @RequestMapping("adicionaTarefa") public String adiciona(@Valid Tarefa
	 * tarefa, BindingResult result) { if (result.hasFieldErrors("descricao")) {
	 * 
	 * return "tarefa/formulario"; } else if
	 * (result.hasFieldErrors("dataAbertura")) { return "tarefa/formulario"; }
	 * TarefaDAO dao = new TarefaDAO(); dao.adiciona(tarefa); return
	 * "tarefa/adicionada"; }
	 */

	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {
		TarefaDAO dao = new TarefaDAO();
		dao.remove(tarefa);
		return "redirect:listaTarefas";
	}
}
