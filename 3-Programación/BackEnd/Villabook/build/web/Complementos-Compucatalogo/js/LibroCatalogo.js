function LibroCatalogo(ruta, controlador, op){
    this.ruta = ruta;
    this.controlador = controlador;
    this.op = op;
}

LibroCatalogo.prototype.filtrarLibroTipoDocumento = function(tipoDocumento,idAlumno,idEmpleado){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            tipoDocumento:tipoDocumento
        },
        success: function (response) {
             var listaLibros=$.parseJSON(response);
            if(response === "[]"){
                var table = $('#catalogo').DataTable();
                table.clear().draw();
                
            }else{
               var table = $('#catalogo').DataTable();
               table.clear().draw();
               
                for(var i=0; i<listaLibros.length; i++){
                    var disponibilidad="";
                    if(listaLibros[i].stock_final > 0){
                        disponibilidad = "Disponible";
                    }else{
                        disponibilidad = "No Disponible";
                    }
                       var fila= table
                            .row.add( [ 
                                       '<div class="box1">'+
                                        '<div class="col_1_of_single1 span_1_of_single1">'+
                                          '<div class="view1 view-fifth1">'+
                                            '<div class="top_box">'+
                                                '<h3>'+listaLibros[i].titulo+'</h3>'+
                                              '<p id="autor'+i+'" class="m_2">'+listaLibros[i].autor+'</p>'+
                                              '<a href="#">'+
                                                '<div class="grid_img">'+
                                                  '<div class="css3"><img src="/Villabook/Complementos-Compucatalogo/images/portada-libro.png" alt=""/></div>'+
                                                  '<div class="mask1">'+
                                                    '<div class="info" id="btn-solicitar">Solicitar</div>'+
                                                  '</div>'+
                                                '</div>'+
                                              '</a>'+
                                              '<div class="price">'+disponibilidad+'</div>'+
                                            '</div>'+
                                          '</div>'+
                                          '<ul class="list2" style="list-style: none;">'+
                                            '<li>'+
                                              '<img src="/Villabook/Complementos-Compucatalogo/images/plus.png" alt=""/>'+
                                              '<ul class="icon1 sub-icon1 profile_img">'+
                                                '<li><a class="active-icon c1" href="#" id="btn-solicitar">Solicitar </a>'+
                                                    '<ul class="sub-icon1 list">'+
                                                      '<li><h3>Descripción del Libro</h3><a href=""></a></li>'+
                                                      '<li><p>'+listaLibros[i].datos_publi+'</p></li>'+
                                                    '</ul>'+
                                                '</li>'+
                                              '</ul>'+
                                            '</li>'+
                                          '</ul>'+
                                          '<div class="clear"></div>'+
                                        '</div>'+
                                              '<div class="clearfix"></div>'+
                                        '</div>'
                                    ] )
                            .draw()
                            .node();   
                  $(fila).addClass('col-md-4');
                }
                
                
                
                $('#catalogo tbody').off('click', 'tr');
                
                $('#catalogo tbody').on( 'click', 'tr', function () {  
                    var num = table.row( this ).index();  
                    if(listaLibros[num].stock_final <= 0 ){
                        swal("Error","No hay unidades disponibles", "error");
                    }else{
                        swal({
                            title: "Estas seguro solicitar este libro?",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                        .then((willDelete) => {
                            if(willDelete){
                                $.ajax({
                                    type: 'POST',
                                    url: "/Villabook/PrestamoServlet",
                                    data:{
                                        op: 9,
                                        idLibro: listaLibros[num].id_libro,
                                        idEmpleado: idEmpleado,
                                        idAlumno: idAlumno,
                                        tipoPrestamo:"Presencial"
                                    },
                                    success:function(response){
                                        if(response==="1"){
                                            swal({title: "Listo", text: "Se aprobo correctamente el prestamo", icon: 
                                                "success"}).then(function(){ 
                                                   location.href="../../Villabook/Vistas/Compucatalogo/inicio.jsp";

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
                        });
                    }
                     
                } );
            }
        }
    });
}

LibroCatalogo.prototype.filtrarLibroEscuela= function(idEscuela, idAlumno,idEmpleado){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            idEscuela:idEscuela
        },
        success: function (response) {
             var listaLibros=$.parseJSON(response);
            if(response === "[]"){
                var table = $('#catalogo').DataTable();
                table.clear().draw();
                
            }else{
               var table = $('#catalogo').DataTable();
               table.clear().draw();
               
                for(var i=0; i<listaLibros.length; i++){
                     var disponibilidad="";
                    if(listaLibros[i].stock_final > 0){
                        disponibilidad = "Disponible";
                    }else{
                        disponibilidad = "No Disponible";
                    }
                       var fila= table
                            .row.add( [ 
                                       '<div class="box1">'+
                                        '<div class="col_1_of_single1 span_1_of_single1">'+
                                          '<div class="view1 view-fifth1">'+
                                            '<div class="top_box">'+
                                                '<h3>'+listaLibros[i].titulo+'</h3>'+
                                              '<p class="m_2">'+listaLibros[i].autor+'</p>'+
                                              '<a href="#">'+
                                                '<div class="grid_img">'+
                                                  '<div class="css3"><img src="/Villabook/Complementos-Compucatalogo/images/portada-libro.png" alt=""/></div>'+
                                                  '<div class="mask1">'+
                                                    '<div class="info" id="btn-solicitar">Solicitar</div>'+
                                                  '</div>'+
                                                '</div>'+
                                              '</a>'+
                                              '<div class="price">'+disponibilidad+'</div>'+
                                            '</div>'+
                                          '</div>'+
                                          '<ul class="list2" style="list-style: none;">'+
                                            '<li>'+
                                              '<img src="/Villabook/Complementos-Compucatalogo/images/plus.png" alt=""/>'+
                                              '<ul class="icon1 sub-icon1 profile_img">'+
                                                '<li><a class="active-icon c1" href="#" id="btn-solicitar">Solicitar </a>'+
                                                    '<ul class="sub-icon1 list">'+
                                                      '<li><h3>Descripción del Libro</h3><a href=""></a></li>'+
                                                      '<li><p>'+listaLibros[i].datos_publi+'</p></li>'+
                                                    '</ul>'+
                                                '</li>'+
                                              '</ul>'+
                                            '</li>'+
                                          '</ul>'+
                                          '<div class="clear"></div>'+
                                        '</div>'+
                                              '<div class="clearfix"></div>'+
                                        '</div>'
                                    ] )
                            .draw()
                            .node();   
                  $(fila).addClass('col-md-4');
                }
                
                
                $('#catalogo tbody').off('click', 'tr');
                
                $('#catalogo tbody').on( 'click', 'tr', function () {
                    var num = table.row( this ).index();
                    if(listaLibros[num].stock_final <= 0 ){
                        swal("Error","No hay unidades disponibles", "error");
                    }else{
                        swal({
                            title: "Estas seguro solicitar este libro?",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                        .then((willDelete) => {
                            if(willDelete){
                                $.ajax({
                                    type: 'POST',
                                    url: "/Villabook/PrestamoServlet",
                                    data:{
                                        op: 9,
                                        idLibro: listaLibros[num].id_libro,
                                        idEmpleado: idEmpleado,
                                        idAlumno: idAlumno,
                                        tipoPrestamo:"Presencial"
                                    },
                                    success:function(response){
                                        if(response==="1"){
                                            swal({title: "Listo", text: "Se aprobo correctamente el prestamo", icon: 
                                                "success"}).then(function(){ 
                                                   location.href="../../Villabook/Vistas/Compucatalogo/inicio.jsp";

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
                        });
                    }
                } );
            }
        }
    });
}

LibroCatalogo.prototype.filtrarLibroIsbn = function(isbn,idAlumno,idEmpleado){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            isbn:isbn
        },
        success: function (response) {
             var listaLibros=$.parseJSON(response);
            if(response === "[]"){
                var table = $('#catalogo').DataTable();
                table.clear().draw();
                
            }else{
               var table = $('#catalogo').DataTable();
               table.clear().draw();
               
                for(var i=0; i<listaLibros.length; i++){
                     var disponibilidad="";
                    if(listaLibros[i].stock_final > 0){
                        disponibilidad = "Disponible";
                    }else{
                        disponibilidad = "No Disponible";
                    }
                       var fila= table
                            .row.add( [ 
                                       '<div class="box1">'+
                                        '<div class="col_1_of_single1 span_1_of_single1">'+
                                          '<div class="view1 view-fifth1">'+
                                            '<div class="top_box">'+
                                                '<h3>'+listaLibros[i].titulo+'</h3>'+
                                              '<p id="autor'+i+'" class="m_2">'+listaLibros[i].autor+'</p>'+
                                              '<a href="#">'+
                                                '<div class="grid_img">'+
                                                  '<div class="css3"><img src="/Villabook/Complementos-Compucatalogo/images/portada-libro.png" alt=""/></div>'+
                                                  '<div class="mask1">'+
                                                    '<div class="info" id="btn-solicitar">Solicitar</div>'+
                                                  '</div>'+
                                                '</div>'+
                                              '</a>'+
                                              '<div class="price">'+disponibilidad+'</div>'+
                                            '</div>'+
                                          '</div>'+
                                          '<ul class="list2" style="list-style: none;">'+
                                            '<li>'+
                                              '<img src="/Villabook/Complementos-Compucatalogo/images/plus.png" alt=""/>'+
                                              '<ul class="icon1 sub-icon1 profile_img">'+
                                                '<li><a class="active-icon c1" href="#" id="btn-solicitar">Solicitar </a>'+
                                                    '<ul class="sub-icon1 list">'+
                                                      '<li><h3>Descripción del Libro</h3><a href=""></a></li>'+
                                                      '<li><p>'+listaLibros[i].datos_publi+'</p></li>'+
                                                    '</ul>'+
                                                '</li>'+
                                              '</ul>'+
                                            '</li>'+
                                          '</ul>'+
                                          '<div class="clear"></div>'+
                                        '</div>'+
                                              '<div class="clearfix"></div>'+
                                        '</div>'
                                    ] )
                            .draw()
                            .node();   
                  $(fila).addClass('col-md-4');
                }
                
                
                
                $('#catalogo tbody').off('click', 'tr');
                
                $('#catalogo tbody').on( 'click', 'tr', function () {  
                    var num = table.row( this ).index();    
                    if(listaLibros[num].stock_final <= 0 ){
                        swal("Error","No hay unidades disponibles", "error");
                    }else{
                        swal({
                            title: "Estas seguro solicitar este libro?",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                        .then((willDelete) => {
                            if(willDelete){
                                $.ajax({
                                    type: 'POST',
                                    url: "/Villabook/PrestamoServlet",
                                    data:{
                                        op: 9,
                                        idLibro: listaLibros[num].id_libro,
                                        idEmpleado: idEmpleado,
                                        idAlumno: idAlumno,
                                        tipoPrestamo:"Presencial"
                                    },
                                    success:function(response){
                                        if(response==="1"){
                                            swal({title: "Listo", text: "Se aprobo correctamente el prestamo", icon: 
                                                "success"}).then(function(){ 
                                                   location.href="../../Villabook/Vistas/Compucatalogo/inicio.jsp";

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
                        });
                    }
                } );
            }
        }
    });
}

LibroCatalogo.prototype.filtrarLibroTitulo = function(titulo,idAlumno,idEmpleado){
    $.ajax({
        type: 'POST',
        url: this.ruta+"/"+this.controlador,
        data:{
            op:this.op,
            titulo:titulo
        },
        success: function (response) {
             var listaLibros=$.parseJSON(response);
            if(response === "[]"){
                var table = $('#catalogo').DataTable();
                table.clear().draw();
                
            }else{
               var table = $('#catalogo').DataTable();
               table.clear().draw();
               
                for(var i=0; i<listaLibros.length; i++){
                     var disponibilidad="";
                    if(listaLibros[i].stock_final > 0){
                        disponibilidad = "Disponible";
                    }else{
                        disponibilidad = "No Disponible";
                    }
                       var fila= table
                            .row.add( [ 
                                       '<div class="box1">'+
                                        '<div class="col_1_of_single1 span_1_of_single1">'+
                                          '<div class="view1 view-fifth1">'+
                                            '<div class="top_box">'+
                                                '<h3>'+listaLibros[i].titulo+'</h3>'+
                                              '<p id="autor'+i+'" class="m_2">'+listaLibros[i].autor+'</p>'+
                                              '<a href="#">'+
                                                '<div class="grid_img">'+
                                                  '<div class="css3"><img src="/Villabook/Complementos-Compucatalogo/images/portada-libro.png" alt=""/></div>'+
                                                  '<div class="mask1">'+
                                                    '<div class="info" id="btn-solicitar">Solicitar</div>'+
                                                  '</div>'+
                                                '</div>'+
                                              '</a>'+
                                              '<div class="price">'+disponibilidad+'</div>'+
                                            '</div>'+
                                          '</div>'+
                                          '<ul class="list2" style="list-style: none;">'+
                                            '<li>'+
                                              '<img src="/Villabook/Complementos-Compucatalogo/images/plus.png" alt=""/>'+
                                              '<ul class="icon1 sub-icon1 profile_img">'+
                                                '<li><a class="active-icon c1" href="#" id="btn-solicitar">Solicitar </a>'+
                                                    '<ul class="sub-icon1 list">'+
                                                      '<li><h3>Descripción del Libro</h3><a href=""></a></li>'+
                                                      '<li><p>'+listaLibros[i].datos_publi+'</p></li>'+
                                                    '</ul>'+
                                                '</li>'+
                                              '</ul>'+
                                            '</li>'+
                                          '</ul>'+
                                          '<div class="clear"></div>'+
                                        '</div>'+
                                              '<div class="clearfix"></div>'+
                                        '</div>'
                                    ] )
                            .draw()
                            .node();   
                  $(fila).addClass('col-md-4');
                }
                
                
                
                $('#catalogo tbody').off('click', 'tr');
                
                $('#catalogo tbody').on( 'click', 'tr', function () {  
                    var num = table.row( this ).index();    
                    if(listaLibros[num].stock_final <= 0 ){
                        swal("Error","No hay unidades disponibles", "error");
                    }else{
                        swal({
                            title: "Estas seguro solicitar este libro?",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                        .then((willDelete) => {
                            if(willDelete){
                                $.ajax({
                                    type: 'POST',
                                    url: "/Villabook/PrestamoServlet",
                                    data:{
                                        op: 9,
                                        idLibro: listaLibros[num].id_libro,
                                        idEmpleado: idEmpleado,
                                        idAlumno: idAlumno,
                                        tipoPrestamo:"Presencial"
                                    },
                                    success:function(response){
                                        if(response==="1"){
                                            swal({title: "Listo", text: "Se aprobo correctamente el prestamo", icon: 
                                                "success"}).then(function(){ 
                                                   location.href="../../Villabook/Vistas/Compucatalogo/inicio.jsp";

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
                        });
                    }
                } );
            }
        }
    });
}