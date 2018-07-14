function Autor (ruta,controlador,op){
    this.ruta=ruta;
    this.controlador=controlador;
    this.op=op;
}

Autor.prototype.grabarAutor=function(apellidos,nombres,detalle){
    $.ajax({
        type:"POST",
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            apellidos:apellidos,
            nombres:nombres,
            detalle:detalle
        },
        success:function(response){
            alert(response);
        }
    });
}

Autor.prototype.listarAutor=function(){
    var respuesta;
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
         data:{
            op:this.op
        },
        success:function(response){
            respuesta=response;
              alert(respuesta);
        }
    });

    return respuesta;
}