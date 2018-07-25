/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Funciones;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Usuario
 */
public class Fecha {
     public Date sumarRestarDiasFecha(String fechaPrestamo, int dias){
         SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy/MM/dd");
         Date fech = null;
        try {
            fech = formatoDeFecha.parse(fechaPrestamo);
        } catch (Exception e) {
        }
        
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fech);
        calendar.add(Calendar.DAY_OF_YEAR, dias);
        return calendar.getTime();
    }
}
