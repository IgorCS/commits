package br.com.caelum.tarefas.controller;

/** 
 * 
 * @author root 
 */  
  
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.tarefas.dao.UsuariosRelDAO;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
  
  
public class RelatorioUsuario {  
	private Long id;  
    private String login;  
    private String tipoUsuario;  
    private String nome;     
    private static List <Usuario______> listUsers;   
      
    public static void execute(ServletContext sc, HttpServletRequest request, HttpServletResponse response) {          
        try {  
            List <RelatorioUsuario> listRelusers = new ArrayList<RelatorioUsuario>();  
              
            listUsers = UsuariosRelDAO.getAll();
              
            for(int i=0; i < listUsers.size(); i++){  
                RelatorioUsuario relUsers = new RelatorioUsuario();  
                relUsers.setId(listUsers.get(i).getid());  
                relUsers.setLogin(listUsers.get(i).getLogin()); 
                relUsers.setNome(listUsers.get(i).getNome()); 
                relUsers.setTipoUsuario(listUsers.get(i).getTipoUsuario());  
                listRelusers.add(relUsers);  
            }  
              
            JRDataSource jrds = new JRBeanCollectionDataSource(listRelusers);  
                          
            // parametros do relatorio  
            HashMap parameters = new HashMap();  
            // lendo arquivo jasper  
            File reportFile = new File(sc.getRealPath("/WEB-INF/rel/rel_cpi.jasper"));  
            //String fileName = "teste";  
            byte[] bytes = null;  
            try {                  
                bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, jrds);  
                //JasperPrint print = JasperFillManager.fillReport(reportFile.getPath(), parameters, jrds);  
                  
        //bytes = JasperExportManager.exportReportToPdf(print);  
                //JasperViewer.viewReport( reportFile.getName() + ".pdf", false );     
            } catch (Exception e) {                  
                e.printStackTrace();  
                return;  
            }                                
            //  
            if (bytes != null && bytes.length > 0) {  
                response.setContentType("application/pdf");  
                response.setContentLength(bytes.length);  
                ServletOutputStream ouputStream = response.getOutputStream();  
                ouputStream.write(bytes, 0, bytes.length);  
                ouputStream.flush();  
                ouputStream.close();  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
  
    public List<Usuario______> listUsers(){  
        return listUsers;  
    }  
  
    public void setListUsers(List<Usuario______> listDepto){  
        this.listUsers = listUsers;
       
    }  
  
    public Long getId() {
		return id;
    }
    /*
     public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
     */
	public void setId(Long id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
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
	public void setNome(String nome) {
		this.nome = nome;
	}
	
      
}  