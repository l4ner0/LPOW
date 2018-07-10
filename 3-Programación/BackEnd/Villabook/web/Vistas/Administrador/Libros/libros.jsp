
            <!-- Content Header (Page header) -->
            <div class="content-header">
              <div class="container-fluid">
                <div class="row mb-2">
                  <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Libros</h1>
                  </div>
                </div><!-- /.row -->
              </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
              <div class="container-fluid">
                  <div class="row">
                         <div class="card card-default col-md-12 card-catalogo">
                             <div class="card-header">
                                 <h2>Cat�logos de Libros</h2>
                                 <div class="card-tools btn-nuevoLibro">
                                      <button type="button" class="btn btn-primary" title="A�adir Libro" data-toggle="modal" data-target="#a�adirLibro"><i class="fa fa-plus"></i> Libro</button>
                                 </div>
                             </div>
                             <div class="card-body">
                                 <div class="filtros-libros">
                                    <div class="row">
                                         <div class="col-md-3">
                                            <div class="form-group">
                                              <label>Carrera</label>
                                              <select class="form-control form-control-sm">
                                                <option selected="selected">....</option>
                                                <option>Ingenier�a de Sistemas</option>
                                                <option>Ingenier�a Industrial</option>
                                                <option>Ingenier�a de Transportes</option>
                                                <option>Ingenier�a Agroindustrial</option>
                                              </select>
                                            </div>
                                          </div>
                                          <div class="col-md-3">
                                            <div class="form-group">
                                              <label>Buscar por:</label>
                                              <select class="form-control form-control-sm" style="width: 100%;">
                                                <option selected="selected">....</option>
                                                <option>Autor</option>
                                                <option>T�tulo</option>
                                              </select>
                                            </div>
                                          </div>
                                          <div class="col-md-4">
                                              <div class="form-group">
                                                  <label>Palabras de b�squeda</label>
                                                  <input type="text" class="form-control form-control-sm">
                                              </div>
                                          </div>
                                          <div class="col-md-2">
                                             <div class="form-group">
                                                  <button class="btn-buscar-libro"><i class="fa fa-search"></i> Buscar</button>
                                             </div>
                                          </div>
                                    </div>
                                </div>
                                <div class="tabla-libro">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- DATA TABLE -->
                                            <div class="table-responsive table-responsive-data2">
                                                <table class="table table-data2" id="tabla-libros">
                                                    <thead>
                                                        <tr>
                                                            <th>Autor</th>
                                                            <th>T�tulo</th>
                                                            <th>ISBN</th>
                                                            <th>Datos de Publicaci�n</th>
                                                            <th>Carrera</th>
                                                            <th>Portada</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administraci�n de Ingenier�a de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>M�xico D.F Megabyte 1993</td>
                                                            <td>
                                                                <span class="status--process">Sistemas</span>
                                                            </td>
                                                            <td>
                                                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="45">
                                                            </td>
                                                            <td>
                                                                <div class="table-data-feature">
                                                                    <button class="item btn-tabla-editar"  data-placement="top" title="Editar"  data-toggle="modal" data-target="#editarLibro">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <button class="item  btn-tabla-eliminar" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                                                        <i class="fa fa-trash"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- END DATA TABLE -->
                                        </div>  
                                    </div>     
                                </div>


                             </div>
                         </div>
                  </div>
              </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
          <!-- Modals -->
           <!-- Modal A�adir Libro -->
            <div class="modal fade" id="a�adirLibro" role="dialog" aria-labelledby="a�adirLibroLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="a�adirLibroLabel">A�adir Libro</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Carrera :</label>
                                        <select name="" id="" class="form-control form-control-sm">
                                            <option value="">......</option>
                                            <option value="">Ingenier�a de Sistemas</option>
                                            <option value="">Ingenier�a Industrial</option>
                                            <option value="">Ingenier�a de Transportes</option>
                                            <option value="">Ingenier�a de Agroindustrial</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">ISBN :</label>
                                        <input class="form-control form-control-sm" type="text">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Autor :</label>
                                        <button class="btn btn-primary btn-agregar-autor" data-toggle="modal" data-target="#a�adirAutor"><li class="fa fa-plus"></li> </button>
                                        <br>
                                        <select class="form-control form-control-sm" style="width:200px; ">  
                                            <option>......</option>
                                            <option>Autor 1</option>
                                            <option>Autor 2</option>
                                            <option>Autor 3</option>
                                            <option>Autor 4</option>
                                            <option>Autor 5</option>
                                            <option>Autor 6</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">T�tulo :</label>
                                        <input type="text" class="form-control form-control-sm">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Datos de Publicaci�n :</label>
                                        <textarea class="form-control form-control-sm" name="" id="" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Tipo Documento : </label>
                                        <select name="" id="" class="form-control form-control-sm">
                                            <option value="">......</option>
                                            <option value="">Libro</option>
                                            <option value="">Monograf�a</option>
                                            <option value="">Tesis</option>
                                            <option value="">Otro</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                       <label for="">Portada : </label>
                                        <input type="file" title="Portada del Libro">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>
                        <button type="button" class="btn btn-primary"><i class="fa fa-save"></i> Grabar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Editar datos del libro -->
                <div class="modal fade" id="editarLibro" role="dialog" aria-labelledby="editarLibroLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="editarLibroLabel">Editar Libro</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Carrera :</label>
                                        <select name="" id="" class="form-control form-control-sm">
                                            <option value="">......</option>
                                            <option value="">Ingenier�a de Sistemas</option>
                                            <option value="">Ingenier�a Industrial</option>
                                            <option value="">Ingenier�a de Transportes</option>
                                            <option value="">Ingenier�a de Agroindustrial</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">ISBN :</label>
                                        <input class="form-control form-control-sm" type="text">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Autor :</label>
                                        <button class="btn btn-primary btn-agregar-autor" data-toggle="modal" data-target="#a�adirAutor"><li class="fa fa-plus"></li> </button>
                                        <br>
                                        <select class="form-control form-control-sm" style="width:200px; ">  
                                            <option>......</option>
                                            <option>Autor 1</option>
                                            <option>Autor 2</option>
                                            <option>Autor 3</option>
                                            <option>Autor 4</option>
                                            <option>Autor 5</option>
                                            <option>Autor 6</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">T�tulo :</label>
                                        <input type="text" class="form-control form-control-sm">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Datos de Publicaci�n :</label>
                                        <textarea class="form-control form-control-sm" name="" id="" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Tipo Documento : </label>
                                        <select name="" id="" class="form-control form-control-sm">
                                            <option value="">......</option>
                                            <option value="">Libro</option>
                                            <option value="">Monograf�a</option>
                                            <option value="">Tesis</option>
                                            <option value="">Otro</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                       <label for="">Portada : </label>
                                        <input type="file" title="Portada del Libro">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>
                        <button type="button" class="btn btn-primary"><i class="fa fa-save"></i> Grabar</button>
                        </div>
                    </div>
                </div>
            </div>
             <!-- Modal A�adir Autor -->
            <div class="modal fade" id="a�adirAutor" tabindex="-1" role="dialog" aria-labelledby="a�adirAutorLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="a�adirLibroLabel">A�adir Autor</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Apellidos :</label>
                                        <input type="text" class="form-control form-control-sm">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Nombres :</label>
                                        <input type="text" class="form-control form-control-sm">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Datos de Publicaci�n :</label>
                                        <textarea class="form-control form-control-sm" name="" id="" rows="4"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>
                        <button type="button" class="btn btn-primary"><i class="fa fa-save"></i> Guardar</button>
                        </div>
                    </div>
                </div>
            </div>



         
