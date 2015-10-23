package br.com.caelum.tarefas.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.TarefaDAO;
import br.com.caelum.tarefas.dao.UsuarioDAO;
import br.com.caelum.tarefas.modelo.Usuario;

@Controller
public class LoginController {

	/*@RequestMapping("cadastroUsuario")
	public String form(Usuario usuario) {
		UsuarioDAO dao = new UsuarioDAO();
		dao.cadastraUsuario(usuario);
		return "cadastro";
	}*/
	
	
	
	/*@RequestMapping("cadastroAluno")
	public String cadastraAluno(@Valid Usuario usuario,BindingResult result ,String setor, Model model
			){
		if (result.hasFieldErrors("senha")||(result.hasFieldErrors("nome")
		||(result.hasFieldErrors("email") ||(result.hasFieldErrors("telefone"))))){
		TarefaDAO dao = new TarefaDAO();
	    model.addAttribute("tarefas", dao.listaAlunos());
        return "cad-aluno";
		}
	    UsuarioDAO dao = new UsuarioDAO();
		dao.cadastraUsuario(usuario);
		return "login";
       }*/
   
	@RequestMapping("loginForm")
	public String loginForm(@Valid Usuario usuario,BindingResult result) {
		if (result.hasFieldErrors("senha")||(result.hasFieldErrors("login"))){
	return "login";
		}
	return null;
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) {
		if (new UsuarioDAO().existeUsuario(usuario)) {
			session.setAttribute("usuarioLogado", usuario);
			/*
			 * if (usuario.getTipoUsuario().equals("C")){ return "menu"; }else
			 * if (usuario.getTipoUsuario().equals("T")){ return "menu"; }else
			 * if (usuario.getTipoUsuario().equals("A")){
		     */
			return "menu";
		}
		return "redirect:loginForm";
	}
	
	
	
	 @RequestMapping("insAluno")
		public String cadastro(@Valid Usuario usuario,BindingResult result) {
			if (result.hasFieldErrors("matricula")){
		return "alunologin";
			}
		return "alunologin";
		}
	
	@RequestMapping("cadastroAluno")
	public String cadastraAluno(@Valid Usuario usuario,BindingResult result , Model model,
			HttpSession session){
		if (result.hasFieldErrors("senha")||
			result.hasFieldErrors("telefone")||
			result.hasFieldErrors("email")){
			session.setAttribute("usuarioLogado", usuario);
		//&& new  UsuarioDAO().existeUsuario(usuario)
	    UsuarioDAO dao = new UsuarioDAO();
	    model.addAttribute("usuarios", dao.existeAluno(usuario));
        return "cad-aluno";
		}
		 UsuarioDAO dao = new UsuarioDAO();
			dao.cadastraAluno(usuario);
			return "login";
	   }
	
	@RequestMapping("cadastroUsuario")
	public String cadastraUsuario(@Valid Usuario usuario,BindingResult result ,String setor, Model model
			){
		if (result.hasFieldErrors("senha")||(result.hasFieldErrors("nome"))){
			TarefaDAO dao = new TarefaDAO();
	        model.addAttribute("tarefas", dao.lista(setor));
        return "cadastro";
		}
	    UsuarioDAO dao = new UsuarioDAO();
		dao.cadastraUsuario(usuario);
		return "login";
       }

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}

}
