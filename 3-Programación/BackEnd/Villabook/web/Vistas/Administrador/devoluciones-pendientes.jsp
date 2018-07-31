<%@page import="java.util.ArrayList"%>
<%@page import="Bean.devolucionBean"%>
<%@page import="DAO.devolucionDAO"%>
<%!
    ArrayList<devolucionBean> listaDevoluciones;
%>
<%
    listaDevoluciones=(ArrayList<devolucionBean>)request.getAttribute("listaDevolucionesPendientes");
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
            <h1 class="m-0 text-dark">Pendientes</h1>
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
                                <h3>Devoluciones Pendientes</h3>
                             </div>
                             <div class="form-group">
                                <div class="input-group buscar-pendientes">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text icono-bucar-pendiente"><i class="fa fa-address-card-o"></i></span>
                                    </div>
                                    <input type="text" class="form-control " id="txtCodDevoPend" placeholder="Codigo de alumno">
                                </div>
                             </div>
                             <div class="btn-buscar-pendiente">
                                 <button class="btn btn-primary " id="btn-alumnoDevoPend"><i class="fa fa-search"></i> Buscar</button> 
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
                                                    <th>N°</th>
                                                    <th>Alumno</th>
                                                    <th>Código</th>
                                                    <th>ISBN</th>
                                                    <th>Titulo del libro</th>
                                                    <th>Autor</th>
                                                    <th>Hora</th>
                                                    <th>Fecha</th>
                                                    <th>Origen</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <% int i=1; for(devolucionBean objDevolucionBean:listaDevoluciones){ %>
                                                <tr class="tr-shadow">
                                                    <td><%=i++%></td>
                                                    <td><%=objDevolucionBean.getApAlumno()+" "+objDevolucionBean.getAmAlumno()%></td>
                                                    <td>
                                                        <%=objDevolucionBean.getCodAlumno()%>
                                                    </td>
                                                    <td><%=objDevolucionBean.getIsbn()%></td>
                                                    <td><%=objDevolucionBean.getTitulo()%></td>
                                                    <td><%=objDevolucionBean.getApellidosAutor()+" "+objDevolucionBean.getNombresAutor()%></td>
                                                    <td><%=objDevolucionBean.getHora_devolucion()%></td>
                                                    <td><%=objDevolucionBean.getFecha_devolucion()%></td>
                                                    <td><%=objDevolucionBean.getTipoPrestamo()%></td>
                                                    <td>
                                                        <div class="table-data-feature btn-entregas-pendientes">
                                                            <button class="item btn-tabla-editar" onclick="funcionVerAprobarDevolucion('<%=request.getContextPath()%>','DevolucionServlet','2','<%=objDevolucionBean.getId_devolucion()%>')"  data-placement="top" title="Aprobar"  data-toggle="modal" data-target="#aprobarEntrega">
                                                                <i class="fa fa-check"></i>
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
     <!-- Modal Aprobar Devolución -->
    <div class="modal fade" id="aprobarEntrega" role="dialog" aria-labelledby="aprobarEntregaoLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="aprobarEntregaoLabel">Aprobar Devolución 000-<p id="aprobarDevolucionId" style="display: inline-block;"></p></h5>
               
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                   <div class="row">
                       <div class="col-md-6 modal-entrega-aprobar-alumno">
                            <div class="modal-entrega-aprobar-titulo">
                                <h4>Alumno</h4>
                            </div>
                            <div class="modal-entrega-aprobar-fotoAlu">
                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/foto-alumno.png" alt="" width="150">
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="">Apellidos: </label>
                                    <p id="aprobarDevolucionApellidos"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Nombres: </label>
                                    <p id="aprobarDevolucionNombres"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Código: </label>
                                    <p id="aprobarDevolucionCodigo"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Carrera: </label>
                                    <p id="aprobarDevolucionCarrera"></p>
                                </div>
                            </div>
                       </div>
                       <div class="col-md-6 modal-entrega-aprobar-libro">
                            <div class="modal-entrega-aprobar-titulo">
                                <h4>Libro</h4>
                            </div>
                            <div class="modal-entrega-aprobar-fotoLibro">
                                <img src="<%=request.getContextPath()%>/Complementos/dist/img/portada-libro.png" alt="" width="150">
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label >ISBN: </label>
                                    <p id="aprobarDevolucionISBN"></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="">Autor: </label>
                                    <p id="aprobarDevolucionAutor"></p>
                                </div>
                                <div class="col-md-12">
                                    <label for="">Título: </label>
                                    <p id="aprobarDevolucionTitulo"></p>
                                </div>
                            </div>  
                       </div>
                       <div class="col-md-12 modal-entrega-aprobar-datos">
                           <fieldset>
                               <legend>Datos Devolución</legend>
                               <div class="row">
                                   <div class="col-md-4">
                                       <label for="">Hora: </label>
                                       <p id="aprobarDevolucionHora" style="display: inline-block;"></p>
                                   </div>
                                   <div class="col-md-5">
                                       <label for="">Fecha: </label>
                                       <p id="aprobarDevolucionFecha" style="display: inline-block;"></p>
                                   </div>
                                   <div class="col-md-3">
                                       <label for="">Origen: </label>
                                       <p id="aprobarPrestamoOrigen" style="display: inline-block;"></p>
                                   </div>
                               </div>
                           </fieldset>
                       </div>
                   </div>
                    
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>
                <button type="button" class="btn btn-primary"id="btn-aprobarDevolucion" ><i class="fa fa-check"></i> Aprobar</button>
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
<script src="<%=request.getContextPath()%>/Complementos/js/Devolucion.js"  type="text/javascript"></script>
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
        table.buttons().container()
        .appendTo( '#tabla-entregas-pendientes_wrapper .col-sm-6:eq(0)' );


        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
        
        $( "#filtro-fecha" ).datepicker();
        
        $("#btn-aprobarDevolucion").click(function(){
            var idDevolucion = $("#aprobarDevolucionId").text();
            funcionAprobarDevolucion('<%=request.getContextPath()%>','DevolucionServlet','1',idDevolucion);
        });
        
        $("#btn-alumnoDevoPend").click(function(){
            var codAlumno = $("#txtCodDevoPend").val();
            funcionFiltrarDevoPend('<%=request.getContextPath()%>','DevolucionServlet','3',codAlumno);
        });
    } );
</script>
</body>
</html>
