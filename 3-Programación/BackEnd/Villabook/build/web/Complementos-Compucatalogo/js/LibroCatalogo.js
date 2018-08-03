function LibroCatalogo(ruta, controlador, op){
    this.ruta = ruta;
    this.controlador = controlador;
    this.op = op;
}

LibroCatalogo.prototype.filtrarLibroTipoDocumento = function(tipoDocumento){
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
                       var fila= table
                            .row.add( [ 
                                       '<div class="box1">'+
                                        '<div class="col_1_of_single1 span_1_of_single1">'+
                                          '<div class="view1 view-fifth1">'+
                                            '<div class="top_box">'+
                                                '<h3 class="m_1">'+listaLibros[i].titulo+'</h3>'+
                                              '<p id="autor'+i+'" class="m_2">'+listaLibros[i].autor+'</p>'+
                                              '<a href="#">'+
                                                '<div class="grid_img">'+
                                                  '<div class="css3"><img src="/Villabook/Complementos-Compucatalogo/images/portada-libro.png" alt=""/></div>'+
                                                  '<div class="mask1">'+
                                                    '<div class="info" id="btn-solicitar">Solicitar</div>'+
                                                  '</div>'+
                                                '</div>'+
                                              '</a>'+
                                              '<div class="price">Disponible</div>'+
                                            '</div>'+
                                          '</div>'+
                                          '<ul class="list2" style="list-style: none;">'+
                                            '<li>'+
                                              '<img src="/Villabook/Complementos-Compucatalogo/images/plus.png" alt=""/>'+
                                              '<ul class="icon1 sub-icon1 profile_img">'+
                                                '<li><a class="active-icon c1" href="#" id="btn-solicitar">Solicitar </a>'+
                                                    '<ul class="sub-icon1 list">'+
                                                      '<li><h3>Descripción del Libro</h3><a href=""></a></li>'+
                                                      '<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>'+
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
                     alert( "Le diste al libro: "+listaLibros[num].titulo );
                    
                } );
            }
        }
    });
}

LibroCatalogo.prototype.filtrarLibroEscuela= function(idEscuela){
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
                       var fila= table
                            .row.add( [ 
                                       '<div class="box1">'+
                                        '<div class="col_1_of_single1 span_1_of_single1">'+
                                          '<div class="view1 view-fifth1">'+
                                            '<div class="top_box">'+
                                                '<h3 class="m_1">'+listaLibros[i].titulo+'</h3>'+
                                              '<p class="m_2">'+listaLibros[i].autor+'</p>'+
                                              '<a href="#">'+
                                                '<div class="grid_img">'+
                                                  '<div class="css3"><img src="/Villabook/Complementos-Compucatalogo/images/portada-libro.png" alt=""/></div>'+
                                                  '<div class="mask1">'+
                                                    '<div class="info" id="btn-solicitar">Solicitar</div>'+
                                                  '</div>'+
                                                '</div>'+
                                              '</a>'+
                                              '<div class="price">Disponible</div>'+
                                            '</div>'+
                                          '</div>'+
                                          '<ul class="list2" style="list-style: none;">'+
                                            '<li>'+
                                              '<img src="/Villabook/Complementos-Compucatalogo/images/plus.png" alt=""/>'+
                                              '<ul class="icon1 sub-icon1 profile_img">'+
                                                '<li><a class="active-icon c1" href="#" id="btn-solicitar">Solicitar </a>'+
                                                    '<ul class="sub-icon1 list">'+
                                                      '<li><h3>Descripción del Libro</h3><a href=""></a></li>'+
                                                      '<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>'+
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
                     alert( "Le diste al libro: "+listaLibros[num].titulo );
                    
                } );
            }
        }
    });
}

