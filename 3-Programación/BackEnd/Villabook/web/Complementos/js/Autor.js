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
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
         data:{
            op:this.op
        },
        success:function(response){
            var listaAutores=$.parseJSON(response);
            $('#cbAutorAddLibro option').remove();
            $('#cbAutorAddLibro').append($('<option>', {
                    value: -1,
                    text: "........."
            }));
            for(var i=0; i<listaAutores.length; i++){
                $('#cbAutorAddLibro').append($('<option>', {
                    value: listaAutores[i].id_autor,
                    text: listaAutores[i].apellidos+" "+listaAutores[i].nombres
                }));
            }
        }
    });
}