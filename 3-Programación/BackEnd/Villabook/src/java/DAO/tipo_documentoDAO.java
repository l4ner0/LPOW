/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.tipo_documentoBean;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class tipo_documentoDAO {
    Connection cn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public ArrayList<tipo_documentoBean> getTipoDocumento(){
        ArrayList<tipo_documentoBean> lista = new ArrayList<tipo_documentoBean>();
        tipo_documentoBean objTipoDocumentoBean=null;
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            String sql="SELECT * FROM tipo_documento";
            ps=cn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                objTipoDocumentoBean=new tipo_documentoBean();
                objTipoDocumentoBean.setId_tipo_documento(rs.getInt(1));
                objTipoDocumentoBean.setTipo(rs.getString(2));
                lista.add(objTipoDocumentoBean);
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
        
       ArrayList<tipo_documentoBean> lista= new ArrayList<tipo_documentoBean>();
       tipo_documentoDAO tipoDocumentoDao=new tipo_documentoDAO();
       lista=tipoDocumentoDao.getTipoDocumento();
       
       for(tipo_documentoBean obj:lista){
           System.out.println("El id es: "+obj.getId_tipo_documento());
           System.out.println("El tipo es: "+obj.getTipo());
       }
    }
    */
}
