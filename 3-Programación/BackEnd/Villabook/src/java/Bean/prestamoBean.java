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
public class prestamoBean {
    int id_prestamo;
    int id_libro;
    int id_empleado;
    String fecha_prestamo;
    String hora_prestamo;
    String tipo_prestamo;
    int estado_prestamo;
    String observa_prestamo;
    
    String apAlumno;
    String amAlumno;
    String codAlumno;
    String isbn;
    String titulo;
    String apellidosAutor;
    String nombresAutor;

    public String getApAlumno() {
        return apAlumno;
    }

    public void setApAlumno(String apAlumno) {
        this.apAlumno = apAlumno;
    }

    public String getAmAlumno() {
        return amAlumno;
    }

    public void setAmAlumno(String amAlumno) {
        this.amAlumno = amAlumno;
    }

    public String getCodAlumno() {
        return codAlumno;
    }

    public void setCodAlumno(String codAlumno) {
        this.codAlumno = codAlumno;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getApellidosAutor() {
        return apellidosAutor;
    }

    public void setApellidosAutor(String apellidosAutor) {
        this.apellidosAutor = apellidosAutor;
    }

    public String getNombresAutor() {
        return nombresAutor;
    }

    public void setNombresAutor(String nombresAutor) {
        this.nombresAutor = nombresAutor;
    }
    

    public int getId_prestamo() {
        return id_prestamo;
    }

    public void setId_prestamo(int id_prestamo) {
        this.id_prestamo = id_prestamo;
    }

    public int getId_libro() {
        return id_libro;
    }

    public void setId_libro(int id_libro) {
        this.id_libro = id_libro;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getFecha_prestamo() {
        return fecha_prestamo;
    }

    public void setFecha_prestamo(String fecha_prestamo) {
        this.fecha_prestamo = fecha_prestamo;
    }

    public String getHora_prestamo() {
        return hora_prestamo;
    }

    public void setHora_prestamo(String hora_prestamo) {
        this.hora_prestamo = hora_prestamo;
    }

    public String getTipo_prestamo() {
        return tipo_prestamo;
    }

    public void setTipo_prestamo(String tipo_prestamo) {
        this.tipo_prestamo = tipo_prestamo;
    }

    public int getEstado_prestamo() {
        return estado_prestamo;
    }

    public void setEstado_prestamo(int estado_prestamo) {
        this.estado_prestamo = estado_prestamo;
    }

    public String getObserva_prestamo() {
        return observa_prestamo;
    }

    public void setObserva_prestamo(String observa_prestamo) {
        this.observa_prestamo = observa_prestamo;
    }
    
    
}
