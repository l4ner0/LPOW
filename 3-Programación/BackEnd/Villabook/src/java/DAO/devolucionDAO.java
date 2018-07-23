/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.devolucionBean;
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
    
}
