package br.com.caelum.tarefas.dao;

/*import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import br.com.caelum.tarefas.modelo.Usuario;

public class Criptografia {
	
	Usuario usuario = new Usuario();
	
	
	public String criptografaSenha (String senha) throws NoSuchAlgorithmException {  
		String senha1   = (usuario.getSenha());
	    MessageDigest md = MessageDigest.getInstance("MD5");  
	    md.update(senha1.getBytes());
	    BigInteger hash = new BigInteger(1, md.digest());  
	    String retorna = hash.toString(16); 
	    //String retornaSenha1 = hash.toString(16);
	    if (retorna.length() %2 != 0)  
	    	retorna = "0" + retorna;  
	   // return retorna; 
	    System.out.println(retorna);
		return retorna;
	}  
	

}*/

import java.math.BigInteger;  
import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException;  
import javax.swing.JOptionPane;  
  
public class Criptografia {  
      
    //Função para criar hash da senha informada  
    public static String md5(String senha){  
        String sen = "";  
        MessageDigest md = null;  
        try {  
            md = MessageDigest.getInstance("MD5");  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
        BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));  
        sen = hash.toString(16);              
        return sen;  
    }  
      
    public static void main(String[] args) {  
          
        String senha = JOptionPane.showInputDialog("Digite uma senha:");  
        String saida = "Entrada:"+ senha +"\nSenha com MD5:" + md5(senha); 
       
  
        JOptionPane.showConfirmDialog(null,saida, "Resultado", JOptionPane.CLOSED_OPTION);  
        System.out.println(md5(senha));
    }  
}  


