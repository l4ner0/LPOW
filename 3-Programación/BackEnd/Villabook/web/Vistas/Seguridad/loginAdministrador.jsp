<%-- 
    Document   : loginAdministrador
    Created on : 05-jul-2018, 11:53:32
    Author     : Diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Login</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Pace -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/pace/pace-theme-minimal.css">
  <script src="<%=request.getContextPath()%>/Complementos/plugins/pace/pace.min.js"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/dist/css/adminlte.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/plugins/iCheck/square/blue.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos/dist/css/estilos-login.css">
</head>
<body class="hold-transition">
<div class="login-box contenedor-login">
  <!-- /.login-logo -->
  <div class="card contenedor-login">
   <div class="login-logo">
    <img src="<%=request.getContextPath()%>/Complementos/dist/img/usuario-login.png" alt="" width=150>
  </div>
    <div class="card-body login-card-body">
      <p class="login-box-msg">Ingresa  tus credenciales</p>
      <form name="form">
        <div class="form-group has-feedback">
            <input type="email" class="form-control" placeholder="Correo Institucional" id="loginEmail" name="loginEmail">
          <i class="fa fa-envelope form-control-feedback"></i>
        </div>
        <br>
        <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Contraseña" id="loginPassword" name="loginPassword">
          <i class="fa fa-lock form-control-feedback"></i>
        </div>
        <br>
        <div class="row">
          <div class="col-8">
            <div class="checkbox icheck">
              <label>
                <input type="checkbox"> Recordarme
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
              <button class="btn btn-block btn-flat btn-ingresar" id="btn-ingresar">Ingresar</button>
          </div>
          <br>
          <!-- /.col -->
        </div>
      </form>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/Complementos/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/Complementos/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- iCheck -->
<script src="<%=request.getContextPath()%>/Complementos/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass   : 'iradio_square-blue',
      increaseArea : '20%' // optional
    })
  })
</script>
<script src="<%=request.getContextPath()%>/Complementos/js/funciones.js"></script>
<script>
    $(document).ready(function(){
        $('#btn-ingresar').click(function(){
            funcionLogin('<%=request.getContextPath()%>','AdministradorServlet','?op=8');
        });
    });
</script>
</body>
</html>
