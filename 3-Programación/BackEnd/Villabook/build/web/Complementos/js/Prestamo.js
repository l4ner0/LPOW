function Prestamo(ruta,controlador,op){
    this.ruta = ruta;
    this.controlador = controlador;
    this.op = op;
}

Prestamo.prototype.verAprobarPrestamo = function(idPrestamo){
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            id_prestamo:idPrestamo
        },
        success:function(response){
            var listaPrestamo=$.parseJSON(response);
            $("p#aprobarEntregaId").text(listaPrestamo[0].id_prestamo);
            $("p#aprobarEntregaApellidos").text(listaPrestamo[0].apAlumno + " " + listaPrestamo[0].amAlumno);
            $("p#aprobarEntregaNombres").text(listaPrestamo[0].nombAlumno);
            $("p#aprobarEntregaCodigo").text(listaPrestamo[0].codAlumno);
            $("p#aprobarEntregaCarrera").text(listaPrestamo[0].escuelaAlumno);
            $("p#aprobarEntregaISBN").text(listaPrestamo[0].isbn);
            $("p#aprobarEntregaAutor").text(listaPrestamo[0].apellidosAutor + " "+ listaPrestamo[0].nombresAutor);
            $("p#aprobarEntregaTitulo").text(listaPrestamo[0].titulo);
            $("p#aprobarEntregaHora").text(listaPrestamo[0].hora_prestamo);
            $("p#aprobarEntregaFecha").text(listaPrestamo[0].fecha_prestamo);
            $("p#aprobarEntregaOrigen").text(listaPrestamo[0].tipo_prestamo);
        }
    });
}

Prestamo.prototype.aprobarPrestamo = function(){
    var idPrestamo= $("p#aprobarEntregaId").text();
    var fechaPrestamo =$("p#aprobarEntregaFecha").text();
    var horaPrestamo=$("p#aprobarEntregaHora").text();
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            idPrestamoPendiente:idPrestamo,
            fechaPrestamo:fechaPrestamo,
            horaPrestamo:horaPrestamo
        },
        success: function (response) {
            if(response==="1"){
                swal({title: "Listo", text: "Se aprobo correctamente el prestamo", icon: 
                    "success"}).then(function(){ 
                       location.reload();
                    }
                );
            }else{
                swal({title: "Error", text: "No se  aprobo el prestamo", icon: 
                    "error"}).then(function(){ 
                       location.reload();
                    }
                );
            }
        }
    });
}

Prestamo.prototype.noAprobarPrestamo=function(idPrestamo,motivo,isbn){
    $.ajax({
        type: "POST",
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            id_prestamo:idPrestamo,
            motivo:motivo,
            isbn:isbn
        },
        success:function(response){
            if(response==="1"){
                swal({title: "Listo", text: "Se cancelo el prestamo", icon: 
                    "success"}).then(function(){ 
                       location.reload();
                    }
                );
            }else{
                swal({title: "Error", text: "No se pudo cancelar el prestamo", icon: 
                    "error"}).then(function(){ 
                       location.reload();
                    }
                );
            }
        }
    });
}


Prestamo.prototype.verNoAprobarPrestamo = function(idPrestamo){
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            id_prestamo:idPrestamo
        },
        success:function(response){
            var listaPrestamo=$.parseJSON(response);
            $("p#noAprobarEntregaId").text(listaPrestamo[0].id_prestamo);
            $("p#noAprobarIsbnLibro").text(listaPrestamo[0].isbn);
        }
    });
}

Prestamo.prototype.infoNoAprobarEntrega = function(idPrestamo){
    $.ajax({
        type: 'POST',
        url:this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            id_prestamo:idPrestamo
        },
        success:function(response){
            var listaPrestamo=$.parseJSON(response);
            $("p#noAprobadaApAlumno").text(listaPrestamo[0].apAlumno + " " + listaPrestamo[0].amAlumno);
            $("p#noAprobadaNombAl").text(listaPrestamo[0].nombAlumno);
            $("p#noAprobadaCod").text(listaPrestamo[0].codAlumno);
            $("p#noAprobadaEscuela").text(listaPrestamo[0].escuelaAlumno);
            $("p#noAprobarISBN").text(listaPrestamo[0].isbn);
            $("p#noAprobarAutor").text(listaPrestamo[0].apellidosAutor + " "+ listaPrestamo[0].nombresAutor);
            $("p#noAprobarTitulo").text(listaPrestamo[0].titulo);
            $("p#noAprobarApEmp").text(listaPrestamo[0].apEmpleado+" "+listaPrestamo[0].amEmpleado);
            $("p#noAprobarNombEmp").text(listaPrestamo[0].nombEmpleado);
            $("p#noAprobarMotivoEmp").text(listaPrestamo[0].observa_prestamo);
            $("p#noAprobarHora").text(listaPrestamo[0].hora_prestamo);
            $("p#noAprobarFecha").text(listaPrestamo[0].fecha_prestamo);
            $("p#noAprobarOrigen").text(listaPrestamo[0].tipo_prestamo);
        }
    });
}

