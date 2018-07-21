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
            if(response==="1"){
                swal("Listo","Se agrego un autor", "success");
            }else{
                swal("Error","No se pudo agregar el autor", "error");
            }
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
            
            $('#cbAutorEditLibro option').remove();
            $('#cbAutorEditLibro').append($('<option>', {
                    value: -1,
                    text: "........."
            }));
            for(var i=0; i<listaAutores.length; i++){
                $('#cbAutorEditLibro').append($('<option>', {
                    value: listaAutores[i].id_autor,
                    text: listaAutores[i].apellidos+" "+listaAutores[i].nombres
                }));
            }
        }
    });
}