/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Funciones;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

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
     
    public String obtenerFechaActual(){
        String fechaActual="";
        try {
            SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy/MM/dd");
            Calendar c = new GregorianCalendar();
            String dia = Integer.toString(c.get(Calendar.DATE));
            String mes = Integer.toString(c.get(Calendar.MONTH));
            String annio = Integer.toString(c.get(Calendar.YEAR));
            String fecha=annio+"/"+mes+"/"+dia;
            Date fechaFormato = formatoDeFecha.parse(fecha);
            fechaActual=formatoDeFecha.format(fechaFormato);
        } catch (Exception e) {
        }
        return fechaActual;
    }
    
    public String obtenerHora(){
        String horaActual="";
        int hora,minutos;
        try {
            Calendar calendario = new GregorianCalendar();
            hora =calendario.get(Calendar.HOUR_OF_DAY);
            minutos = calendario.get(Calendar.MINUTE);
            horaActual = hora+":"+minutos;
        } catch (Exception e) {
        }
        return horaActual;
    }
}

