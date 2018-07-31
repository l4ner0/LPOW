<%@page import="java.util.ArrayList"%>
<%@page import="Bean.devolucionBean"%>
<%@page import="DAO.devolucionDAO"%>
<%!
    ArrayList<devolucionBean> listaDevoluciones;
%>
<%
    listaDevoluciones=(ArrayList<devolucionBean>)request.getAttribute("listaDevolucionesAprobadas");
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
            <h1 class="m-0 text-dark">Aprobadas</h1>
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
                                <h3>Devoluciones Aprobadas</h3>
                             </div>
                             <div class="form-group">
                                <div class="input-group buscar-pendientes">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text icono-bucar-pendiente"><i class="fa fa-address-card-o"></i></span>
                                    </div>
                                    <input type="text" id="txtCodDevoAprob" class="form-control " placeholder="Codigo de alumno">
                                </div>
                             </div>
                             <div class="btn-buscar-pendiente">
                                 <button class="btn btn-primary " id="btn-filtrarDevoAprob"><i class="fa fa-search"></i> Buscar</button> 
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
        
        $("#btn-filtrarDevoAprob").click(function(){
            var codAlumno = $("#txtCodDevoAprob").val();
            funcionFiltrarDevoApro('<%=request.getContextPath()%>','DevolucionServlet','4',codAlumno);
        });
        
    } );
</script>
</body>
</html>
