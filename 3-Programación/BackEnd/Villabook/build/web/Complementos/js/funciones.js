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

var funcionGrabarLibro=function(ruta,controlador,op){
    var tipoDocumento=$("#cbTipoDocumentoAddLibro").val();
    var escuela=$("#cbEscuelaAddLibro").val();
    var isbn=$("#txtIsbnAddLibro").val();
    var autor=$("#cbAutorAddLibro").val();
    var titulo=$("#txtTituloAddLibro").val();
    var stock=$("#txtStockAddLibro").val();
    var datosPubli=$("#txtDatosPubliAddLibro").val();
    var portada=$("#filePortadaAddLibro").val();
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
