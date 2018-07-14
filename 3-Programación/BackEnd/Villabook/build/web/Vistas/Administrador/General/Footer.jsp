  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2018 <a href="#">AdminLTE.io</a>.</strong>
    Modificado por Diego
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 1.0.0
    </div>
  </footer>
<script>
    $(document).ready(function(){
        $('#btn-inicio').click(function(){
            cambiarPagina("<%=request.getContextPath()%>","AdministradorServlet","?op=1");
        });
        $('#btn-libros').click(function(){
            cambiarPagina("<%=request.getContextPath()%>","AdministradorServlet","?op=2");
        });
        $('#btn-entregasPendientes').click(function(){
            cambiarPagina("<%=request.getContextPath()%>","AdministradorServlet","?op=3");
        });
        $('#btn-entregasNoAprobadas').click(function(){
            cambiarPagina("<%=request.getContextPath()%>","AdministradorServlet","?op=4");
        });
        $('#btn-entregasAprobadas').click(function(){
            cambiarPagina("<%=request.getContextPath()%>","AdministradorServlet","?op=5");
        });
        $('#btn-devolucionesPendientes').click(function(){
            cambiarPagina("<%=request.getContextPath()%>","AdministradorServlet","?op=6");
        });
        $('#btn-devolucionesAprobadas').click(function(){
            cambiarPagina("<%=request.getContextPath()%>","AdministradorServlet","?op=7");
        });
    });
</script>