Prestamo.prototype.filtraPendiente = function(codAlumno){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            codAlumno:codAlumno
        },
        success: function (response) {
             var listaPrestamo=$.parseJSON(response);
            
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
               
                for(var i=0; i<listaPrestamo.length; i++){

                 table
                    .row.add( [ 
                                i+1,
                                listaPrestamo[i].apAlumno+" "+listaPrestamo[i].amAlumno, 
                                listaPrestamo[i].codAlumno, 
                                listaPrestamo[i].isbn,
                                listaPrestamo[i].titulo,
                                listaPrestamo[i].apellidosAutor+" "+listaPrestamo[i].nombresAutor,
                                listaPrestamo[i].fecha_prestamo,  
                                listaPrestamo[i].tipo_prestamo,
                                ' <div class="table-data-feature btn-entregas-pendientes"> <button  class="item btn-tabla-editar" data-placement="top" title="Aprobar"  data-toggle="modal" data-target="#aprobarEntrega" id="btn-ListarAprobarEntrega"><i class="fa fa-check"></i></button></div>',
                                '<div class="table-data-feature btn-entregas-pendientes"><button  class="item  btn-tabla-eliminar" id="btn-ListarnoAprobarEntrega" data-toggle="modal" data-placement="top" title="Cancelar" data-target="#cancelarEntrega"><i class="fa fa-close"></i></button></div>'
                            ] )
                    .draw()
                    .node();
                }
                
                $('#tabla-entregas-pendientes tbody').on( 'click', '#btn-ListarAprobarEntrega', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                    var num=data[0]-1;
                    $("p#aprobarEntregaId").text(listaPrestamo[num].id_prestamo);
                    $("p#aprobarEntregaApellidos").text(listaPrestamo[num].apAlumno + " " + listaPrestamo[num].amAlumno);
                    $("p#aprobarEntregaNombres").text(listaPrestamo[num].nombAlumno);
                    $("p#aprobarEntregaCodigo").text(listaPrestamo[num].codAlumno);
                    $("p#aprobarEntregaCarrera").text(listaPrestamo[num].escuelaAlumno);
                    $("p#aprobarEntregaISBN").text(listaPrestamo[num].isbn);
                    $("p#aprobarEntregaAutor").text(listaPrestamo[num].apellidosAutor + " "+ listaPrestamo[num].nombresAutor);
                    $("p#aprobarEntregaTitulo").text(listaPrestamo[num].titulo);
                    $("p#aprobarEntregaHora").text(listaPrestamo[num].hora_prestamo);
                    $("p#aprobarEntregaFecha").text(listaPrestamo[num].fecha_prestamo);
                    $("p#aprobarEntregaOrigen").text(listaPrestamo[num].tipo_prestamo);
                } );
                $('#tabla-entregas-pendientes tbody').on( 'click', '#btn-ListarnoAprobarEntrega', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                    var num=data[0]-1;
                     $("p#noAprobarEntregaId").text(listaPrestamo[num].id_prestamo);
                     $("p#noAprobarIsbnLibro").text(listaPrestamo[0].isbn);
                } );
            }
        }
    });
}

