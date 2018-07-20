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

Libro.prototype.listarLibros=function(isbn){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            isbn:isbn
        },
        success:function(response){
            var listaLibros=$.parseJSON(response);
            $("#cbTipoDocumentoEditLibro").val(listaLibros[0].id_tipo_documento);
            $("#cbEscuelaEditLibro").val(listaLibros[0].id_escuela);
            $("#txtIsbnEditLibro").val(listaLibros[0].ISBN);
            $("#cbAutorEditLibro").val(listaLibros[0].id_autor);
            $("#txtTituloEditLibro").val(listaLibros[0].titulo);
            $("#txtStockEditLibro").val(listaLibros[0].stock_inicial);
            $("#txtDatosPubliEditLibro").val(listaLibros[0].datos_publi);
            $(document).on('change', '#filePortadaEditLibro', function(e) {
                // Obtenemos la ruta temporal mediante el evento
                var TmpPath = listaLibros[0].portada;
                // Mostramos la ruta temporal
                $('#imgPortadaEditLibro').attr('src', TmpPath);
            });
        }
    });
}

Libro.prototype.editarLibro=function(tipoDocumento,escuela,autor,isbn,portada,titulo,datosPubli){
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
            datosPubli:datosPubli
        },
        success:function(response){
            alert(response);
            location.reload();
        }
    });
}

Libro.prototype.eliminarLibro=function(isbn){
    $.ajax({
        type: "POST",
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            isbn:isbn
        },
        success:function(response){
            location.reload();
        }
    });
}
