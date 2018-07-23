/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.prestamoBean;
import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class prestamoDAO {
    Connection cn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public int contarPrestamosPendientes(){
        int resultado=0;
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call contarEntregasPendientes}");
            ResultSet rs = cst.executeQuery();
            rs.next();
            resultado = rs.getInt(1);
            
            cst.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        
        return resultado;
    }
    
    public ArrayList<prestamoBean> listarEntregasPendientes(){
        ArrayList<prestamoBean> lista = new ArrayList<prestamoBean>();
        prestamoBean objPrestamoBean = null;
         
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call verEntregasPendientes}");
            rs = cst.executeQuery();
             
            while(rs.next()){
                objPrestamoBean = new prestamoBean();
                objPrestamoBean.setId_prestamo(rs.getInt(1));
                objPrestamoBean.setApAlumno(rs.getString(2));
                objPrestamoBean.setAmAlumno(rs.getString(3));
                objPrestamoBean.setCodAlumno(rs.getString(4));
                objPrestamoBean.setIsbn(rs.getString(5));
                objPrestamoBean.setTitulo(rs.getString(6));
                objPrestamoBean.setApellidosAutor(rs.getString(7));
                objPrestamoBean.setNombresAutor(rs.getString(8));
                objPrestamoBean.setHora_prestamo(rs.getString(9));
                objPrestamoBean.setFecha_prestamo(rs.getString(10));
                objPrestamoBean.setTipo_prestamo(rs.getString(11));
                objPrestamoBean.setEstado_prestamo(rs.getInt(12));
                
                lista.add(objPrestamoBean);    
            }
            rs.close();
            cst.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return lista;
        
    }
    
    public ArrayList<prestamoBean> listarEntregasNoAprobadas(){
       ArrayList<prestamoBean> lista = new ArrayList<prestamoBean>();
       prestamoBean objPrestamoBean = null;
       
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call verEntregasNoAprobadas}");
            rs = cst.executeQuery();
             
            while(rs.next()){
                objPrestamoBean = new prestamoBean();
                objPrestamoBean.setId_prestamo(rs.getInt(1));
                objPrestamoBean.setApAlumno(rs.getString(2));
                objPrestamoBean.setAmAlumno(rs.getString(3));
                objPrestamoBean.setCodAlumno(rs.getString(4));
                objPrestamoBean.setIsbn(rs.getString(5));
                objPrestamoBean.setTitulo(rs.getString(6));
                objPrestamoBean.setApellidosAutor(rs.getString(7));
                objPrestamoBean.setNombresAutor(rs.getString(8));
                objPrestamoBean.setHora_prestamo(rs.getString(9));
                objPrestamoBean.setFecha_prestamo(rs.getString(10));
                objPrestamoBean.setTipo_prestamo(rs.getString(11));
                objPrestamoBean.setEstado_prestamo(rs.getInt(12));
                
                lista.add(objPrestamoBean);    
            }
            rs.close();
            cst.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
       
       return lista;
    }
    
    public ArrayList<prestamoBean> listarEntregasAprobadas(){
       ArrayList<prestamoBean> lista = new ArrayList<prestamoBean>();
       prestamoBean objPrestamoBean = null;
       
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call verEntregasAprobadas}");
            rs = cst.executeQuery();
             
            while(rs.next()){
                objPrestamoBean = new prestamoBean();
                objPrestamoBean.setId_prestamo(rs.getInt(1));
                objPrestamoBean.setApAlumno(rs.getString(2));
                objPrestamoBean.setAmAlumno(rs.getString(3));
                objPrestamoBean.setCodAlumno(rs.getString(4));
                objPrestamoBean.setIsbn(rs.getString(5));
                objPrestamoBean.setTitulo(rs.getString(6));
                objPrestamoBean.setApellidosAutor(rs.getString(7));
                objPrestamoBean.setNombresAutor(rs.getString(8));
                objPrestamoBean.setHora_prestamo(rs.getString(9));
                objPrestamoBean.setFecha_prestamo(rs.getString(10));
                objPrestamoBean.setTipo_prestamo(rs.getString(11));
                objPrestamoBean.setEstado_prestamo(rs.getInt(12));
                
                lista.add(objPrestamoBean);    
            }
            rs.close();
            cst.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
       
       return lista;
    }
    
}
