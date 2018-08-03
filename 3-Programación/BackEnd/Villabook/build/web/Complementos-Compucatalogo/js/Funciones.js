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

function FuncionFiltrarTipoDocumento(ruta,controlador,parametro,tipoDocumento){
    var libroCatalogo = new LibroCatalogo(ruta,controlador,parametro);
    libroCatalogo.filtrarLibroTipoDocumento(tipoDocumento);
    
}

function FuncionFiltrarEscuela(ruta,controlador,parametro,idEscuela){
    var libroCatalogo = new LibroCatalogo(ruta,controlador,parametro);
    libroCatalogo.filtrarLibroEscuela(idEscuela);
    
}

function FuncionSolicitarPrestamo(ruta,controlador,parametro,idLibro, idEmpleado,idAlumno){
    swal({
        title: "Estas seguro solicitar este libro?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
    .then((willDelete) => {
        if (willDelete) {
            var prestamo = new PrestamoCatalogo(ruta, controlador, parametro);
            prestamo.solicitarPrestamo(idLibro, idEmpleado, idAlumno);
        }
    });
}