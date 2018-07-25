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
            $("p#aprobarEntregaId").text(listaPrestamo[0].id_prestamo);
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

Prestamo.prototype.aprobarPrestamo = function(){
    var idPrestamo= $("p#aprobarEntregaId").text();
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            idPrestamoPendiente:idPrestamo
        },
        success: function (response) {
            if(response==="1"){
                swal({title: "Listo", text: "Se aprobo correctamente el libro", icon: 
                    "success"}).then(function(){ 
                       location.reload();
                    }
                );
            }else{
                swal({title: "Error", text: "No se  aprobo el libro", icon: 
                    "error"}).then(function(){ 
                       location.reload();
                    }
                );
            }
        }
    });
}

Prestamo.prototype.noAprobarPrestamo=function(idPrestamo,motivo){
    $.ajax({
        type: "POST",
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            id_prestamo:idPrestamo,
            motivo:motivo
        },
        success:function(response){
            if(response==="1"){
                swal({title: "Listo", text: "Se cancelo el prestamo", icon: 
                    "success"}).then(function(){ 
                       location.reload();
                    }
                );
            }else{
                swal({title: "Error", text: "No se pudo cancelar el prestamo", icon: 
                    "error"}).then(function(){ 
                       location.reload();
                    }
                );
            }
        }
    });
}


Prestamo.prototype.verNoAprobarPrestamo = function(idPrestamo){
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            id_prestamo:idPrestamo
        },
        success:function(response){
            var listaPrestamo=$.parseJSON(response);
            $("p#noAprobarEntregaId").text(listaPrestamo[0].id_prestamo);
        }
    });
}

Prestamo.prototype.infoNoAprobarEntrega = function(idPrestamo){
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            id_prestamo:idPrestamo
        },
        success:function(response){
            var listaPrestamo=$.parseJSON(response);
            $("p#noAprobadaApAlumno").text(listaPrestamo[0].apAlumno + " " + listaPrestamo[0].amAlumno);
            $("p#noAprobadaNombAl").text(listaPrestamo[0].nombAlumno);
            $("p#noAprobadaCod").text(listaPrestamo[0].codAlumno);
            $("p#noAprobadaEscuela").text(listaPrestamo[0].escuelaAlumno);
            $("p#noAprobarISBN").text(listaPrestamo[0].isbn);
            $("p#noAprobarAutor").text(listaPrestamo[0].apellidosAutor + " "+ listaPrestamo[0].nombresAutor);
            $("p#noAprobarTitulo").text(listaPrestamo[0].titulo);
            $("p#noAprobarApEmp").text(listaPrestamo[0].apEmpleado+" "+listaPrestamo[0].amEmpleado);
            $("p#noAprobarNombEmp").text(listaPrestamo[0].nombEmpleado);
            $("p#noAprobarMotivoEmp").text(listaPrestamo[0].observa_prestamo);
            $("p#noAprobarHora").text(listaPrestamo[0].hora_prestamo);
            $("p#noAprobarFecha").text(listaPrestamo[0].fecha_prestamo);
            $("p#noAprobarOrigen").text(listaPrestamo[0].tipo_prestamo);
        }
    });
}