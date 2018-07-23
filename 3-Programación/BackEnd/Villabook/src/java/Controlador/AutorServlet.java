/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Bean.AutorBean;
import DAO.AutorDAO;
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
public class AutorServlet extends HttpServlet {

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
        AutorDAO objAutorDAO=null;
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        int op=Integer.parseInt(request.getParameter("op"));
        
        switch(op){
            case 1:{
                objAutorDAO=new AutorDAO();
                ArrayList<AutorBean> lista = new ArrayList<AutorBean>();
                lista=objAutorDAO.getAutores();
                out.print(gson.toJson(lista));
                out.flush();
                out.close();  
                break;
            }
            case 2:{
                String apellidos = request.getParameter("apellidos");
                String nombres= request.getParameter("nombres");
                String detalle=request.getParameter("detalle");
                objAutorDAO = new AutorDAO();
                AutorBean objAutorBean = new AutorBean();
                objAutorBean.setApellidos(apellidos);
                objAutorBean.setNombres(nombres);
                objAutorBean.setDetalle(detalle);
                int resultado=objAutorDAO.addAutor(objAutorBean);
                if(resultado==1){
                    out.print("1");
                }else{
                     out.print("-1");
                }
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
