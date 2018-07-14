function cambiarPagina(ruta,controlador,parametro){
    document.form.action=ruta+"/"+controlador+parametro;
    document.form.method="POST";
    document.form.submit();
}

var funcionGrabaAutor=function(ruta,controlador,op){
    var apellidos=document.getElementById("txtApellidos").value;
    var nombres=document.getElementById("txtNombres").value;
    var detalle=document.getElementById("textDetalle").value;
    var autor= new Autor(ruta,controlador,op);
    autor.grabarAutor(apellidos,nombres,detalle);
    document.getElementById("txtApellidos").value="";
    document.getElementById("txtNombres").value="";
    document.getElementById("textDetalle").value="";
}

var funcionListarAutor=function(ruta,controlador,op){
    var autor= new Autor(ruta,controlador,op);
     var respuesta=autor.listarAutor();
     alert(respuesta);
}