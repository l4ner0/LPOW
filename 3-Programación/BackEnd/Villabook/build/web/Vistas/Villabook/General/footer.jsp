<footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <ul class="list-inline text-center">
              <li class="list-inline-item">
                <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
              <li class="list-inline-item">
                  <a href="https://github.com/l4ner0/LPOW" target="_blank">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
              </li>
            </ul>
            <p class="copyright text-muted">Copyright &copy; Villabook 2018</p>
          </div>
        </div>
      </div>
</footer>
<script>
    function compuCatalogo(){
        window.open('<%=request.getContextPath()%>/Vistas/Compucatalogo/inicio.jsp','1024x768','toolbar=no,status=no,scrollbars=no,location=no,menubar=no,directories=no,width=1024,height=768')
    }
    $(document).ready(function(){
        $('#btn-inicio').click(function(){
            cambiarPagina('<%=request.getContextPath()%>','VillabookServlet','?op=1');
        });
        $('#btn-info').click(function(){
            cambiarPagina('<%=request.getContextPath()%>','VillabookServlet','?op=2');
        });
        $('#btn-empleado').click(function(){
            cambiarPagina('<%=request.getContextPath()%>','VillabookServlet','?op=3');
        });
    });
</script>
