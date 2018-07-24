function Prestamo(ruta,controlador,op){
    this.ruta = ruta;
    this.controlador = controlador;
    this.op = op;
}

Prestamo.prototype.verAprobarPrestamo = function(idPrestamo){
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            id_prestamo:idPrestamo
        },
        success:function(response){
            var listaPrestamo=$.parseJSON(response);
            $("p#aprobarEntregaApellidos").text(listaPrestamo[0].apAlumno + " " + listaPrestamo[0].amAlumno);
            $("p#aprobarEntregaNombres").text(listaPrestamo[0].nombAlumno);
            $("p#aprobarEntregaCodigo").text(listaPrestamo[0].codAlumno);
            $("p#aprobarEntregaCarrera").text(listaPrestamo[0].escuelaAlumno);
            $("p#aprobarEntregaISBN").text(listaPrestamo[0].isbn);
            $("p#aprobarEntregaAutor").text(listaPrestamo[0].apellidosAutor + " "+ listaPrestamo[0].nombresAutor);
            $("p#aprobarEntregaTitulo").text(listaPrestamo[0].titulo);
            $("p#aprobarEntregaHora").text("Hora: "+listaPrestamo[0].hora_prestamo);
            $("p#aprobarEntregaFecha").text("Fecha: "+listaPrestamo[0].fecha_prestamo);
            $("p#aprobarEntregaOrigen").text("Origen: "+listaPrestamo[0].tipo_prestamo);
        }
    });
}