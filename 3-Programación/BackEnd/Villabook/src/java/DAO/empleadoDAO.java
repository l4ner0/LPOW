/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.empleadoBean;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class empleadoDAO {
    Connection cn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public ArrayList<empleadoBean> getEmpleado(int idEmpleado){
        ArrayList<empleadoBean> empleado=new ArrayList<empleadoBean>();
        empleadoBean objEmpleado=null;
        
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            String sql="SELECT * FROM empleado WHERE id_empleado=?";
            ps=cn.prepareStatement(sql);
            ps.setInt(1, idEmpleado);
            rs=ps.executeQuery();
            rs.next();
            
            objEmpleado= new empleadoBean();
            objEmpleado.setId_empleado(rs.getInt(1));
            objEmpleado.setFoto(rs.getString(2));
            objEmpleado.setAp_paterno(rs.getString(3));
            objEmpleado.setAp_materno(rs.getString(4));
            objEmpleado.setNombres(rs.getString(5));
            objEmpleado.setSexo(rs.getString(6));
            objEmpleado.setTelefono(rs.getString(7));
            empleado.add(objEmpleado);
        } catch (Exception e) {
        }
        return empleado;
    }
    
    public int validarIngresoEmpleado(String correo, String clave){
        int idEmpleado=-1;
        
        try {
            Conexion conexion=new Conexion();
            cn=conexion.getConexion();
            String sql="SELECT id_empleado FROM usuario_empleado WHERE correo=? AND clave=?";
            ps=cn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, clave);
            rs=ps.executeQuery();
            rs.next();
            idEmpleado=rs.getInt(1);
            System.out.println(idEmpleado);
        } catch (Exception e) {
        }
        
        return idEmpleado;
    }
    /*
    public static void main(String[] args){
        empleadoDAO empleado = new empleadoDAO();
        int idEmpleado=empleado.validarIngresoEmpleado("rodrigo@gmail.com", "1234");
        if(idEmpleado == -1){
            System.out.println("Error, ingrese nuevamente sus credenciales");
        }else{
            System.out.println("Bienvenido empleado: "+idEmpleado);
        }
        
        ArrayList<empleadoBean> lista=empleado.getEmpleado(idEmpleado);
        for(empleadoBean objEmpleado:lista){
            System.out.println("El nombre es: "+objEmpleado.getNombres()+" "+objEmpleado.getAp_paterno()+" "+objEmpleado.getAp_materno());
            
        }
    }*/
}
