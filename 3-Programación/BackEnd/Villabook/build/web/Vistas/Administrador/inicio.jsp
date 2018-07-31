<%@page session="true" %>
<% 

    
if(  session.getAttribute("idEmpleado") ==null)
  {
      response.sendRedirect(request.getContextPath()+"/Vistas/Seguridad/loginAdministrador.jsp");


   }

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
            <h1 class="m-0 text-dark">Inicio</h1>
          </div>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                  <h3><%= request.getAttribute("numEstudiantes") %></h3>

                <p>Estudiantes Registrados</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a class="small-box-footer">UNFV <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3><%= request.getAttribute("numPrestamosPendientes") %></h3>

                <p>Entregas Pendientes</p>
              </div>
              <div class="icon">
                <i class="fa fa-clock-o"></i>
              </div>
                <a href="#" class="small-box-footer" id="a-entregasPendientes">UNFV <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3><%= request.getAttribute("numLibros") %></h3>

                <p>Libros</p>
              </div>
              <div class="icon">
                <i class="fa fa-book"></i>
              </div>
              <a href="#" id="a-libros" class="small-box-footer">UNFV <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3><%= request.getAttribute("numDevolucionesPendientes") %></h3>

                <p>Devoluciones Pendientes</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" id="a-devolucionesPendientes" class="small-box-footer">UNFV <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
        <br>
        <div class="row">
          <!-- Left col -->
          <section class="col-lg-7 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card"> 
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3">
                  <i class="fa fa-pie-chart mr-1"></i>
                  Seguimiento de Entregas
                </h3>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div id="area-example"
                       style="position: relative; height: 340px;"></div>
                </div>
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </section>
          <!-- /.Left col -->
          <section class="col-lg-5 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            <div class="card"> 
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3">
                  <i class="fa fa-pie-chart mr-1"></i>
                  Entregas
                </h3>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div id="donut-example"
                       style="position: relative; height: 340px;"></div>
                </div>
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </section>
          <!-- right col (We are only adding the ID to make the widgets sortable)-->
          <section class="col-lg-12 connectedSortable">
            <!-- Calendar -->
            <div class="card bg-success-gradient">
              <div class="card-header no-border">

                <h3 class="card-title">
                  <i class="fa fa-calendar"></i>
                  Calendario
                </h3>
                <!-- tools card -->
                <div class="card-tools">
                  <!-- button with a dropdown -->
                  <div class="btn-group">
                    <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-bars"></i></button>
                    <div class="dropdown-menu float-right" role="menu">
                      <a href="#" class="dropdown-item">Add new event</a>
                      <a href="#" class="dropdown-item">Clear events</a>
                      <div class="dropdown-divider"></div>
                      <a href="#" class="dropdown-item">View calendar</a>
                    </div>
                  </div>
                </div>
                <!-- /. tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <!--The calendar -->
                <div id="calendar" style="width: 100%"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </section>
          <!-- right col -->
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
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
<script>
    $(document).ready(function(){
        Morris.Donut({
        element: 'donut-example',
        data: [
          {label: "Presencial", value: 12},
          {label: "Virtual", value: 30},
        ]
      });
      
    var months = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"];

    Morris.Area({
      element: 'area-example',
      data: [{
        m: '2015-03',
        a: 3,
        b: 5
      }, {
        m: '2015-04',
        a: 2,
        b: 3
      }, {
        m: '2015-05',
        a: 5,
        b: 8
      }, {
        m: '2015-06',
        a: 3,
        b: 1
      }, {
        m: '2015-07',
        a: 7,
        b: 9
      }, {
        m: '2015-08',
        a: 12,
        b: 4
      }, {
        m: '2015-09',
        a: 7,
        b: 6
      }, {
        m: '2015-10',
        a: 8,
        b: 2
      }, {
        m: '2015-11',
        a: 12,
        b: 2
      }, {
        m: '2015-12',
        a: 5,
        b: 2
      }, ],
      xkey: 'm',
      ykeys: ['a', 'b'],
      labels: ['Presencial', 'Virtual'],
      xLabelFormat: function(x) { // <--- x.getMonth() returns valid index
        var month = months[x.getMonth()];
        return month;
      },
      dateFormat: function(x) {
        var month = months[new Date(x).getMonth()];
        return month;
      },
    });
    });
</script>
</body>
</html>

