/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Util.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Usuario
 */
public class alumnoDAO {
    
    Connection cn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public int contarEstudiantes(){
    int resultado=0;
        try {
            Conexion conexion = new Conexion();
            cn=conexion.getConexion();
            CallableStatement cst = cn.prepareCall("{call contarEstudiantes}");
            ResultSet rs = cst.executeQuery();
            rs.next();
            resultado = rs.getInt(1);
            rs.close();
            cst.close();
            cn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    return resultado;
    }

    public static void main(String[] args){
        alumnoDAO alumno = new alumnoDAO();
        System.out.println(alumno.contarEstudiantes());
    }
    
}


