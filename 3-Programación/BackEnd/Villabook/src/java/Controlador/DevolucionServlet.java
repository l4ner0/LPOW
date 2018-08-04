/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Bean.devolucionBean;
import DAO.devolucionDAO;
import DAO.prestamoDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
public class DevolucionServlet extends HttpServlet {

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
        devolucionDAO devolucion = null;
        Gson gson = new Gson();
        PrintWriter out = response.getWriter();
        int op=Integer.parseInt(request.getParameter("op"));
        
        switch(op){
            case 1:{
                devolucion = new devolucionDAO();
                int idDevolucion = Integer.parseInt(request.getParameter("idDevolucion"));
                String isbn = request.getParameter("isbn");
                int resultado=devolucion.aprobarDevolucion(idDevolucion,isbn);
                if(resultado==1){
                    out.print("1");
                }else{
                     out.print("-1");
                }
                break;
            }
            
            case 2:{
                ArrayList<devolucionBean> lista = new ArrayList<>();
                devolucion = new devolucionDAO();
                int idDevolucion = Integer.parseInt(request.getParameter("idDevolucion"));
                lista = devolucion.verAprobarDevoluciones(idDevolucion);
                out.print(gson.toJson(lista));
                out.flush();
                out.close();
                break;
            }
            
            case 3:{
                ArrayList<devolucionBean> lista = new ArrayList<>();
                devolucion = new devolucionDAO();
                String codAlumno = request.getParameter("codAlumno");
                lista = devolucion.filtrarPendienteAlumno(codAlumno);
                out.print(gson.toJson(lista));
                out.flush();
                out.close();
                break;
            }
            
            case 4:{
                ArrayList<devolucionBean> lista = new ArrayList<>();
                devolucion = new devolucionDAO();
                String codAlumno = request.getParameter("codAlumno");
                lista = devolucion.filtrarAprobadaAlumno(codAlumno);
                out.print(gson.toJson(lista));
                out.flush();
                out.close();
                break;
            }
        }
        
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
