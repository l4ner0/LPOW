/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Funciones;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author Usuario
 */
@MultipartConfig
public class Archivo {
    
    public int copiarArchivo(Part archivo,String ruta, String nombre){
        int respuesta=-1;
        try {
            InputStream is =  archivo.getInputStream();
            File f = new File(ruta+nombre);
            FileOutputStream ous = new FileOutputStream(f);
            respuesta = is.read();
            while(respuesta != -1){
                respuesta = is.read();
            }
            
            ous.close();
            is.close();
        } catch (Exception e) {
        }
        
        return respuesta;
    } 
}
