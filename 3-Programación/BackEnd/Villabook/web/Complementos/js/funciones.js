function funcionLogin(ruta,controlador,parametro){
    document.form.action=ruta+"/"+controlador+parametro;
    document.form.loginEmail.value=document.getElementById("loginEmail").value;
    document.form.loginPassword.value=document.getElementById("loginPassword").value;
    document.form.method="POST";
    document.form.submit();
}

function funcionLogout(ruta,controlador,parametro){
    document.form.action=ruta+"/"+controlador+parametro;
    document.form.method="POST";
    document.form.submit();
}

function cambiarPagina(ruta,controlador,parametro){
    document.form.action=ruta+"/"+controlador+parametro;
    document.form.method="POST";
    document.form.submit();
}

var funcionGrabaAutor=function(ruta,controlador,op){
    var apellidos=document.getElementById("txtApellidosAutor").value;
    var nombres=document.getElementById("txtNombresAutor").value;
    var detalle=document.getElementById("textDetalleAutor").value;
    var autor= new Autor(ruta,controlador,op);
    autor.grabarAutor(apellidos,nombres,detalle);
    document.getElementById("txtApellidosAutor").value="";
    document.getElementById("txtNombresAutor").value="";
    document.getElementById("textDetalleAutor").value="";
}

var funcionCancelarAutor=function(){
    document.getElementById("txtApellidosAutor").value="";
    document.getElementById("txtNombresAutor").value="";
    document.getElementById("textDetalleAutor").value="";
}

function cargarArchivo(elemento){
    var file = elemento.files[0];
    var objHidden = document.form.nombre;
    objHidden.value = file.name;
    document.form.method = "POST";
    document.form.action ="ProcesarServlet";
    document.form.submit();
}

var funcionGrabarLibro=function(ruta,controlador,op){
    var tipoDocumento=$("#cbTipoDocumentoAddLibro").val();
    var escuela=$("#cbEscuelaAddLibro").val();
    var isbn=$("#txtIsbnAddLibro").val();
    var autor=$("#cbAutorAddLibro").val();
    var titulo=$("#txtTituloAddLibro").val();
    var stock=$("#txtStockAddLibro").val();
    var datosPubli=$("#txtDatosPubliAddLibro").val();
    var portada=$('#filePortadaAddLibro').val();
    var libro=new Libro(ruta,controlador,op);
    libro.addLibro(tipoDocumento,escuela,autor,isbn,portada,titulo,datosPubli,stock);
    
    $("#cbTipoDocumentoAddLibro").val("");
    $("#cbEscuelaAddLibro").val("");
    $("#txtIsbnAddLibro").val("");
    $("#cbAutorAddLibro").val("");
    $("#txtTituloAddLibro").val("");
    $("#txtStockAddLibro").val("");
    $("#txtDatosPubliAddLibro").val("");
    $("#filePortadaAddLibro").val("");
    $('#imgPortadaAddLibro').attr('src', "");
    
}

var funcionNoGrabarLibro=function(){
    $("#cbTipoDocumentoAddLibro").val("");
    $("#cbEscuelaAddLibro").val("");
    $("#txtIsbnAddLibro").val("");
    $("#cbAutorAddLibro").val("");
    $("#txtTituloAddLibro").val("");
    $("#txtStockAddLibro").val("");
    $("#txtDatosPubliAddLibro").val("");
    $("#filePortadaAddLibro").val("");
    $('#imgPortadaAddLibro').attr('src', "");
    
}

var funcionActualizarLibro=function(ruta,controlador,op){
    var tipoDocumento=$("#cbTipoDocumentoEditLibro").val();
    var escuela=$("#cbEscuelaEditLibro").val();
    var isbn=$("#txtIsbnEditLibro").val();
    var autor=$("#cbAutorEditLibro").val();
    var titulo=$("#txtTituloEditLibro").val();
    var datosPubli=$("#txtDatosPubliEditLibro").val();
    var portada=$("#filePortadaEditLibro").val();
    
    var libro= new Libro(ruta,controlador,op);
    libro.editarLibro(tipoDocumento,escuela,autor,isbn,portada,titulo,datosPubli);
}

