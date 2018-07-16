/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.libroBean;
import Util.Conexion;
import java.sql.*;


/**
 *
 * @author Usuario
 */
public class libroDAO {
    Connection cn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public int addLibro(libroBean objLibro){
        int resultado=0;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            String sql="INSERT INTO libro (id_tipo_documento,id_escuela,id_autor,"
                    + "ISBN,portada,titulo,datos_publi,stock_inicial,stock_final) "
                    + "VALUES (?,?,?,?,?,?,?,?,?)";
            ps=cn.prepareStatement(sql);
            ps.setInt(1, objLibro.getId_tipo_documento());
            ps.setInt(2, objLibro.getId_escuela());
            ps.setInt(3, objLibro.getId_autor());
            ps.setString(4, objLibro.getISBN());
            ps.setString(5, objLibro.getPortada());
            ps.setString(6, objLibro.getTitulo());
            ps.setString(7, objLibro.getDatos_publi());
            ps.setInt(8, objLibro.getStock_inicial());
            ps.setInt(9, objLibro.getStock_inicial());
            resultado=ps.executeUpdate();
            ps.close();
            cn.close();
            
        } catch (Exception e) {
        }
        return resultado;
    }
    /*
    public static void main(String [] args){
       libroBean libro=new libroBean();
        libro.setId_tipo_documento(1);
        libro.setId_escuela(1);
        libro.setId_autor(2);
        libro.setISBN("0999M8L-45N");
        libro.setPortada("fakePath/imagen.png");
        libro.setTitulo("Administración de Sistemas de Información Ed9");
        libro.setDatos_publi("Ningun dato de publiación");
        libro.setStock_inicial(3);
        
        libroDAO objLibroDao=new libroDAO();
        int resultado=objLibroDao.addLibro(libro);
        System.out.println("El resultado es: "+resultado);
    }
     */  
}
