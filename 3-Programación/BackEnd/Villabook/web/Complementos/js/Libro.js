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
        type: "POST",
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
        },
        success:function(response){
            var listarLibros=$.parseJSON(response);
            var tabla= $('#tabla-libros').DataTable();
            
            var fila= tabla.row.add([
                '<td>'+listarLibros.ISBN+'</td>',
                '<td>'+listarLibros.titulo+'</td>',
                '<td>'+listarLibros.autor+'</td>',
                '<td>'+listarLibros.datos_publi+'</td>',
                '<td><span class="status--process">'+listarLibros.escuela+'</span></td>',
                '<td><img src="/Villabook/Complementos/dist/img/portada-libro.png" width="45"></td>',
                '<td><div class="table-data-feature">'+
                        '<button class="item btn-tabla-editar" onclick="funcionListarLibro()" data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro" ><i class="fa fa-edit"></i></button>'+
                        '<button class="item btn-tabla-eliminar" onclick="funcionEliminarLibro()" data-toggle="tooltip" data-placement="top" title="Eliminar"><i class="fa fa-trash"></i></button>'
                +'</div></td>'
            ]).draw().node();

            $(fila).addClass('tr-shadow');
        }
    });
}

Libro.prototype.listarLibro=function(isbn){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            isbn:isbn
        },
        success:function(response){
            var listarLibro=$.parseJSON(response);
            $("#cbTipoDocumentoEditLibro").val(listarLibro[0].id_tipo_documento);
            $("#cbEscuelaEditLibro").val(listarLibro[0].id_escuela);
            $("#txtIsbnEditLibro").val(listarLibro[0].ISBN);
            $("#cbAutorEditLibro").val(listarLibro[0].id_autor);
            $("#txtTituloEditLibro").val(listarLibro[0].titulo);
            $("#txtStockEditLibro").val(listarLibro[0].stock_inicial);
            $("#txtDatosPubliEditLibro").val(listarLibro[0].datos_publi);
            $(document).on('change', '#filePortadaEditLibro', function(e) {
                // Obtenemos la ruta temporal mediante el evento
                var TmpPath = listarLibro[0].portada;
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
            swal("Listo",response, "success");
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
