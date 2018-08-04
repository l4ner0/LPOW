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
    
    public int solicitarPrestamo(prestamoBean prestamo, int idAlumno){
        int respuesta = -1;
        
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call solicitarPrestamo(?,?,?,?,?,?)}");
            cst.setInt(1, prestamo.getId_libro());
            cst.setInt(2, prestamo.getId_empleado());
            cst.setString(3, prestamo.getFecha_prestamo());
            cst.setString(4, prestamo.getHora_prestamo());
            cst.setString(5, prestamo.getTipo_prestamo());
            cst.setInt(6, idAlumno);
            respuesta = cst.executeUpdate();
            cst.close();
            cn.close();
        } catch (Exception e) {
        }
        
        return respuesta;
    }
    
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
                objPrestamoBean.setCodicionEntrega(rs.getInt(13));
                
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
    
    public ArrayList<prestamoBean> verAprobarEntrega(int id_prestamo){
        ArrayList<prestamoBean> lista = new ArrayList<prestamoBean>();
        prestamoBean objPrestamoBean = null;
        
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call verAprobarEntrega(?)}");
            cst.setInt(1, id_prestamo);
            rs = cst.executeQuery();
            rs.next();
            
            objPrestamoBean = new prestamoBean();
            objPrestamoBean.setId_prestamo(rs.getInt(1));
            objPrestamoBean.setFotoAlumno(rs.getString(2));
            objPrestamoBean.setApAlumno(rs.getString(3));
            objPrestamoBean.setAmAlumno(rs.getString(4));
            objPrestamoBean.setNombAlumno(rs.getString(5));
            objPrestamoBean.setCodAlumno(rs.getString(6));
            objPrestamoBean.setEscuelaAlumno(rs.getString(7));
            objPrestamoBean.setPortada(rs.getString(8));
            objPrestamoBean.setIsbn(rs.getString(9));
            objPrestamoBean.setTitulo(rs.getString(10));
            objPrestamoBean.setApellidosAutor(rs.getString(11));
            objPrestamoBean.setNombresAutor(rs.getString(12));
            objPrestamoBean.setHora_prestamo(rs.getString(13));
            objPrestamoBean.setFecha_prestamo(rs.getString(14));
            objPrestamoBean.setTipo_prestamo(rs.getString(15));
            objPrestamoBean.setEstado_prestamo(rs.getInt(16));
            
            lista.add(objPrestamoBean);
            
            rs.close();
            cst.close();
            cn.close();
            
        } catch (Exception e) {
        }
        
        return lista;
    }
    
    public int aprobarEntrega(int idEntregaPendiente, String fechaDevolucion, String horaDevolucion){
        int respuesta = -1;
        
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call aprobarEntrega(?,?,?)}");
            cst.setInt(1, idEntregaPendiente);
            cst.setString(2, fechaDevolucion);
            cst.setString(3, horaDevolucion);
            respuesta = cst.executeUpdate();
            cst.close();
            cn.close();
        } catch (Exception e) {
        }
        
        return respuesta;
    }
    
    public int noAprobarEnrega(int idEntregaPendiente, String motivo, String isbn){
        int respuesta = -1;
        
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call noAprobarEntrega(?,?,?)}");
            cst.setInt(1, idEntregaPendiente);
            cst.setString(2, motivo);
            cst.setString(3, isbn);
            respuesta = cst.executeUpdate();
            cst.close();
            cn.close();
        } catch (Exception e) {
        }
        
        return respuesta;
    }
    
    public ArrayList<prestamoBean> verNoAprobarEntrega(int idPrestamo){
        ArrayList<prestamoBean> lista = new ArrayList<>();
        prestamoBean prestamo = null;
        
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call verNoAprobarEntrega(?)}");
            cst.setInt(1, idPrestamo);
            rs=cst.executeQuery();
            rs.next();
            prestamo = new prestamoBean();
            prestamo.setId_prestamo(rs.getInt(1));
            prestamo.setApAlumno(rs.getString(2));
            prestamo.setAmAlumno(rs.getString(3));
            prestamo.setNombAlumno(rs.getString(4));
            prestamo.setCodAlumno(rs.getString(5));
            prestamo.setEscuelaAlumno(rs.getString(6));
            prestamo.setIsbn(rs.getString(7));
            prestamo.setTitulo(rs.getString(8));
            prestamo.setApellidosAutor(rs.getString(9));
            prestamo.setNombresAutor(rs.getString(10));
            prestamo.setFotoEmpleado(rs.getString(11));
            prestamo.setApEmpleado(rs.getString(12));
            prestamo.setAmEmpleado(rs.getString(13));
            prestamo.setNombEmpleado(rs.getString(14));
            prestamo.setObserva_prestamo(rs.getString(15));
            prestamo.setHora_prestamo(rs.getString(16));
            prestamo.setFecha_prestamo(rs.getString(17));
            prestamo.setTipo_prestamo(rs.getString(18));
            prestamo.setEstado_prestamo(rs.getInt(19));
            lista.add(prestamo);
            rs.close();
            cst.close();
            cn.close();

            
           
        } catch (Exception e) {
        }
        return lista;
    }
    
    public ArrayList<prestamoBean> filtrarPendiente(String codAlumno){
        ArrayList<prestamoBean> lista = new ArrayList<>();
        prestamoBean objPrestamoBean=null;
        
        try {
             Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call filtrarPrestamoAlumno(?,?)}");
            cst.setString(1, codAlumno);
            cst.setInt(2, 1);
            rs = cst.executeQuery();
            
            while(rs.next()){
                objPrestamoBean = new prestamoBean();
            objPrestamoBean.setId_prestamo(rs.getInt(1));
            objPrestamoBean.setFotoAlumno(rs.getString(2));
            objPrestamoBean.setApAlumno(rs.getString(3));
            objPrestamoBean.setAmAlumno(rs.getString(4));
            objPrestamoBean.setNombAlumno(rs.getString(5));
            objPrestamoBean.setCodAlumno(rs.getString(6));
            objPrestamoBean.setEscuelaAlumno(rs.getString(7));
            objPrestamoBean.setPortada(rs.getString(8));
            objPrestamoBean.setIsbn(rs.getString(9));
            objPrestamoBean.setTitulo(rs.getString(10));
            objPrestamoBean.setApellidosAutor(rs.getString(11));
            objPrestamoBean.setNombresAutor(rs.getString(12));
            objPrestamoBean.setHora_prestamo(rs.getString(18));
            objPrestamoBean.setFecha_prestamo(rs.getString(19));
            objPrestamoBean.setTipo_prestamo(rs.getString(20));
            objPrestamoBean.setEstado_prestamo(rs.getInt(21));
                
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
    
    public ArrayList<prestamoBean> filtrarNoAprobado(String codAlumno){
        ArrayList<prestamoBean> lista = new ArrayList<>();
        prestamoBean objPrestamoBean=null;
        
        try {
             Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call filtrarPrestamoAlumno(?,?)}");
            cst.setString(1, codAlumno);
            cst.setInt(2, 0);
            rs = cst.executeQuery();
            
            while(rs.next()){
                objPrestamoBean = new prestamoBean();
                objPrestamoBean.setId_prestamo(rs.getInt(1));
                objPrestamoBean.setFotoAlumno(rs.getString(2));
                objPrestamoBean.setApAlumno(rs.getString(3));
                objPrestamoBean.setAmAlumno(rs.getString(4));
                objPrestamoBean.setNombAlumno(rs.getString(5));
                objPrestamoBean.setCodAlumno(rs.getString(6));
                objPrestamoBean.setEscuelaAlumno(rs.getString(7));
                objPrestamoBean.setPortada(rs.getString(8));
                objPrestamoBean.setIsbn(rs.getString(9));
                objPrestamoBean.setTitulo(rs.getString(10));
                objPrestamoBean.setApellidosAutor(rs.getString(11));
                objPrestamoBean.setNombresAutor(rs.getString(12));
                objPrestamoBean.setFotoEmpleado(rs.getString(13));
                objPrestamoBean.setApEmpleado(rs.getString(14));
                objPrestamoBean.setAmEmpleado(rs.getString(15));
                objPrestamoBean.setNombEmpleado(rs.getString(16));
                objPrestamoBean.setObserva_prestamo(rs.getString(17));
                objPrestamoBean.setHora_prestamo(rs.getString(18));
                objPrestamoBean.setFecha_prestamo(rs.getString(19));
                objPrestamoBean.setTipo_prestamo(rs.getString(20));
                objPrestamoBean.setEstado_prestamo(rs.getInt(21));
                
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
    
     public ArrayList<prestamoBean> filtrarEntregas(int condicionEntrega){
        ArrayList<prestamoBean> lista = new ArrayList<>();
        prestamoBean objPrestamoBean=null;
        
        try {
             Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call filtrarEntregas(?)}");
            cst.setInt(1, condicionEntrega);
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
                objPrestamoBean.setCodicionEntrega(rs.getInt(13));
                
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
    
    public int entregado(int idPrestamo){
        int respuesta = -1;
        
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call entregado(?)}");
            cst.setInt(1, idPrestamo);
            respuesta = cst.executeUpdate();
            cst.close();
            cn.close();
        } catch (Exception e) {
        }
        
        return respuesta;
    } 
    
    public int contarTipoPrestamo(String tipoPrestamo){
        int resultado=0;
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call contarTipoPrestamo(?)}");
            cst.setString(1, tipoPrestamo);
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
     
    
/*
    public static void main(String[] args){
        int respuesta;
        prestamoDAO prestamo = new prestamoDAO();
       
       int valor = prestamo.contarTipoPrestamo("Virtual");
            System.out.println(valor);

        
       
    }
*/
}
