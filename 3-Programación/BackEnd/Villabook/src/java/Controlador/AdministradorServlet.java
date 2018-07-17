/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Bean.libroBean;
import DAO.libroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diego
 */
public class AdministradorServlet extends HttpServlet {

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
        
        libroDAO objLibroDAO=null;
        int op=Integer.parseInt(request.getParameter("op"));
        String pagina="";
        switch(op){
            case 1:{
                pagina="/Vistas/Administrador/inicio.jsp";
                break;
            }
            
            case 2:{
                objLibroDAO=new libroDAO();
                ArrayList<libroBean> lista=new ArrayList<libroBean>();
                lista = objLibroDAO.getLibrosTabla();
                request.setAttribute("listasLibros", lista);
                pagina="/Vistas/Administrador/libros.jsp";
                break;
            }
            
            case 3:{
                 pagina="/Vistas/Administrador/entregas-pendientes.jsp";
                break;
            }
            
            case 4:{
                 pagina="/Vistas/Administrador/entregas-noAprobadas.jsp";
                break;
            }
            
            case 5:{
                 pagina="/Vistas/Administrador/entregas-aprobadas.jsp";
                break;
            }
            
            case 6:{
                 pagina="/Vistas/Administrador/devoluciones-pendientes.jsp";
                break;
            }
            
            case 7:{
                 pagina="/Vistas/Administrador/devoluciones-aprobadas.jsp";
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
