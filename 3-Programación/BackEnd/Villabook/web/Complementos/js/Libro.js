function Libro(ruta,controlador,op){
    this.ruta=ruta;
    this.controlador=controlador;
    this.op=op;
}

Libro.prototype.addLibro=function(tipoDocumento,escuela,autor,isbn,portada,titulo,datosPubli,stockInicial){
    $.ajax({
        type: "POST",
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            tipoDocumento:tipoDocumento,
            escuela:escuela,
            autor:autor,
            isbn:isbn,
            portada:portada,
            titulo:titulo,
            datosPubli:datosPubli,
            stockInicial:stockInicial
        },
        success:function(response){
            alert(response);
            location.reload();
        }
    });
}

Libro.prototype.listarLibros=function(){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op
        },
        success:function(response){
            var listaLibros=$.parseJSON(response);
        }
    });
}