var funcionListarLibro=function(ruta,controlador,op,isbn){
    var libro= new Libro(ruta,controlador,op);
    libro.listarLibro(isbn);
}

var funcionEliminarLibro=function(ruta,controlador,op,isbn){
    swal({
        title: "Estas seguro de eliminar el libro?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
    .then((willDelete) => {
        if (willDelete) {
            var libro= new Libro(ruta,controlador,op);
            libro.eliminarLibro(isbn);
        }
    });
}

var funcionVerAprobarPrestamo=function(ruta,controlador,op,idPrestamo){
    var prestamo = new Prestamo(ruta,controlador,op);
    prestamo.verAprobarPrestamo(idPrestamo);
}

var funcionAprobarPrestamo=function(ruta,controlador,op){
    var prestamo = new Prestamo(ruta,controlador,op);
    prestamo.aprobarPrestamo();
}

var funcionNoAprobarPrestamo=function(ruta,controlador,op){
    var idPrestamo = $('#noAprobarEntregaId').text();
    var idIsbn = $('#noAprobarIsbnLibro').text();
    var motivo="";
    $("input:checkbox[name=checkMotivo]:checked").each(function() {
        motivo += $(this).val()+" ,";
    });
    motivo += " "+$('#txtMotivo').val();
    var prestamo = new Prestamo(ruta,controlador,op);
    prestamo.noAprobarPrestamo(idPrestamo,motivo,idIsbn);
}

var funcionVerNoAprobarPrestamo=function(ruta,controlador,op,idPrestamo){
    var prestamo = new Prestamo(ruta,controlador,op);
    prestamo.verNoAprobarPrestamo(idPrestamo);
}

var funcionInfoNoAprobarEntrega=function(ruta,controlador,op,idPrestamo){
    var prestamo = new Prestamo(ruta,controlador,op);
     prestamo.infoNoAprobarEntrega(idPrestamo);
}

var funcionFiltrarPendiente=function(ruta,controlador,op,codAlumno){
    var prestamo = new Prestamo(ruta,controlador,op);
    prestamo.filtraPendiente(codAlumno);
}

var funcionFiltrarNoAprobada=function(ruta,controlador,op,codAlumno){
    var prestamo = new Prestamo(ruta,controlador,op);
    prestamo.filtrarNoAprobada(codAlumno);
}

var funcionFiltrarEntrega=function(ruta,controlador,op,condicionEntrega){
    if(condicionEntrega==='-1'){
        location.reload();
    }else{
        var prestamo = new Prestamo(ruta,controlador,op);
        prestamo.filtrarEntrega(condicionEntrega);
    }
}

var funcionEntregado=function(ruta,controlador,op,idPrestamo){
     var prestamo = new Prestamo(ruta,controlador,op);
        prestamo.entregado(idPrestamo);
}

var funcionAprobarDevolucion=function(ruta,controlador,op,idDevolucion){
    var isbn=$('#aprobarDevolucionISBN').text();
    var devolucion = new Devolucion(ruta,controlador,op);
    devolucion.aprobarDevolucion(idDevolucion,isbn);
}

var funcionVerAprobarDevolucion=function(ruta,controlador,op,idDevolucion){
    var devolucion = new Devolucion(ruta,controlador,op);
    devolucion.verAprobarDevolucion(idDevolucion);
}

var funcionFiltrarDevoPend=function(ruta,controlador,op,codAlumno){
    var devolucion = new Devolucion(ruta,controlador,op);
    devolucion.filtrarDevolucionPendiente(codAlumno);
}

var funcionFiltrarDevoApro=function(ruta,controlador,op,codAlumno){
    var devolucion = new Devolucion(ruta,controlador,op);
    devolucion.filtarDevolucionAprobada(codAlumno);
}