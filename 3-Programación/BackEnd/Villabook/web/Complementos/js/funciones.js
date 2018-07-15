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
    alert("Tipo de Documento: "+tipoDocumento+"\n"+
            "Escuela: "+escuela+"\n"+
            "ISBN: "+isbn+"\n"+
            "Autor: "+autor+"\n"+
            "Titulo: "+titulo+"\n"+
            "Stock :"+stock+"\n"+
            "Datos de Publicación: "+datosPubli+"\n"+
            "Portada: "+portada);
    
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