Prestamo.prototype.filtrarNoAprobada = function(codAlumno){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            codAlumno:codAlumno
        },
        success: function (response) {
             var listaPrestamo=$.parseJSON(response);
            
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
               
                for(var i=0; i<listaPrestamo.length; i++){

                 table
                    .row.add( [ 
                                i+1,
                                listaPrestamo[i].apAlumno+" "+listaPrestamo[i].amAlumno, 
                                listaPrestamo[i].codAlumno, 
                                listaPrestamo[i].isbn,
                                listaPrestamo[i].titulo,
                                listaPrestamo[i].apellidosAutor+" "+listaPrestamo[i].nombresAutor,
                                listaPrestamo[i].fecha_prestamo,  
                                listaPrestamo[i].tipo_prestamo,
                                '<div class="table-data-feature btn-entregas-pendientes"><button id="btn-infoNoAprobada" class="item  btn-tabla-eliminar" data-toggle="modal" data-placement="top" title="Información" data-target="#infoCancelado"><i class="fa fa-info"></i></button></div>'
                            ] )
                    .draw()
                    .node();
                }
                
                $('#tabla-entregas-pendientes tbody').on( 'click', '#btn-infoNoAprobada', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                    var num=data[0]-1;
                    $("p#noAprobadaApAlumno").text(listaPrestamo[num].apAlumno + " " + listaPrestamo[num].amAlumno);
                    $("p#noAprobadaNombAl").text(listaPrestamo[num].nombAlumno);
                    $("p#noAprobadaCod").text(listaPrestamo[num].codAlumno);
                    $("p#noAprobadaEscuela").text(listaPrestamo[num].escuelaAlumno);
                    $("p#noAprobarISBN").text(listaPrestamo[num].isbn);
                    $("p#noAprobarAutor").text(listaPrestamo[num].apellidosAutor + " "+ listaPrestamo[num].nombresAutor);
                    $("p#noAprobarTitulo").text(listaPrestamo[num].titulo);
                    $("p#noAprobarApEmp").text(listaPrestamo[num].apEmpleado+" "+listaPrestamo[num].amEmpleado);
                    $("p#noAprobarNombEmp").text(listaPrestamo[num].nombEmpleado);
                    $("p#noAprobarMotivoEmp").text(listaPrestamo[num].observa_prestamo);
                    $("p#noAprobarHora").text(listaPrestamo[num].hora_prestamo);
                    $("p#noAprobarFecha").text(listaPrestamo[num].fecha_prestamo);
                    $("p#noAprobarOrigen").text(listaPrestamo[num].tipo_prestamo);
                } );
            }
        }
    });
}

Prestamo.prototype.filtrarEntrega = function(condicionEntrega){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            condicionEntrega:condicionEntrega
        },
        success: function (response) {
             var listaPrestamo=$.parseJSON(response);
            if(response === "[]"){
                var table = $('#tabla-entregas-pendientes').DataTable();
                table.clear().draw();
                
            }else{
               var table = $('#tabla-entregas-pendientes').DataTable();
               table.clear().draw();
               
                for(var i=0; i<listaPrestamo.length; i++){
                    if(listaPrestamo[i].codicionEntrega === 0){
                        table
                            .row.add( [ 
                                        i+1,
                                        listaPrestamo[i].isbn,
                                        listaPrestamo[i].titulo,
                                        listaPrestamo[i].apellidosAutor+" "+listaPrestamo[i].nombresAutor,
                                        listaPrestamo[i].codAlumno, 
                                        listaPrestamo[i].hora_prestamo, 
                                        listaPrestamo[i].fecha_prestamo,  
                                        listaPrestamo[i].tipo_prestamo,
                                        '<div class="table-data-feature btn-entregas-pendientes"><button class="item btn-tabla-editar" id="btn-entregar"  data-placement="top" title="Entregar"  data-toggle="modal" data-target="#aprobarEntrega"><i class="fa fa-check"></i></button></div>'
                                    ] )
                            .draw()
                            .node();
                    
                    }else if(listaPrestamo[i].codicionEntrega === 1){
                        table
                            .row.add( [ 
                                        i+1,
                                        listaPrestamo[i].isbn,
                                        listaPrestamo[i].titulo,
                                        listaPrestamo[i].apellidosAutor+" "+listaPrestamo[i].nombresAutor,
                                        listaPrestamo[i].codAlumno, 
                                        listaPrestamo[i].hora_prestamo, 
                                        listaPrestamo[i].fecha_prestamo,  
                                        listaPrestamo[i].tipo_prestamo,
                                        ' <span class="status--process">Entregado</span>'
                                    ] )
                            .draw()
                            .node();
                    }
                }
                
                $('#tabla-entregas-pendientes tbody').on( 'click', '#btn-entregar', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                    var num=data[0]-1;
                    table
                                .row( $(this).parents('tr') )
                                .remove()
                                .draw();
                    $.ajax({
                        type: 'POST',
                        url: "/Villabook/PrestamoServlet",
                        data:{
                            op:8,
                            idPrestamo:listaPrestamo[num].id_prestamo
                        },
                        success:function(response){
                            if(response === "-1"){
                                 swal({title: "Error", text: "No se  aprobo la entrega del libro", icon: 
                                    "error"});
                            }
                        }
                    });
                } );
            }
        }
    });
}

Prestamo.prototype.entregado=function(idPrestamo){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            idPrestamo:idPrestamo
        },
        success: function (response) {
            if(response==="1"){
                location.reload();
            }else{
                swal({title: "Error", text: "No se  aprobo la entrega del libro", icon: 
                    "error"}).then(function(){ 
                       location.reload();
                    }
                );
            }
        }
    });
}