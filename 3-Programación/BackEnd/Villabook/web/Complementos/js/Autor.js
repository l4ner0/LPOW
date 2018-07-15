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
            var listAutores=$.parseJSON(response);
            $('#selectorAutores option').remove();
            $('#selectorAutores').append($('<option>', {
                    value: -1,
                    text: "........."
                }));
            for(var i=0; i<listAutores.length; i++){
                $('#selectorAutores').append($('<option>', {
                    value: listAutores[i].id_autor,
                    text: listAutores[i].apellidos+" "+listAutores[i].nombres
                }));
            }
        }
    });
}