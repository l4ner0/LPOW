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
          <%if(request.getAttribute("numPrestamosPendientes") != null && (Integer)request.getAttribute("numPrestamosPendientes") > 0){%><span class="badge badge-warning navbar-badge"><%= request.getAttribute("numPrestamosPendientes") %></span><%}%>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">Notificaciones <%= request.getAttribute("numPrestamosPendientes") %></span>
        </div>
      </li>
      <li class="nav-item" >
          <a href="#" class="nav-link" id="btn-logout">
              <i class="fa fa-sign-out fa-lg"></i>
          </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->
