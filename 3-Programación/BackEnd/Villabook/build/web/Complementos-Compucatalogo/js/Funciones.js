function validaVacio(valor) {
        valor = valor.replace("&nbsp;", "");
        valor = valor === undefined ? "" : valor;
        if (!valor || 0 === valor.trim().length) {
            return false;
        }
        else {
            return true;
        }
}
function funcionEntrar(ruta,controlador,parametro){
    var codigoAlumno = document.getElementById("txtCodAlumno").value;
    var respuesta = validaVacio(codigoAlumno);
    if(respuesta){
        document.form.action=ruta+"/"+controlador+parametro;
        document.form.codAlumno.value=codigoAlumno;
        document.form.method="POST";
        document.form.submit();
    }else{
        return false;
    }
    
}

function funcionLogout(ruta,controlador,parametro){
    document.form.action=ruta+"/"+controlador+parametro;
    document.form.method="POST";
    document.form.submit();
}

function FuncionFiltrarTipoDocumento(ruta,controlador,parametro,tipoDocumento,idAlumno,idEmpleado){
    var libroCatalogo = new LibroCatalogo(ruta,controlador,parametro);
    libroCatalogo.filtrarLibroTipoDocumento(tipoDocumento,idAlumno,idEmpleado,ruta);
    
}

function FuncionFiltrarEscuela(ruta,controlador,parametro,idEscuela,idAlumno,idEmpleado){
    var libroCatalogo = new LibroCatalogo(ruta,controlador,parametro);
    libroCatalogo.filtrarLibroEscuela(idEscuela,idAlumno,idEmpleado,ruta);
    
}

function FuncionSolicitarPrestamo(ruta,controlador,parametro,idLibro, idEmpleado,idAlumno,stockFinal){
    if(stockFinal <= 0){
        swal("Error","No hay unidades disponibles", "error");
    }else{
        swal({
            title: "Estas seguro solicitar este libro?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
        .then((willDelete) => {
            if (willDelete) {
                var prestamo = new PrestamoCatalogo(ruta, controlador, parametro);
                prestamo.solicitarPrestamo(idLibro, idEmpleado, idAlumno,ruta);
            }
        });
    }
}

function FuncionBuscarLibro(ruta,controlador,idAlumno,idEmpleado){
    var tipoBusqueda=$('#tipoBusqueda').val();
    var busqueda=$('#txtBusqueda').val();
    if(tipoBusqueda === "-1"){
        swal("Error","Elija un tipo de busqueda", "error");
    }else if(tipoBusqueda === "1"){
         var libroCatalogo = new LibroCatalogo(ruta,controlador,8);
         libroCatalogo.filtrarLibroIsbn(busqueda,idAlumno,idEmpleado,ruta);
    }else if(tipoBusqueda === "2"){
        var libroCatalogo = new LibroCatalogo(ruta,controlador,9);
        libroCatalogo.filtrarLibroTitulo(busqueda,idAlumno,idEmpleado,ruta);
    }

}