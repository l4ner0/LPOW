/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Usuario
 */
public class Conexion {
    
    
    public  Connection getConexion(){
       Connection cn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost/bd_villabook","root","");
            System.out.println("Se conectó :-)");
        } catch (Exception e) {
            System.out.println("No se conectó :-(");
        }
        return cn;
    }
}
