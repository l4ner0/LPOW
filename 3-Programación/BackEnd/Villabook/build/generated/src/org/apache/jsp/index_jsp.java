package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Vistas/Seguridad/loginAdministrador.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("  <title>Login</title>\n");
      out.write("  <!-- Tell the browser to be responsive to screen width -->\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("\n");
      out.write("  <!-- Font Awesome -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css\">\n");
      out.write("  <!-- Ionicons -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css\">\n");
      out.write("  <!-- Theme style -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/Complementos/dist/css/adminlte.min.css\">\n");
      out.write("  <!-- iCheck -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/Complementos/plugins/iCheck/square/blue.css\">\n");
      out.write("  <!-- Google Font: Source Sans Pro -->\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700\" rel=\"stylesheet\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(request.getContextPath());
      out.write("/Complementos/dist/css/estilos-login.css\">\n");
      out.write("</head>\n");
      out.write("<body class=\"hold-transition\">\n");
      out.write("<div class=\"login-box contenedor-login\">\n");
      out.write("  <!-- /.login-logo -->\n");
      out.write("  <div class=\"card contenedor-login\">\n");
      out.write("   <div class=\"login-logo\">\n");
      out.write("    <img src=\"");
      out.print(request.getContextPath());
      out.write("/Complementos/dist/img/usuario-login.png\" alt=\"\" width=150>\n");
      out.write("  </div>\n");
      out.write("    <div class=\"card-body login-card-body\">\n");
      out.write("      <p class=\"login-box-msg\">Ingresa  tus credenciales</p>\n");
      out.write("      <form action=\"");
      out.print(request.getContextPath());
      out.write("/Vistas/Administrador/inicio.jsp\" method=\"\">\n");
      out.write("        <div class=\"form-group has-feedback\">\n");
      out.write("          <input type=\"email\" class=\"form-control\" placeholder=\"Correo Institucional\">\n");
      out.write("          <i class=\"fa fa-envelope form-control-feedback\"></i>\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"form-group has-feedback\">\n");
      out.write("          <input type=\"password\" class=\"form-control\" placeholder=\"Contraseña\">\n");
      out.write("          <i class=\"fa fa-lock form-control-feedback\"></i>\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-8\">\n");
      out.write("            <div class=\"checkbox icheck\">\n");
      out.write("              <label>\n");
      out.write("                <input type=\"checkbox\"> Recordarme\n");
      out.write("              </label>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <!-- /.col -->\n");
      out.write("          <div class=\"col-4\">\n");
      out.write("            <button type=\"submit\" class=\"btn btn-block btn-flat btn-ingresar\">Ingresar</button>\n");
      out.write("          </div>\n");
      out.write("          <br>\n");
      out.write("          <!-- /.col -->\n");
      out.write("        </div>\n");
      out.write("      </form>\n");
      out.write("    </div>\n");
      out.write("    <!-- /.login-card-body -->\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<!-- /.login-box -->\n");
      out.write("\n");
      out.write("<!-- jQuery -->\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/Complementos/plugins/jquery/jquery.min.js\"></script>\n");
      out.write("<!-- Bootstrap 4 -->\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/Complementos/plugins/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("<!-- iCheck -->\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/Complementos/plugins/iCheck/icheck.min.js\"></script>\n");
      out.write("<script>\n");
      out.write("  $(function () {\n");
      out.write("    $('input').iCheck({\n");
      out.write("      checkboxClass: 'icheckbox_square-blue',\n");
      out.write("      radioClass   : 'iradio_square-blue',\n");
      out.write("      increaseArea : '20%' // optional\n");
      out.write("    })\n");
      out.write("  })\n");
      out.write("</script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write(" %>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
