<%@page import="java.util.ArrayList"%>
<%@page import="Bean.prestamoBean"%>
<%@page import="DAO.prestamoDAO"%>
<%!
    ArrayList<prestamoBean> listaPrestamos;
%>
<%
    listaPrestamos=(ArrayList<prestamoBean>)request.getAttribute("listaEntregasNoAprobadas");
%>
<!DOCTYPE html>
<html>
<%@ include file="General/Head.jsp" %>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="General/Header.jsp" %>
    <%@ include file="General/Sidebar.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">No Aprobadas</h1>
          </div>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="content-fluid">
              <div class="row">
                 <div class="card card-default col-md-12 card-catalogo">
                    <div class="card-body">
                        <div class="herramienta-busqueda-pendiente">
                             <div class="titulo-pendiente">
                                <h3>Entregas No Aprobadas</h3>
                             </div>
                             <div class="form-group">
                                <div class="input-group buscar-pendientes">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text icono-bucar-pendiente"><i class="fa fa-address-card-o"></i></span>
                                    </div>
                                    <input id="filtroCodAlumno" type="text" class="form-control " placeholder="Codigo de alumno">
                                </div>
                             </div>
                             <div class="btn-buscar-pendiente">
                                 <button class="btn btn-primary " id="btn-filtrarNoAprobada"><i class="fa fa-search"></i> Buscar</button> 
                             </div>
                        </div>
                        <div class="tabla-entregas-pendientes">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- DATA TABLE -->
                                    <div class="table-responsive table-responsive-data2">
                                        <table class="table table-data2" id="tabla-entregas-pendientes">
                                            <thead>
                                                <tr>
                                                    <th>N�</th>
                                                    <th>Alumno</th>
                                                    <th>C�digo</th>
                                                    <th>ISBN</th>
                                                    <th>Titulo del libro</th>
                                                    <th>Autor</th>
                                                    <th>Fecha</th>
                                                    <th>Origen</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%int i=1;for(prestamoBean objPrestamoBean:listaPrestamos){%>
                                                <tr class="tr-shadow">
                                                    <td><%=i++%></td>
                                                    <td><%=objPrestamoBean.getApAlumno()+" "+objPrestamoBean.getAmAlumno()%></td>
                                                    <td>
                                                         <%=objPrestamoBean.getCodAlumno()%>
                                                    </td>
                                                    <td><%=objPrestamoBean.getIsbn()%></td>
                                                    <td><%=objPrestamoBean.getTitulo()%></td>
                                                    <td><%=objPrestamoBean.getApellidosAutor()+" "+objPrestamoBean.getNombresAutor()%></td>
                                                    <td><%=objPrestamoBean.getFecha_prestamo()%></td>
                                                    <td><%=objPrestamoBean.getTipo_prestamo()%></td>
                                                    <td>
                                                        <div class="table-data-feature btn-entregas-pendientes">
                                                            <button class="item  btn-tabla-eliminar" onclick="funcionInfoNoAprobarEntrega('<%=request.getContextPath()%>','PrestamoServlet','4','<%=objPrestamoBean.getId_prestamo()%>')" data-toggle="modal" data-placement="top" title="Informaci�n" data-target="#infoCancelado">
                                                                <i class="fa fa-info"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%}%>
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
        </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- Modal -->
     <!-- Modal Informaci�n Entrega Cancelada -->
    <div class="modal fade" id="infoCancelado" role="dialog" aria-labelledby="infoCanceladoLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="infoCanceladoLabel">Entregas No Aprobadas</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                   <div class="row">
                       <div class="col-md-12 bloque-alumno">
                            <div  class="titulo-alumno-cancelacion">
                                <h5>Alumno</h5>
                            </div>
                            <div class="row">
                               <div class="offset-1 col-md-5">
                                    <img src="<%=request.getContextPath()%>/Complementos/dist/img/foto-alumno.png" alt="" width="150">
                                </div>
                                <div class="offset-1 col-md-5  datos-alumno-info-cancelada">
                                    <div>
                                        <label for="">Apellidos: </label>
                                        <p id="noAprobadaApAlumno" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">Nombres: </label>
                                        <p id="noAprobadaNombAl" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">C�digo: </label>
                                        <p id="noAprobadaCod" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">Carrera: </label>
                                        <p id="noAprobadaEscuela" style="display: inline-block;"></p>
                                    </div>
                                </div>
                            </div>   
                       </div>
                       <div class="col-md-12 bloque-libros">
                            <div class="titulo-libro-cancelacion">
                                <h5>Libro</h5>
                            </div>
                            <div class="row">
                                <div class="offset-1 col-md-5">
                                    <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="150">
                                </div>
                                <div class="offset-1 col-md-5">
                                    <div>
                                        <label for="">ISBN: </label>
                                        <p id="noAprobarISBN" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">Autor: </label>
                                        <p id="noAprobarAutor" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">T�tulo: </label>
                                        <p id="noAprobarTitulo" style="display: inline-block;"></p>
                                    </div>
                                </div>  
                            </div>
                       </div>
                       <div class="col-md-12 bloque-alumno">
                            <div  class="titulo-alumno-cancelacion">
                                <h5>Encargado</h5>
                            </div>
                            <div class="row">
                               <div class="offset-1 col-md-5">
                                    <img src="<%=request.getContextPath()%>/Complementos/dist/img/user2-160x160.png" alt="" width="150">
                                </div>
                                <div class="offset-1 col-md-5  datos-alumno-info-cancelada">
                                    <div>
                                        <label for="">Apellidos: </label>
                                        <p id="noAprobarApEmp" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">Nombres: </label>
                                        <p id="noAprobarNombEmp" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">Motivo: </label>
                                        <p id="noAprobarMotivoEmp" style="display: inline-block;"></p>
                                    </div>
                                </div>
                            </div>   
                       </div>
                       <div class="col-md-12 bloque-datos-cancelacion">
                           <div  class="titulo-datos-cancelacion">
                                <h5>Datos Entrega</h5>
                           </div>
                            <div class="row">
                               <div class="offset-1 col-md-5">
                                   <div class="col-md-5">
                                    <img src="<%=request.getContextPath()%>/Complementos/dist/img/img_datos_entrega.png" alt="" width="150">
                                </div>
                               </div>
                               <div class="offset-1 col-md-5">
                                   <div>
                                        <label for="">Hora: </label>
                                        <p id="noAprobarHora" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">Fecha: </label>
                                        <p id="noAprobarFecha" style="display: inline-block;"></p>
                                    </div>
                                    <div>
                                        <label for="">Origen: </label>
                                        <p id="noAprobarOrigen" style="display: inline-block;"></p>
                                    </div>
                               </div>
                            </div>
                       </div>
                   </div>
                    
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-sign-out"></i> Salir</button>
                <button type="button" class="btn btn-light"><i class="fa fa-print"></i> Reporte</button>
                </div>
            </div>
        </div>
    </div>
    
  
  <!-- /.content-wrapper -->
    <%@include file="General/Footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->

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
<script src="<%=request.getContextPath()%>/Complementos/plugins/iCheck/icheck.min.js"></script>
<script src="<%=request.getContextPath()%>/Complementos/js/Prestamo.js"  type="text/javascript"></script>
<!-- Datatable -->
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
<script>
    $(document).ready(function() {
            var table = $('#tabla-entregas-pendientes').DataTable( {
            dom: 'Bfrtip',
            buttons: [
               {
                     text: "<i class='fa fa-refresh'></i>",
                     titleAttr: "Actualizar",
                     action: function(){
                         location.reload();
                     }
                },
                'excel', 'pdf', 'print'
            ],
            "lengthMenu":[[5,10,15,-1],[5,10,15,"Todos"]],
            "language": {
                    "sProcessing":     "Procesando...",
                    "sLengthMenu":     "Mostrar _MENU_ registros",
                    "sZeroRecords":    "No se encontraron resultados",
                    "sEmptyTable":     "Ning�n dato disponible en esta tabla",
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
                        "sLast":     "�ltimo",
                        "sNext":     "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
            }
        } );
        table.buttons().container()
        .appendTo( '#tabla-entregas-pendientes_wrapper .col-sm-6:eq(0)' );
        
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
        
        $( "#filtro-fecha" ).datepicker();
        
        $("#btn-filtrarNoAprobada").click(function(){
            var codAlumno=$('#filtroCodAlumno').val();
            funcionFiltrarNoAprobada('<%=request.getContextPath()%>','PrestamoServlet','6',codAlumno);
        });
    } );
</script>
</body>
</html>
