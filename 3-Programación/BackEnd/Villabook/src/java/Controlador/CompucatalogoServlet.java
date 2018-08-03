/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Bean.libroBean;
import DAO.alumnoDAO;
import DAO.libroDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class CompucatalogoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         HttpSession sesion = request.getSession(true);
          Gson gson = new Gson();
        PrintWriter out = response.getWriter();
        String pagina="";
        libroDAO libro=null;
        int op = Integer.parseInt(request.getParameter("op"));
        
       
            switch(op){
                case 1:{
                    libro = new libroDAO();
                    ArrayList<libroBean> lista = new ArrayList<>();
                    lista = libro.getLibrosTabla();
                    request.setAttribute("listaLibros", lista);
                     if(sesion.getAttribute("idAlumno") != null){
                        pagina="/Vistas/Compucatalogo/catalogo.jsp";
                    }else if(sesion.getAttribute("idAlumno") == null){
                        String codAlumno = request.getParameter("codAlumno");
                        alumnoDAO alumno = new alumnoDAO();
                        int respuesta = alumno.validarAlumno(codAlumno);
                        if(respuesta != -1){
                            sesion.setAttribute("idAlumno", respuesta);
                            pagina="/Vistas/Compucatalogo/catalogo.jsp";
                        }else{
                            pagina="/Vistas/Compucatalogo/inicio.jsp";
                        }
                        
                    }
                     break;
                 }
                case 2:{
                    sesion.invalidate();
                    pagina="/Vistas/Compucatalogo/inicio.jsp";
                    break;
                }
            }
       
        getServletContext().getRequestDispatcher(pagina).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
