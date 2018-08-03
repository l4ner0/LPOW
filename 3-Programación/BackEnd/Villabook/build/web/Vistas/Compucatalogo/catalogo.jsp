<%@page session="true" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.libroBean"%>
<%@page import="DAO.escuelaDAO"%>
<% 

    
if(  session.getAttribute("idAlumno") == null)
  {
      response.sendRedirect(request.getContextPath()+"/Vistas/Seguridad/loginAdministrador.jsp");


   }

%>
<%!
    ArrayList<libroBean> listaLibros;
%>
<%
    listaLibros=(ArrayList<libroBean>)request.getAttribute("listaLibros");
%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
  <head>
    <title>Villabook</title>
    <link href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <link href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Pakhi Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--webfont-->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'/>
    <!-- dropdown -->
    <script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/js/jquery.easydropdown.js"></script>
    <link href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/nav.css" rel="stylesheet" type="text/css" media="all"/>
  		<script type="text/javascript">
  		  jQuery(document).ready(function($) {
  			   $(".scroll").click(function(event){		
  				    event.preventDefault();
  				    $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
  			   });
  		  });
      </script>
  	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  	<!-- iCheck -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos-Compucatalogo/plugins/iCheck/square/blue.css">
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/font-awesome.min.css">
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/Complementos-Compucatalogo/css/estilos-catalogo.css">
  </head>
  <body>
      <form name="form">
    <!-- header-section-starts -->
  	<div class="c-header" id="home">
  		<div class="top-header">
  			<div class="container">
  			  <div class="logo">
  				  <a href="?op=1"><h1 style="color: white;">Compucatalogo N° 1</h1></a>
  	 		  </div>
                <div class="header-top-right">
                    
                        <div class="salir">
                            <a id="btn-salir" href="#">SALIR</a>
                        </div>
                   
                </div>
  	 		  <!--
  			  <div class="header-top-right">
  				  <div class="search-box">
  					  <div id="sb-search" class="sb-search">
  				  		<form>
  								<input class="sb-search-input" placeholder="Ingrese el libro a buscar" type="search" name="search" id="search">
  								<input class="sb-search-submit" type="submit" value="">
  								<span class="sb-icon-search"> </span>
  							</form>
  						</div>
  				  </div>

  					<script src="js/classie.js"></script>
  					<script src="js/uisearch.js"></script>
  					<script>
  						new UISearch( document.getElementById( 'sb-search' ) );
  					</script>

  					<a href="cart.html"><i class="cart"></i></a>
  				</div>
  				-->
  			</div>
  		</div>
  	</div>

  	<!-- start Dresses-page -->
  	<!-- content-section-starts -->
    <br>
    <div class="container">
  	  <div class="ft-ball">
  		  <div class="cont span_2_of_3">
          <div class="herramientas-filtro">
            <div class="row">
              <div class="col-md-3 buscarPor">
                  <label for="">Buscar por: &nbsp;</label>
                  <select name="" id="filtro-origen" class="">
                    <option value="">..........</option>
                    <option value="">ISBN</option>
                    <option value="">Titulo</option>
                    <option value="">Autor</option>
                  </select>   
              </div>
              <div class="col-md-3">
                <div class="inputBuscarLibro">
                    <input type="text" id="filtro-fecha">
                </div>
              </div>
              <div class="col-md-1">
                <button class="btn btn-secondary btn-sm btnFiltrar">Filtrar</button>
              </div>
            </div>
          </div>
          <table class="catalogo" id="catalogo">
            <thead>
              <tr>
                <td></td>
              </tr>
            </thead>
            <tbody class="row">
                <%for(libroBean obj:listaLibros){%>
                    <tr class="col-sm-4 col-md-4">
                      <td>
                           <div class="box1">
                        <div class="col_1_of_single1 span_1_of_single1">
                          <div class="view1 view-fifth1">
                            <div class="top_box">
                                <h3 class="m_1"><%=obj.getTitulo()%></h3>
                              <p class="m_2"><%=obj.getAutor()%></p>
                              <a href="#">
                                <div class="grid_img">
                                  <div class="css3"><img src="<%=request.getContextPath()%>/Complementos-Compucatalogo/images/portada-libro.png" alt=""/></div>
                                  <div class="mask1">
                                      <div class="info" onclick="FuncionSolicitarPrestamo('<%=request.getContextPath()%>','PrestamoServlet','9','<%=obj.getId_libro()%>','1','<%=session.getAttribute("idAlumno")%>')">Solicitar</div>
                                  </div>
                                </div>
                              </a>
                              <div class="price">Disponible</div>
                            </div>
                          </div>
                          <ul class="list2" style="list-style: none;">
                            <li>
                              <img src="<%=request.getContextPath()%>/Complementos-Compucatalogo/images/plus.png" alt=""/>
                              <ul class="icon1 sub-icon1 profile_img">
                                <li><a class="active-icon c1" href="single.html">Solicitar </a>
                                    <ul class="sub-icon1 list">
                                      <li><h3>Descripción del Libro</h3><a href=""></a></li>
                                      <li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
                                    </ul>
                                </li>
                              </ul>
                            </li>
                          </ul>
                          <div class="clear"></div>
                        </div>
                              <div class="clearfix"></div>
                              </div>
                      </td>
                  </tr>
              <%}%>
            </tbody>
          </table>
  			</div>
              
       	<div class="rsidebar span_1_of_left">
  				<section  class="sky-form menu">
            <h4>Escuela</h4>
  					<div class="row row1 scroll-pane">
  						<div class="col col-4">
                                                    <div class="radioButton" >
  						    <label class="radiobutton">
                                <input type="radio" name="escuela" id="Etodos" value="-1" checked>
                                <span class="label-text">Todas</span>
  						    </label>
  						</div>
  						<div class="radioButton">
                            <label class="radiobutton">
                                <input type="radio" name="escuela" id="Esist" value="1">
                                <span>Sistemas </span>
                            </label>
  						</div>
  						<div class="radioButton">
                            <label class="radiobutton">
                                <input type="radio" name="escuela" id="Eindus" value="2">
                                <span>Industrial </span>
                            </label>
  						</div>
  						<div class="radioButton">
                            <label class="radiobutton">
                                <input type="radio" name="escuela" id="Etrans" value="3">
                                <span>Transportes </span>
                            </label>
  						</div>
  						<div class="radioButton">
                            <label class="radiobutton">
                                <input type="radio" name="escuela" id="Eagro" value="4">
                                <span>Agroindustrial </span>
                            </label>
  						</div>
  					  </div>
  					</div>
  					<h4>Tipo de Documento</h4>
  					<div class="row row1 scroll-pane">
  						<div class="col col-4">
                            <div class="radioButton"  >
                               <label class="radiobutton">
                                    <input type="radio" name="checkbox" value="-1" id="TDtodos" checked>
                                    <span>Todos </span>
                                </label>
                            </div>
                            <div class="radioButton">
                                <label class="radiobutton">
                                    <input type="radio" name="checkbox" id="TDlibros" value="1">
                                    <span>Libros </span>
                                </label>
                            </div>
                            <div class="radioButton">
                                <label class="radiobutton">
                                    <input type="radio" name="checkbox" id="TDtesis" value="2">
                                    <span>Tesis </span>
                                </label>
                            </div>
                            <div class="radioButton">
                                <label class="radiobutton">
                                    <input type="radio" name="checkbox" id="TDmonografia" value="3">
                                    <span>Monografías </span>
                                </label>
                            </div>
                            <div class="radioButton">
                                <label class="radiobutton">
                                    <input type="radio" name="checkbox" id="TDrevistas" value="4">
                                    <span>Revistas </span>
                                </label>
                            </div>
  						</div>
  					</div>
  				</section>
  		  </div>
  			<div class="clearfix"></div>
  		</div>
  	</div>
  	<!-- content-section-ends -->

  	<div class="footer">
  		<div class="up-arrow">
  			<a class="scroll" href="#home"><img src="<%=request.getContextPath()%>/Complementos-Compucatalogo/images/up.png" alt="" /></a>
  		</div>
  		<div class="container">
  			<div class="copyrights">
  				<p>Copyright &copy; 2018 Todos los derechos reservados | Template by  <b>  Villabook</b></p>
  			</div>
  			<div class="footer-social-icons">
  				<a href="#"><i class="fb"></i></a>
  				<a href="#"><i class="tw"></i></a>
  				<a href="#"><i class="in"></i></a>
  				<a href="#"><i class="pt"></i></a>
  			</div>
  			<div class="clearfix"></div>
  		</div>
  	</div>
    </form>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <script src="<%=request.getContextPath()%>/Complementos/plugins/sweetalert/sweetalert.min.js"></script>
     <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/plugins/iCheck/icheck.min.js"></script>
    <script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/js/LibroCatalogo.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/js/Funciones.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Complementos-Compucatalogo/js/PrestamoCatalogo.js" type="text/javascript"></script>
      <script>
          $(document).ready(function(){
              $('#catalogo').DataTable( {
                  "responsive": true,
                  "searching": false,
                  "lengthMenu":[[6,12,18,-1],[6,12,18,"Todos"]],
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
              
             
              
              $('#btn-salir').click(function(){
                 
                  funcionLogout('<%=request.getContextPath()%>','CompucatalogoServlet','?op=2');
              });
              
                           
              $('input#TDtodos').on('change', this, function(){
                 FuncionFiltrarTipoDocumento('<%=request.getContextPath()%>','LibroServlet','6',$('#TDtodos').val());
              });
              $('input#TDlibros').on('change', this, function(){
                 FuncionFiltrarTipoDocumento('<%=request.getContextPath()%>','LibroServlet','6',$('#TDlibros').val());
              });
              $('input#TDtesis').on('change', this, function(){
                 FuncionFiltrarTipoDocumento('<%=request.getContextPath()%>','LibroServlet','6',$('#TDtesis').val());
              });
              $('input#TDmonografia').on('change', this, function(){
                FuncionFiltrarTipoDocumento('<%=request.getContextPath()%>','LibroServlet','6',$('#TDmonografia').val());
              });
              $('input#TDrevistas').on('change', this, function(){
                FuncionFiltrarTipoDocumento('<%=request.getContextPath()%>','LibroServlet','6',$('#TDrevistas').val());
              });
              
              
              $('input#Etodos').on('change', this, function(){
                 FuncionFiltrarEscuela('<%=request.getContextPath()%>','LibroServlet','7',$('#Etodos').val());
              });
              $('input#Esist').on('change', this, function(){
                  FuncionFiltrarEscuela('<%=request.getContextPath()%>','LibroServlet','7',$('#Esist').val());
              });
              $('input#Eindus').on('change', this, function(){
                  FuncionFiltrarEscuela('<%=request.getContextPath()%>','LibroServlet','7',$('#Eindus').val());
              });
              $('input#Etrans').on('change', this, function(){
                 FuncionFiltrarEscuela('<%=request.getContextPath()%>','LibroServlet','7',$('#Etrans').val());
              });
              $('input#Eagro').on('change', this, function(){
                 FuncionFiltrarEscuela('<%=request.getContextPath()%>','LibroServlet','7',$('#Eagro').val());
              });
              
              
          });
        
    </script>
  </body>
</html>