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
            <a href="inicio.html" class="nav-link active">
              <i class="nav-icon fa fas fa-home"></i>
              <p>
                INICIO
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="libros.html" class="nav-link">
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