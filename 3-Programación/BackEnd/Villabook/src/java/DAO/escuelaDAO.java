/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.escuelaBean;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class escuelaDAO {
    Connection cn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public ArrayList<escuelaBean> getEscuela(){
        ArrayList<escuelaBean> lista = new ArrayList<escuelaBean>();
        escuelaBean objEscuelaBean=null;
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            String sql="SELECT * FROM escuela";
            ps=cn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                objEscuelaBean=new escuelaBean();
                objEscuelaBean.setId_escuela(rs.getInt(1));
                objEscuelaBean.setNombre(rs.getString(2));
                objEscuelaBean.setDetalle(rs.getString(2));
                lista.add(objEscuelaBean);
            }
            rs.close();
            ps.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
/*    
    public static void main(String [] args){
        
       ArrayList<escuelaBean> lista= new ArrayList<escuelaBean>();
       escuelaDAO objEscuelaDao=new escuelaDAO();
       lista=objEscuelaDao.getEscuela();
       
       for(escuelaBean obj:lista){
           System.out.println("El id es: "+obj.getId_escuela());
           System.out.println("El tipo es: "+obj.getNombre());
       }
    }*/
}
