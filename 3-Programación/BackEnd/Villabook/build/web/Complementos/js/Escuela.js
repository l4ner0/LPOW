function Escuela(ruta,controlador,op){
    this.ruta=ruta;
    this.controlador=controlador;
    this.op=op; 
}

Escuela.prototype.listarEscuelas=function(){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op
        },
        success: function(response){
            var listaEscuelas=$.parseJSON(response);
            $('#cbEscuelaAddLibro option').remove();
            $('#cbEscuelaAddLibro').append($('<option>',{
                value:-1,
                text: "........."
            }));
            for(var i=0; i<listaEscuelas.length; i++){
                $('#cbEscuelaAddLibro').append($('<option>', {
                    value: listaEscuelas[i].id_escuela,
                    text: listaEscuelas[i].nombre
                }));
            }
            
            $('#cbEscuelaEditLibro option').remove();
            $('#cbEscuelaEditLibro').append($('<option>',{
                value:-1,
                text: "........."
            }));
            for(var i=0; i<listaEscuelas.length; i++){
                $('#cbEscuelaEditLibro').append($('<option>', {
                    value: listaEscuelas[i].id_escuela,
                    text: listaEscuelas[i].nombre
                }));
            }
        }
    });
}