<!DOCTYPE html>
<html lang="en">

  <%@include file="General/head.jsp" %>

  <body>

    <!-- Navigation -->
    <%@include file="General/navbar.jsp" %>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/Complementos-Villabook/img/about-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="page-heading">
              <h1>Información</h1>
              <span class="subheading">¿Quienes somos?</span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <p>
              Somos un equipo de estudiantes de la Universidad Nacional Federico 
              Villarreal pertenecientes a la carrera de Ingeniería de Sistemas.
              Bajo la supervisión del Ingeniero Ivan Petrlik Azabache hemos desarrollado
              un sistema cuya finalidad es la de agilizar los préstamos de libros  en la biblioteca de 
              la Facultadad de Ingeniería Idustrial y de Sistemas.
          </p>
         
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
