function PrestamoCatalogo(ruta, controlador, op){
    this.ruta = ruta;
    this.controlador = controlador;
    this.op = op;
}

PrestamoCatalogo.prototype.solicitarPrestamo = function(idLibro, idEmpleado,idAlumno){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op: this.op,
            idLibro: idLibro,
            idEmpleado: idEmpleado,
            idAlumno: idAlumno
        },
        success:function(response){
            if(response==="1"){
                swal({title: "Listo", text: "Se aprobo correctamente el prestamo", icon: 
                    "success"}).then(function(){ 
                       location.href="../../Villabook/Vistas/Compucatalogo/inicio.jsp";
                       
                    }
                );
            }else{
                swal({title: "Error", text: "No se  aprobo el prestamo", icon: 
                    "error"}).then(function(){ 
                       location.reload();
                    }
                );
            }
        }
    });
}