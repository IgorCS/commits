package br.com.caelum.tarefas.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.com.caelum.tarefas.controller.Usuario______;
import br.com.caelum.tarefas.jdbc.ConnectionFactory;
  
public class UsuariosRelDAO {  
    private static PreparedStatement pstmt = null;  
    private static ResultSet rs = null;  
      
    public static Usuario______ getById(int Id){  
        try {  
            Usuario______ users = null; 
            ConnectionFactory con = new ConnectionFactory();
            pstmt = con.getConnection().prepareStatement("Select * From usuarios Where id =?");  
            pstmt.setInt(1, Id);  
            ResultSet rs = pstmt.executeQuery();  
            if (rs.next()) {  
                users = new Usuario______();  
                users.setId((long) rs.getInt("id"));  
                users.setLogin(rs.getString("Login"));  
                users.setTipoUsuario(rs.getString("tipoUsuario")); 
                users.setNome(rs.getString("nome")); 
            }  
            rs.close();  
            pstmt.close();  
            return users;  
        } catch (Exception e) {  
            e.printStackTrace();  
            return null;  
        }  
    }  
  
    public static ArrayList<Usuario______> getAll() {  
        try {  
            ArrayList<Usuario______> listAll = null;  
            Usuario______ users = new Usuario______(); 
            ConnectionFactory con = new ConnectionFactory();
            pstmt = con.getConnection().prepareStatement  
            ("Select * From Usuarios Order By Nome");  
            ResultSet rs = pstmt.executeQuery();  
            if (rs.next()) {  
                listAll = new ArrayList<Usuario______>();  
                do {users = new Usuario______();  
                users = new Usuario______();  
                users.setId(rs.getLong("id"));  
               // tarefa.setId(rs.getLong("id"));
                users.setLogin(rs.getString("Login"));  
                users.setTipoUsuario(rs.getString("tipoUsuario")); 
                users.setNome(rs.getString("nome"));
                    listAll.add(users);}  
                    while (rs.next()) ;}  
            rs.close();  
            pstmt.close();  
            return listAll;  
        } catch (Exception e) {  
            e.printStackTrace();  
            return null;  
        }  
    }  
      
      
}  




