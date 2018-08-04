/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.libroBean;
import Util.Conexion;
import java.sql.*;
import java.util.ArrayList;


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
    
    public ArrayList<libroBean> getLibro(String isbn){
        ArrayList<libroBean> lista=new ArrayList<libroBean>();
        libroBean objLibroBean=null;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            String sql="SELECT * FROM libro WHERE ISBN=?";
            ps=cn.prepareStatement(sql);
            ps.setString(1, isbn);
            rs=ps.executeQuery();
            
            rs.next();
            objLibroBean=new libroBean();
            objLibroBean.setId_libro(rs.getInt(1));
            objLibroBean.setId_tipo_documento(rs.getInt(2));
            objLibroBean.setId_escuela(rs.getInt(3));
            objLibroBean.setId_autor(rs.getInt(4));
            objLibroBean.setISBN(rs.getString(5));
            objLibroBean.setPortada(rs.getString(6));
            objLibroBean.setTitulo(rs.getString(7));
            objLibroBean.setDatos_publi(rs.getString(8));
            objLibroBean.setStock_inicial(rs.getInt(9));
            objLibroBean.setStock_final(rs.getInt(10));
            lista.add(objLibroBean);

            
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    
    public ArrayList<libroBean> getLibrosTabla(){
        ArrayList<libroBean> lista=new ArrayList<libroBean>();
        libroBean objLibroBean=null;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            String sql="SELECT id_libro,tipo, nombre, apellidos,nombres,ISBN,portada,titulo,datos_publi,stock_inicial,stock_final \n" +
                        "FROM libro as l\n" +
                        "INNER JOIN tipo_documento as tp\n" +
                        "ON l.id_tipo_documento=tp.id_tipo_documento\n" +
                        "INNER JOIN escuela as e\n" +
                        "ON l.id_escuela=e.id_escuela\n" +
                        "INNER JOIN autor as a\n" +
                        "ON l.id_autor=a.id_autor"
                    + " WHERE estado=1;";
            ps=cn.prepareStatement(sql);
            rs=ps.executeQuery();
            
            while(rs.next()){
                objLibroBean=new libroBean();
                objLibroBean.setId_libro(rs.getInt(1));
                objLibroBean.setTipo_documento(rs.getString(2));
                objLibroBean.setEscuela(rs.getString(3));
                objLibroBean.setAutor(rs.getString(4)+" "+rs.getString(5));
                objLibroBean.setISBN(rs.getString(6));
                objLibroBean.setPortada(rs.getString(7));
                objLibroBean.setTitulo(rs.getString(8));
                objLibroBean.setDatos_publi(rs.getString(9));
                objLibroBean.setStock_inicial(rs.getInt(10));
                objLibroBean.setStock_final(rs.getInt(11));
                lista.add(objLibroBean);
            }
            
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    
    public int updateLibro(libroBean objLibro){
        int resultado=0;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            String sql="UPDATE libro SET "
                    + "id_tipo_documento=?,"
                    + "id_escuela=?,"
                    + "id_autor=?,"
                    + "portada=?,"
                    + "titulo=?,"
                    + "datos_publi=?"
                    + "WHERE ISBN=?";
            ps=cn.prepareStatement(sql);
            ps.setInt(1, objLibro.getId_tipo_documento());
            ps.setInt(2, objLibro.getId_escuela());
            ps.setInt(3, objLibro.getId_autor());
            ps.setString(4, objLibro.getPortada());
            ps.setString(5, objLibro.getTitulo());
            ps.setString(6, objLibro.getDatos_publi());
            ps.setString(7, objLibro.getISBN());
            resultado=ps.executeUpdate();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return resultado;
    }
    
    public int deleteLibro(String isbn){
        int resultado=0;
        
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            String sql="UPDATE libro SET estado=0 WHERE ISBN=?";
            ps=cn.prepareStatement(sql);
            ps.setString(1, isbn);
            resultado=ps.executeUpdate();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        
        return resultado;
    }
    
    public int contarLibros(){
        int resultado=0;
        
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call contarLibros}");
            ResultSet rs = cst.executeQuery();
            rs.next();
            resultado = rs.getInt(1);
        } catch (Exception e) {
        }
        
        return resultado;
    }
    
    public ArrayList<libroBean> filtrarLibroTipoDocumento(int tipoDocumento){
        ArrayList<libroBean> lista=new ArrayList<libroBean>();
        libroBean objLibroBean=null;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call filtrarLibroTipoDocumento(?)}");
            cst.setInt(1, tipoDocumento);
            rs = cst.executeQuery();
            
            while(rs.next()){
                objLibroBean=new libroBean();
                objLibroBean.setId_libro(rs.getInt(1));
                objLibroBean.setTipo_documento(rs.getString(2));
                objLibroBean.setEscuela(rs.getString(3));
                objLibroBean.setAutor(rs.getString(4)+" "+rs.getString(5));
                objLibroBean.setISBN(rs.getString(6));
                objLibroBean.setPortada(rs.getString(7));
                objLibroBean.setTitulo(rs.getString(8));
                objLibroBean.setDatos_publi(rs.getString(9));
                objLibroBean.setStock_inicial(rs.getInt(10));
                objLibroBean.setStock_final(rs.getInt(11));
                lista.add(objLibroBean);
            }
            
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    
    public ArrayList<libroBean> filtrarLibroEscuela(int idEscuela){
        ArrayList<libroBean> lista=new ArrayList<libroBean>();
        libroBean objLibroBean=null;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call filtrarLibroEscuela(?)}");
            cst.setInt(1, idEscuela);
            rs = cst.executeQuery();
            
            while(rs.next()){
                objLibroBean=new libroBean();
                objLibroBean.setId_libro(rs.getInt(1));
                objLibroBean.setTipo_documento(rs.getString(2));
                objLibroBean.setEscuela(rs.getString(3));
                objLibroBean.setAutor(rs.getString(4)+" "+rs.getString(5));
                objLibroBean.setISBN(rs.getString(6));
                objLibroBean.setPortada(rs.getString(7));
                objLibroBean.setTitulo(rs.getString(8));
                objLibroBean.setDatos_publi(rs.getString(9));
                objLibroBean.setStock_inicial(rs.getInt(10));
                objLibroBean.setStock_final(rs.getInt(11));
                lista.add(objLibroBean);
            }
            
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    
    public ArrayList<libroBean> filtrarLibroIsbn(String isbn){
        ArrayList<libroBean> lista=new ArrayList<libroBean>();
        libroBean objLibroBean=null;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call filtrarLibroIsbn(?)}");
            cst.setString(1, isbn);
            rs = cst.executeQuery();
            
            while(rs.next()){
                objLibroBean=new libroBean();
                objLibroBean.setId_libro(rs.getInt(1));
                objLibroBean.setTipo_documento(rs.getString(2));
                objLibroBean.setEscuela(rs.getString(3));
                objLibroBean.setAutor(rs.getString(4)+" "+rs.getString(5));
                objLibroBean.setISBN(rs.getString(6));
                objLibroBean.setPortada(rs.getString(7));
                objLibroBean.setTitulo(rs.getString(8));
                objLibroBean.setDatos_publi(rs.getString(9));
                objLibroBean.setStock_inicial(rs.getInt(10));
                objLibroBean.setStock_final(rs.getInt(11));
                lista.add(objLibroBean);
            }
            
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
     
    public ArrayList<libroBean> filtrarLibroTitulo(String titulo){
        ArrayList<libroBean> lista=new ArrayList<libroBean>();
        libroBean objLibroBean=null;
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call filtrarLibroTitulo(?)}");
            cst.setString(1, titulo);
            rs = cst.executeQuery();
            
            while(rs.next()){
                objLibroBean=new libroBean();
                objLibroBean.setId_libro(rs.getInt(1));
                objLibroBean.setTipo_documento(rs.getString(2));
                objLibroBean.setEscuela(rs.getString(3));
                objLibroBean.setAutor(rs.getString(4)+" "+rs.getString(5));
                objLibroBean.setISBN(rs.getString(6));
                objLibroBean.setPortada(rs.getString(7));
                objLibroBean.setTitulo(rs.getString(8));
                objLibroBean.setDatos_publi(rs.getString(9));
                objLibroBean.setStock_inicial(rs.getInt(10));
                objLibroBean.setStock_final(rs.getInt(11));
                lista.add(objLibroBean);
            }
            
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    
 
      
}
