/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Usuario
 */
public class devolucionBean {
    int id_devolucion;
    int id_prestamo;
    String fecha_devolucion;
    String hora_devolucion;
    String observa_devolucion;
    int estado_devolucion;

    public int getId_devolucion() {
        return id_devolucion;
    }

    public void setId_devolucion(int id_devolucion) {
        this.id_devolucion = id_devolucion;
    }

    public int getId_prestamo() {
        return id_prestamo;
    }

    public void setId_prestamo(int id_prestamo) {
        this.id_prestamo = id_prestamo;
    }

    public String getFecha_devolucion() {
        return fecha_devolucion;
    }

    public void setFecha_devolucion(String fecha_devolucion) {
        this.fecha_devolucion = fecha_devolucion;
    }

    public String getHora_devolucion() {
        return hora_devolucion;
    }

    public void setHora_devolucion(String hora_devolucion) {
        this.hora_devolucion = hora_devolucion;
    }

    public String getObserva_devolucion() {
        return observa_devolucion;
    }

    public void setObserva_devolucion(String observa_devolucion) {
        this.observa_devolucion = observa_devolucion;
    }

    public int getEstado_devolucion() {
        return estado_devolucion;
    }

    public void setEstado_devolucion(int estado_devolucion) {
        this.estado_devolucion = estado_devolucion;
    }
    
    
}
