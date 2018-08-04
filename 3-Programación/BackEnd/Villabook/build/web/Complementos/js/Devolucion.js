function Devolucion(ruta,controlador,op){
    this.ruta = ruta;
    this.controlador = controlador;
    this.op = op;
}

Devolucion.prototype.verAprobarDevolucion=function(idDevolucion){
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            idDevolucion:idDevolucion
        },
        success:function(response){
            var listaDevolucion=$.parseJSON(response);
            $("p#aprobarDevolucionId").text(listaDevolucion[0].id_devolucion);
            $("p#aprobarDevolucionApellidos").text(listaDevolucion[0].apAlumno + " " + listaDevolucion[0].amAlumno);
            $("p#aprobarDevolucionNombres").text(listaDevolucion[0].nombAlumno);
            $("p#aprobarDevolucionCodigo").text(listaDevolucion[0].codAlumno);
            $("p#aprobarDevolucionCarrera").text(listaDevolucion[0].escuela);
            $("p#aprobarDevolucionISBN").text(listaDevolucion[0].isbn);
            $("p#aprobarDevolucionAutor").text(listaDevolucion[0].apellidosAutor + " "+ listaDevolucion[0].nombresAutor);
            $("p#aprobarDevolucionTitulo").text(listaDevolucion[0].titulo);
            $("p#aprobarDevolucionHora").text(listaDevolucion[0].hora_devolucion);
            $("p#aprobarDevolucionFecha").text(listaDevolucion[0].fecha_devolucion);
            $("p#aprobarPrestamoOrigen").text(listaDevolucion[0].tipoPrestamo);
        }
    });
}

Devolucion.prototype.aprobarDevolucion=function(idDevolucion,isbn){
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            idDevolucion:idDevolucion,
            isbn:isbn
        },
        success: function (response) {
            if(response==="1"){
                swal({title: "Listo", text: "Se aprobo correctamente la devolucion", icon: 
                    "success"}).then(function(){ 
                       location.reload();
                    }
                );
            }else{
                swal({title: "Error", text: "No se  aprobo la devolucion", icon: 
                    "error"}).then(function(){ 
                       location.reload();
                    }
                );
            }
        }
    });
}

Devolucion.prototype.filtrarDevolucionPendiente=function(codAlumno){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            codAlumno:codAlumno
        },
        success: function (response) {
             var listaDevolucion=$.parseJSON(response);
            
            if(response === "[]"){
               swal({title:  'El Alumno '+codAlumno+' no existe', text: 'Asegurese de escribir bien el codigo por favor', icon: 
                    'warning'}).then(function(){ 
                       location.reload();
                    }
                );
            }else{
                swal(
                    'Alumno encontrado',
                    '',
                    'success'
                  )
               var table = $('#tabla-entregas-pendientes').DataTable();
               table.clear().draw();
               
                for(var i=0; i<listaDevolucion.length; i++){

                 table
                    .row.add( [ 
                                i+1,
                                listaDevolucion[i].apAlumno+" "+listaDevolucion[i].amAlumno, 
                                listaDevolucion[i].codAlumno, 
                                listaDevolucion[i].isbn,
                                listaDevolucion[i].titulo,
                                listaDevolucion[i].apellidosAutor+" "+listaDevolucion[i].nombresAutor,
                                listaDevolucion[i].hora_devolucion,  
                                listaDevolucion[i].fecha_devolucion,  
                                listaDevolucion[i].tipoPrestamo,
                                '<div class="table-data-feature btn-entregas-pendientes"><button class="item btn-tabla-editar" id="btn-infoAprobadaDevo"   data-placement="top" title="Aprobar"  data-toggle="modal" data-target="#aprobarEntrega"><i class="fa fa-check"></i></button></div>'
                            ] )
                    .draw()
                    .node();
                }
                
                $('#tabla-entregas-pendientes tbody').on( 'click', '#btn-infoAprobadaDevo', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                    var num=data[0]-1;
                    $("p#aprobarDevolucionId").text(listaDevolucion[num].id_devolucion);
                    $("p#aprobarDevolucionApellidos").text(listaDevolucion[num].apAlumno + " " + listaDevolucion[num].amAlumno);
                    $("p#aprobarDevolucionNombres").text(listaDevolucion[num].nombAlumno);
                    $("p#aprobarDevolucionCodigo").text(listaDevolucion[num].codAlumno);
                    $("p#aprobarDevolucionCarrera").text(listaDevolucion[num].escuela);
                    $("p#aprobarDevolucionISBN").text(listaDevolucion[num].isbn);
                    $("p#aprobarDevolucionAutor").text(listaDevolucion[num].apellidosAutor + " "+ listaDevolucion[num].nombresAutor);
                    $("p#aprobarDevolucionTitulo").text(listaDevolucion[num].titulo);
                    $("p#aprobarDevolucionHora").text(listaDevolucion[num].hora_devolucion);
                    $("p#aprobarDevolucionFecha").text(listaDevolucion[num].fecha_devolucion);
                    $("p#aprobarPrestamoOrigen").text(listaDevolucion[num].tipoPrestamo);
                } );
            }
        }
    });
}

Devolucion.prototype.filtarDevolucionAprobada=function(codAlumno){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            codAlumno:codAlumno
        },
        success: function (response) {
             var listaDevolucion=$.parseJSON(response);
            
            if(response === "[]"){
               swal({title:  'El Alumno '+codAlumno+' no existe', text: 'Asegurese de escribir bien el codigo por favor', icon: 
                    'warning'}).then(function(){ 
                       location.reload();
                    }
                );
            }else{
                swal(
                    'Alumno encontrado',
                    '',
                    'success'
                  )
               var table = $('#tabla-entregas-pendientes').DataTable();
               table.clear().draw();
               
                for(var i=0; i<listaDevolucion.length; i++){

                 table
                    .row.add( [ 
                                i+1,
                                listaDevolucion[i].apAlumno+" "+listaDevolucion[i].amAlumno, 
                                listaDevolucion[i].codAlumno, 
                                listaDevolucion[i].isbn,
                                listaDevolucion[i].titulo,
                                listaDevolucion[i].apellidosAutor+" "+listaDevolucion[i].nombresAutor,
                                listaDevolucion[i].hora_devolucion,  
                                listaDevolucion[i].fecha_devolucion,  
                                listaDevolucion[i].tipoPrestamo
                            ] )
                    .draw()
                    .node();
                }
                
            }
        }
    });    
}