/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.devolucionBean;
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
public class devolucionDAO {
    Connection cn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public int contarDevolucionesPendientes(){
        int resultado=0;
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call contarDevolucionesPendientes}");
            ResultSet rs = cst.executeQuery();
            rs.next();
            resultado = rs.getInt(1);
        } catch (Exception e) {
        }
        
        return resultado;
    }
    
    public ArrayList<devolucionBean> verDevolucionesPendientes(){
        ArrayList<devolucionBean> lista = new ArrayList<>();
        devolucionBean objDevolucion = null;
        try {
            Conexion conexion = new Conexion();
            cn = conexion.getConexion();
             CallableStatement cst = cn.prepareCall("{call verDevolucionesPendientes}");
            rs = cst.executeQuery();
             
            while(rs.next()){
               objDevolucion = new devolucionBean();
               objDevolucion.setId_devolucion(rs.getInt(1));
               objDevolucion.setId_prestamo(rs.getInt(2));
               objDevolucion.setApAlumno(rs.getString(3));
               objDevolucion.setAmAlumno(rs.getString(4));
               objDevolucion.setCodAlumno(rs.getString(5));
               objDevolucion.setIsbn(rs.getString(6));
               objDevolucion.setTitulo(rs.getString(7));
               objDevolucion.setApellidosAutor(rs.getString(8));
               objDevolucion.setNombresAutor(rs.getString(9));
               objDevolucion.setHora_devolucion(rs.getString(10));
               objDevolucion.setFecha_devolucion(rs.getString(11));
               objDevolucion.setTipoPrestamo(rs.getString(12));
               lista.add(objDevolucion);    
            }
            rs.close();
            cst.close();
            cn.close();
            
        } catch (Exception e) {
        }
        
        return lista;
    }
    
    public ArrayList<devolucionBean> verDevolucionesAprobadas(){
        ArrayList<devolucionBean> lista = new ArrayList<>();
        devolucionBean objDevolucion = null;
        try {
            Conexion conexion = new Conexion();
            cn = conexion.getConexion();
             CallableStatement cst = cn.prepareCall("{call verDevolucionesAprobadas}");
            rs = cst.executeQuery();
             
            while(rs.next()){
               objDevolucion = new devolucionBean();
               objDevolucion.setId_devolucion(rs.getInt(1));
               objDevolucion.setId_prestamo(rs.getInt(2));
               objDevolucion.setApAlumno(rs.getString(3));
               objDevolucion.setAmAlumno(rs.getString(4));
               objDevolucion.setCodAlumno(rs.getString(5));
               objDevolucion.setIsbn(rs.getString(6));
               objDevolucion.setTitulo(rs.getString(7));
               objDevolucion.setApellidosAutor(rs.getString(8));
               objDevolucion.setNombresAutor(rs.getString(9));
               objDevolucion.setHora_devolucion(rs.getString(10));
               objDevolucion.setFecha_devolucion(rs.getString(11));
               objDevolucion.setTipoPrestamo(rs.getString(12));
               lista.add(objDevolucion);    
            }
            rs.close();
            cst.close();
            cn.close();
            
        } catch (Exception e) {
        }
        
        return lista;
    }
    
    public ArrayList<devolucionBean> verAprobarDevoluciones(int idDevolucion){
        ArrayList<devolucionBean> lista = new ArrayList<>();
        devolucionBean objDevolucion = null;
        try {
            Conexion conexion = new Conexion();
            cn = conexion.getConexion();
             CallableStatement cst = cn.prepareCall("{call verAprobarDevolucion(?)}");
             cst.setInt(1,idDevolucion);
            rs = cst.executeQuery();
             
            rs.next();
            objDevolucion = new devolucionBean();
            objDevolucion.setId_devolucion(rs.getInt(1));
            objDevolucion.setId_prestamo(rs.getInt(2));
            objDevolucion.setFotoAlumno(rs.getString(3));
            objDevolucion.setApAlumno(rs.getString(4));
            objDevolucion.setAmAlumno(rs.getString(5));
            objDevolucion.setNombAlumno(rs.getString(6));
            objDevolucion.setCodAlumno(rs.getString(7));
            objDevolucion.setEscuela(rs.getString(8));
            objDevolucion.setPortada(rs.getString(9));
            objDevolucion.setIsbn(rs.getString(10));
            objDevolucion.setTitulo(rs.getString(11));
            objDevolucion.setApellidosAutor(rs.getString(12));
            objDevolucion.setNombresAutor(rs.getString(13));
            objDevolucion.setHora_devolucion(rs.getString(14));
            objDevolucion.setFecha_devolucion(rs.getString(15));
            objDevolucion.setTipoPrestamo(rs.getString(16));
            lista.add(objDevolucion);    
            rs.close();
            cst.close();
            cn.close();
            
        } catch (Exception e) {
        }
        
        return lista;
    }
    
    public int aprobarDevolucion(int idDevolucion, String isbn){
        int respuesta = -1;
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call aprobarDevolucion(?,?)}");
            cst.setInt(1, idDevolucion);
            cst.setString(2, isbn);
            respuesta = cst.executeUpdate();
            cst.close();
            cn.close();
        } catch (Exception e) {
        }
        return respuesta;
    }
    
    public ArrayList<devolucionBean> filtrarPendienteAlumno(String codAlumno){
        ArrayList<devolucionBean> lista = new ArrayList<>();
        devolucionBean objDevolucion = null;
        try {
            Conexion conexion = new Conexion();
            cn = conexion.getConexion();
             CallableStatement cst = cn.prepareCall("{call filtrarDevolucionAlumno(?,1)}");
             cst.setString(1,codAlumno);
            rs = cst.executeQuery();
             
            while(rs.next()){
                objDevolucion = new devolucionBean();
                objDevolucion.setId_devolucion(rs.getInt(1));
                objDevolucion.setId_prestamo(rs.getInt(2));
                objDevolucion.setFotoAlumno(rs.getString(3));
                objDevolucion.setApAlumno(rs.getString(4));
                objDevolucion.setAmAlumno(rs.getString(5));
                objDevolucion.setNombAlumno(rs.getString(6));
                objDevolucion.setCodAlumno(rs.getString(7));
                objDevolucion.setEscuela(rs.getString(8));
                objDevolucion.setPortada(rs.getString(9));
                objDevolucion.setIsbn(rs.getString(10));
                objDevolucion.setTitulo(rs.getString(11));
                objDevolucion.setApellidosAutor(rs.getString(12));
                objDevolucion.setNombresAutor(rs.getString(13));
                objDevolucion.setHora_devolucion(rs.getString(14));
                objDevolucion.setFecha_devolucion(rs.getString(15));
                objDevolucion.setTipoPrestamo(rs.getString(16));
                lista.add(objDevolucion);    
            }
            rs.close();
            cst.close();
            cn.close();
            
        } catch (Exception e) {
        }
        
        return lista;
    }
    
    public ArrayList<devolucionBean> filtrarAprobadaAlumno(String codAlumno){
        ArrayList<devolucionBean> lista = new ArrayList<>();
        devolucionBean objDevolucion = null;
        try {
            Conexion conexion = new Conexion();
            cn = conexion.getConexion();
             CallableStatement cst = cn.prepareCall("{call filtrarDevolucionAlumno(?,2)}");
             cst.setString(1,codAlumno);
            rs = cst.executeQuery();
             
            while(rs.next()){
                objDevolucion = new devolucionBean();
                objDevolucion.setId_devolucion(rs.getInt(1));
                objDevolucion.setId_prestamo(rs.getInt(2));
                objDevolucion.setFotoAlumno(rs.getString(3));
                objDevolucion.setApAlumno(rs.getString(4));
                objDevolucion.setAmAlumno(rs.getString(5));
                objDevolucion.setNombAlumno(rs.getString(6));
                objDevolucion.setCodAlumno(rs.getString(7));
                objDevolucion.setEscuela(rs.getString(8));
                objDevolucion.setPortada(rs.getString(9));
                objDevolucion.setIsbn(rs.getString(10));
                objDevolucion.setTitulo(rs.getString(11));
                objDevolucion.setApellidosAutor(rs.getString(12));
                objDevolucion.setNombresAutor(rs.getString(13));
                objDevolucion.setHora_devolucion(rs.getString(14));
                objDevolucion.setFecha_devolucion(rs.getString(15));
                objDevolucion.setTipoPrestamo(rs.getString(16));
                lista.add(objDevolucion);    
            }
            rs.close();
            cst.close();
            cn.close();
            
        } catch (Exception e) {
        }
        
        return lista;
    }
    
  /*  
    public static void main(String[] args){
        devolucionDAO devolucion = new devolucionDAO();
        ArrayList<devolucionBean> lista = devolucion.verAprobarDevoluciones(3);
        for(devolucionBean obj:lista){
            System.out.println("idPrestamo: "+obj.getId_devolucion());
        }
    }
    */
}
