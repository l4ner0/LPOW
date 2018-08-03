<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Villabook</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/font-awesome.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/adminlte.min.css">
  
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/estilos-login.css">
</head>
<body class="hold-transition">
<div class="login-box contenedor-login">
  <!-- /.login-logo -->
  <div class=" contenedor-login">
      <div class="titulo-compucatalogo">
          <h1>Compucatalogo N°1</h1>
      </div>
   <div class="login-logo">
    <img src="<%=request.getContextPath()%>/Complementos-Compucatalogo/images/login-carnet.gif" alt="" width=300>
  </div>
    <div class="card-body login-card-body">
     <br>

     <form name="form" method="POST" action="javascript:funcionEntrar('<%=request.getContextPath()%>','CompucatalogoServlet','?op=1')">
         <input type="hidden" name="codAlumno" value="">
        <div class="form-group">
            <div class="input-group buscar-pendientes">
                <div class="input-group-prepend">
                    <span class="input-group-text icono-bucar-pendiente"><i class="fa fa-user"></i></span>
                </div>
                <input type="text" id="txtCodAlumno" class="form-control form-control-lg" placeholder="Codigo de alumno" autocomplete="off">
            </div>
        </div>
        <div class="row btn-entrar">
          <!-- /.col -->
          <div class=" col-12">
              <button type="button" class="btn btn-block btn-flat btn-ingresar"  id="btn-ingresar">Ingresar</button>
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
<script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/js/Alumno.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/js/Funciones.js" type="text/javascript"></script>
<script>
    $(document).ready(function(){
        $('#btn-ingresar').click(function(){
            funcionEntrar('<%=request.getContextPath()%>','CompucatalogoServlet','?op=1');
        });
    });
</script>
</body>
</html>
