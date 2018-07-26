<%@page import="java.util.ArrayList"%>
<%@page import="Bean.prestamoBean"%>
<%@page import="DAO.prestamoDAO"%>
<%!
    ArrayList<prestamoBean> listaPrestamos;
%>
<%
    listaPrestamos=(ArrayList<prestamoBean>)request.getAttribute("listaEntregasAprobadas");
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
            <h1 class="m-0 text-dark">Entregas Aprobadas</h1>
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
                        <div class="herramientas-filtro">
                             <div class="row">
                               <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="">Condición de Entrega</label>
                                         <select name="" id="filtro-origen" class="form-control form-control-sm">
                                             <option value="">No entregados</option>
                                             <option value="">Entregados</option>
                                             <option value="">Todos</option>
                                         </select>
                                     </div>    
                               </div>
                                <div class="col-md-1">
                                    <button class="btn btn-secondary btn-sm">Filtrar</button>
                                </div>
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
                                                    <th>Alumno</th>
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
                                                <% for(prestamoBean objPrestamoBean:listaPrestamos){ %>
                                                <tr class="tr-shadow">
                                                    <td>
                                                         <%=objPrestamoBean.getCodAlumno()%>
                                                    </td>
                                                    <td><%=objPrestamoBean.getIsbn()%></td>
                                                    <td><%=objPrestamoBean.getTitulo()%></td>
                                                    <td><%=objPrestamoBean.getApellidosAutor()+" "+objPrestamoBean.getNombresAutor()%></td>
                                                    <td><%=objPrestamoBean.getHora_prestamo()%></td>
                                                    <td><%=objPrestamoBean.getFecha_prestamo()%></td>
                                                    <td><%=objPrestamoBean.getTipo_prestamo()%></td>
                                                    <td>
                                                        <div class="table-data-feature btn-entregas-pendientes">
                                                            <button class="item btn-tabla-editar"  data-placement="top" title="Entregar"  data-toggle="modal" data-target="#aprobarEntrega">
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

  
  <!-- /.content-wrapper -->
  <%@include file="General/Footer.jsp" %> %>
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
<script>
    $(document).ready(function() {
            $('#tabla-entregas-pendientes').DataTable( {
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
        
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
        
        $( "#filtro-fecha" ).datepicker();
    } );
</script>
</body>
</html>
