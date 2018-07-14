/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.AutorBean;
import Util.Conexion;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class AutorDAO {
    Connection cn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public int addAutor(AutorBean objAutor){
        int resultado=0;
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            String sql="INSERT INTO autor (apellidos,nombres,detalle) VALUES (?,?,?);";
            ps=cn.prepareStatement(sql);
            ps.setString(1, objAutor.getApellidos());
            ps.setString(2, objAutor.getNombres());
            ps.setString(3, objAutor.getDetalle());
            resultado= ps.executeUpdate();
            System.out.println("El contenido de resultado es: "+resultado);
            ps.close();
            cn.close();
            
        } catch (Exception e) {
        }
        return resultado;
    }
    
    public ArrayList<AutorBean> getAutores(){
        ArrayList<AutorBean> lista= new ArrayList<AutorBean>();
        AutorBean objAutorBean=null;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            String sql="SELECT * FROM autor";
            ps=cn.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                objAutorBean=new AutorBean();
                objAutorBean.setId_autor(rs.getInt(1));
                objAutorBean.setApellidos(rs.getString(2));
                objAutorBean.setNombres(rs.getString(3));
                objAutorBean.setDetalle(rs.getString(4));
                lista.add(objAutorBean);
            }
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    
    
    /*public static void main(String [] args){
       AutorBean autor=new AutorBean();
        autor.setApellidos("Urbina");
        autor.setNombres("Diego");
        autor.setDetalle("Nacido en Lima");
        
        AutorDAO autorDao=new AutorDAO();
        autorDao.addAutor(autor);
       
       ArrayList<AutorBean> lista= new ArrayList<AutorBean>();
       AutorDAO autorDao=new AutorDAO();
       lista=autorDao.getAutores();
       
       for(AutorBean obj:lista){
           System.out.println("El id es: "+obj.getId_autor());
           System.out.println("El apellido es: "+obj.getApellidos());
           System.out.println("El nombre es: "+obj.getNombres());
           System.out.println("Los detalles son: "+obj.getDetalle());
       }
    }*/
}
