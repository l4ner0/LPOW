<%-- 
    Document   : libros
    Created on : 07-jul-2018, 9:16:45
    Author     : LCI2-07
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%@ include file="Estructura/head.jsp" %>
   <body class="hold-transition sidebar-mini">
        <div class="wrapper">

          <!-- Navbar -->
           <%@ include file="Estructura/header.jsp" %>
          <!-- /.navbar -->
            <!-- Main Sidebar Container -->
            <%@ include file="Estructura/sidebar.jsp" %> 
        
          <!-- Content Wrapper. Contains page content -->
          <div class="content-wrapper">
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
                                 <h2>Catálogos de Libros</h2>
                                 <div class="card-tools btn-nuevoLibro">
                                      <button type="button" class="btn btn-primary" title="Añadir Libro" data-toggle="modal" data-target="#añadirLibro"><i class="fa fa-plus"></i> Libro</button>
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
                                                <option>Ingeniería de Sistemas</option>
                                                <option>Ingeniería Industrial</option>
                                                <option>Ingeniería de Transportes</option>
                                                <option>Ingeniería Agroindustrial</option>
                                              </select>
                                            </div>
                                          </div>
                                          <div class="col-md-3">
                                            <div class="form-group">
                                              <label>Buscar por:</label>
                                              <select class="form-control form-control-sm" style="width: 100%;">
                                                <option selected="selected">....</option>
                                                <option>Autor</option>
                                                <option>Título</option>
                                              </select>
                                            </div>
                                          </div>
                                          <div class="col-md-4">
                                              <div class="form-group">
                                                  <label>Palabras de búsqueda</label>
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
                                                            <th>Título</th>
                                                            <th>ISBN</th>
                                                            <th>Datos de Publicación</th>
                                                            <th>Carrera</th>
                                                            <th>Portada</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="tr-shadow">
                                                            <td>Lori Lynch</td>
                                                            <td>
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
                                                                Administración de Ingeniería de Sistemas
                                                            </td>
                                                            <td>968-18-4527-7</td>
                                                            <td>México D.F Megabyte 1993</td>
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
          </div>
          <!-- Modals -->
           <!-- Modal Añadir Libro -->
            <div class="modal fade" id="añadirLibro" role="dialog" aria-labelledby="añadirLibroLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="añadirLibroLabel">Añadir Libro</h5>
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
                                            <option value="">Ingeniería de Sistemas</option>
                                            <option value="">Ingeniería Industrial</option>
                                            <option value="">Ingeniería de Transportes</option>
                                            <option value="">Ingeniería de Agroindustrial</option>
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
                                        <button class="btn btn-primary btn-agregar-autor" data-toggle="modal" data-target="#añadirAutor"><li class="fa fa-plus"></li> </button>
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
                                        <label for="">Título :</label>
                                        <input type="text" class="form-control form-control-sm">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Datos de Publicación :</label>
                                        <textarea class="form-control form-control-sm" name="" id="" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Tipo Documento : </label>
                                        <select name="" id="" class="form-control form-control-sm">
                                            <option value="">......</option>
                                            <option value="">Libro</option>
                                            <option value="">Monografía</option>
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
                                            <option value="">Ingeniería de Sistemas</option>
                                            <option value="">Ingeniería Industrial</option>
                                            <option value="">Ingeniería de Transportes</option>
                                            <option value="">Ingeniería de Agroindustrial</option>
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
                                        <button class="btn btn-primary btn-agregar-autor" data-toggle="modal" data-target="#añadirAutor"><li class="fa fa-plus"></li> </button>
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
                                        <label for="">Título :</label>
                                        <input type="text" class="form-control form-control-sm">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Datos de Publicación :</label>
                                        <textarea class="form-control form-control-sm" name="" id="" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Tipo Documento : </label>
                                        <select name="" id="" class="form-control form-control-sm">
                                            <option value="">......</option>
                                            <option value="">Libro</option>
                                            <option value="">Monografía</option>
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
             <!-- Modal Añadir Autor -->
            <div class="modal fade" id="añadirAutor" tabindex="-1" role="dialog" aria-labelledby="añadirAutorLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="añadirLibroLabel">Añadir Autor</h5>
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
                                        <label for="">Datos de Publicación :</label>
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


          <!-- /.content-wrapper -->
          <%@ include file="Estructura/footer.jsp" %> 

        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
          $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Morris.js charts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="<%=request.getContextPath()%>/Complementos/plugins/morris/morris.min.js"></script>
        <!-- Sparkline -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/sparkline/jquery.sparkline.min.js"></script>
        <!-- jvectormap -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="<%=request.getContextPath()%>/Complementos/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/knob/jquery.knob.js"></script>
        <!-- daterangepicker -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
        <script src="<%=request.getContextPath()%>/Complementos/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- datepicker -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/datepicker/bootstrap-datepicker.js"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <!-- Slimscroll -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="<%=request.getContextPath()%>/Complementos/plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="<%=request.getContextPath()%>/Complementos/dist/js/adminlte.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="<%=request.getContextPath()%>/Complementos/dist/js/pages/dashboard.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="<%=request.getContextPath()%>/Complementos/dist/js/demo.js"></script>
        <script src="<%=request.getContextPath()%>/Complementos/plugins/datatables/jquery.dataTables.js"></script>
        <script src="<%=request.getContextPath()%>/Complementos/plugins/datatables/dataTables.bootstrap4.js"></script>
        <script src="<%=request.getContextPath()%>/Complementos/plugins/select2/select2.full.min.js"></script>
        <!--
        <script>
            $(document).ready(function(){
               $('.select2').select2(); 
            });
        </script>
        -->
        <script>
            $(document).ready(function() {
                    $('#tabla-libros').DataTable( {
                        "searching": false,
                        "lengthMenu":[[5,10,15,-1],[5,10,15,"Todos"]],
                        "language": {
                            "sProcessing":     "Procesando...",
                            "sLengthMenu":     "Mostrar _MENU_ registros",
                            "sZeroRecords":    "No se encontraron resultados",
                            "sEmptyTable":     "Ningún dato disponible en esta tabla",
                            "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                            "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                            "sInfoPostFix":    "",
                            "sSearch":         "Buscar:",
                            "sUrl":            "",
                            "sInfoThousands":  ",",
                            "sLoadingRecords": "Cargando...",
                            "oPaginate": {
                                "sFirst":    "Primero",
                                "sLast":     "Último",
                                "sNext":     "Siguiente",
                                "sPrevious": "Anterior"
                            },
                            "oAria": {
                                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                            }
                        }
                    } );
                } );
        </script>
    </body>
</html>
