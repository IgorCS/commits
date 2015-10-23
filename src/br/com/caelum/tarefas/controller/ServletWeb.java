package br.com.caelum.tarefas.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.tarefas.jdbc.ConnectionFactory;
/** 
 * 
 * @author root 
 * @version 
 */  
public class ServletWeb extends HttpServlet {  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletContext sc;  
	
    private String jsp = "";  
      
    public void init(ServletConfig config) throws ServletException {  
        super.init(config);  
        sc = config.getServletContext(); 
        ConnectionFactory con = new ConnectionFactory();
        con.getConnection();  
    }  
      
     /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods. 
     * @param request servlet request 
     * @param response servlet response 
     */  
    protected void service(HttpServletRequest request, HttpServletResponse response)  
    throws ServletException, IOException {  
      String acao = request.getParameter("acao");  
        	//  
        if(acao.equals("Relatorio")){  
        RelatorioUsuario.execute(sc, request, response);  
        }
         //Redirecionando pagina  
        RequestDispatcher rd = request.getRequestDispatcher(jsp);  
        rd.forward(request, response);  
    }  
      
    public void destroy() {  
    	 ConnectionFactory con = new ConnectionFactory();
    	 con.getConnection(); 
    }  
}  
