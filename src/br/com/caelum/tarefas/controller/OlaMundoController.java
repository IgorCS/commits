package br.com.caelum.tarefas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OlaMundoController {

	@RequestMapping("/olaMundoSpring")
	public String execute() {
		System.out.println("Executando a lógica com Spring MVC");
		return "ok";
	}

	/*@RequestMapping("cadastroUsuario")
	public String cadastra(Usuario usuario) {
		CadastroDAO dao = new CadastroDAO();
		dao.cadastraUsuario(usuario);
		return "cadastro";
	}*/

}