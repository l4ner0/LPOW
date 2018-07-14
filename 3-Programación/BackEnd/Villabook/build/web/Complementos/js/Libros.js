function Libros(tipoLibro,escuela,autor,isbn,portada,titulo,datosPubli,stockInicial,ruta){
    this.tipoLibro=tipoLibro;
    this.escuela=escuela;
    this.autor=autor;
    this.isbn=isbn;
    this.portada=portada;
    this.titulo=titulo;
    this.datosPubli=datosPubli;
    this.stockInicial=stockInicial;
    this.ruta=ruta;
}

Libros.prototype.addLibro=function(){
    $.ajax({
        type: "POST",
        url:this.ruta,
        data:{
          tipoLibro:this.tipoLibro,
          escuela:this.escuela,
          autor:this.autor,
          isbn:this.isbn,
          portada:this.portada,
          titulo:this.titulo,
          datosPubli:this.datosPubli,
          stockInicial:this.stockInicial
        },
        success:function(response){
            
        }
    });
}
