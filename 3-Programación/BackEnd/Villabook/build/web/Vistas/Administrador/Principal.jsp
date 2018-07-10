<%-- 
    Document   : Principal
    Created on : 10/07/2018, 12:01:03 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Villabook</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/font-awesome/css/font-awesome.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
      <!-- Theme style -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/dist/css/adminlte.min.css">
      <!-- iCheck -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/iCheck/flat/blue.css">
      <!-- Morris chart -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/morris/morris.css">
      <!-- jvectormap -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
      <!-- Date Picker -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/datepicker/datepicker3.css">
      <!-- Daterange picker -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/daterangepicker/daterangepicker-bs3.css">
      <!-- bootstrap wysihtml5 - text editor -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
      <!-- Google Font: Source Sans Pro -->
      <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/datatables/dataTables.bootstrap4.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/dist/css/estilos.css">

    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Navbar -->
           <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
             <!-- Left navbar links -->
             <ul class="navbar-nav">
               <li class="nav-item">
                 <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
               </li>
             </ul>
             <!-- Right navbar links -->
             <ul class="navbar-nav ml-auto">
               <!-- Notifications Dropdown Menu -->
                <li class="nav-item dropdown">
                 <a class="nav-link" data-toggle="dropdown" href="#">
                   <i class="fa fa-bell-o"></i>
                   <span class="badge badge-warning navbar-badge">15</span>
                 </a>
                 <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                   <span class="dropdown-item dropdown-header">15 Notifications</span>
                 </div>
               </li>
               <li class="nav-item" id="cerrarSesion">
                   <a  href="#" class="nav-link">
                       <i class="fa fa-sign-out fa-lg"></i>
                   </a>
               </li>
             </ul>
           </nav>
           <!-- /.navbar -->
           <aside class="main-sidebar sidebar-dark-primary elevation-4">
           <!-- Brand Logo -->
           <a href="#" class="brand-link logo-aplicacion" style="text-align: center">
             <span class="brand-text font-weight-light"><b>Villabook</b></span>
           </a>

           <!-- Sidebar -->
           <div class="sidebar">
             <!-- Sidebar user panel (optional) -->
             <div class="">
               <div class="image">
                 <img src="<%=request.getContextPath()%>/Complementos/dist/img/user2-160x160.png" alt="User Image">
               </div>
               <div class="info">
                 <a href="#" class="d-block">Administrador</a>
               </div>
             </div>

             <!-- Sidebar Menu -->
             <nav class="mt-2">
               <ul class="nav nav-pills nav-sidebar flex-column menu-sidebar" data-widget="treeview" role="menu" data-accordion="false">
                 <!-- Add icons to the links using the .nav-icon class
                      with font-awesome or any other icon font library -->
                 <li class="nav-item">
                   <a href="#" class="nav-link " id="btn-inicio">
                     <i class="nav-icon fa fas fa-home"></i>
                     <p>
                       INICIO
                     </p>
                   </a>
                 </li>
                  <li class="nav-item">
                   <a href="#" class="nav-link" id="btn-libros">
                     <i class="nav-icon fa fa-book"></i>
                     <p>
                       LIBROS
                     </p>
                   </a>
                 </li>
                 <li class="nav-item has-treeview">
                   <a href="#" class="nav-link">
                     <i class="nav-icon fa fa-truck"></i>
                     <p>
                       ENTREGAS
                       <i class="right fa fa-angle-left"></i>
                     </p>
                   </a>
                   <ul class="nav nav-treeview">
                     <li class="nav-item">
                       <a href="entregas-pendientes.html" class="nav-link">
                         <i class="fa fa-circle-o nav-icon"></i>
                         <p>Pendientes</p>
                       </a>
                     </li>
                     <li class="nav-item">
                       <a href="entregas-noAprobadas.html" class="nav-link">
                         <i class="fa fa-circle-o nav-icon"></i>
                         <p>No Aprobadas</p>
                       </a>
                     </li>
                     <li class="nav-item">
                       <a href="entregas-aprobadas.html" class="nav-link">
                         <i class="fa fa-circle-o nav-icon"></i>
                         <p>Aprobadas</p>
                       </a>
                     </li>
                   </ul>
                 </li>
                 <li class="nav-item has-treeview">
                   <a href="#" class="nav-link">
                     <i class="nav-icon fa fa-archive"></i>
                     <p>
                       DEVOLUCIONES
                       <i class="right fa fa-angle-left"></i>
                     </p>
                   </a>
                   <ul class="nav nav-treeview">
                     <li class="nav-item">
                       <a href="devoluciones-pendientes.html" class="nav-link">
                         <i class="fa fa-circle-o nav-icon"></i>
                         <p>Pendientes</p>
                       </a>
                     </li>
                     <li class="nav-item">
                       <a href="devoluciones-aprobadas.html" class="nav-link">
                         <i class="fa fa-circle-o nav-icon"></i>
                         <p>Aprobadas</p>
                       </a>
                     </li>
                   </ul>
                 </li>

               </ul>
             </nav>
             <!-- /.sidebar-menu -->
           </div>
           <!-- /.sidebar -->
         </aside>
         <div class="content-wrapper" id="contenedor-pagina">
               <%@include file="Libros/libros.jsp" %>
         </div>

          <footer class="main-footer">
           <strong>Copyright &copy; 2014-2018 <a href="#">AdminLTE.io</a>.</strong>
           Modificado por Diego
           <div class="float-right d-none d-sm-inline-block">
             <b>Version</b> 1.0.0
           </div>
         </footer>
      </div>
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

         <script src="<%=request.getContextPath()%>/Complementos/js/funciones.js"></script>
         <script>
             $(document).ready(function(){
                 $('#btn-inicio').click(function(){
                      cambiarPagina('<%=request.getContextPath()%>','AdministradorServlet','?op=1','contenedor-pagina','GET');
                 });
                 $('#btn-libros').click(function(){
                      cambiarPagina('<%=request.getContextPath()%>','AdministradorServlet','?op=2','contenedor-pagina','GET');
                 });
             });
         </script>
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
