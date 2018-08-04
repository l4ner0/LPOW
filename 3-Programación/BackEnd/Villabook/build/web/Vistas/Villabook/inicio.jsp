<!DOCTYPE html>
<html lang="en">

  <%@include file="General/head.jsp" %>

  <body>

    <!-- Navigation -->
    <%@include file="General/navbar.jsp" %>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/Complementos-Villabook/img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Biblioteca Automatizada</h1>
              <span class="subheading">Prestamos más rápidos</span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
        </div>
      </div>
    </div>

    <hr>

    <!-- Footer -->
    <%@include file="General/footer.jsp" %>

    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/Complementos-Villabook/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="<%=request.getContextPath()%>/Complementos-Villabook/js/clean-blog.min.js"></script>

  </body>

</html>
