/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Bean.AutorBean;
import DAO.AutorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

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
        int op=Integer.parseInt(request.getParameter("op"));
        String apellidos = request.getParameter("apellidos");
        String nombres= request.getParameter("nombres");
        String detalle=request.getParameter("detalle");
        
        switch(op){
            case 1:{
                objAutorDAO=new AutorDAO();
                ArrayList<AutorBean> lista = new ArrayList<AutorBean>();
                lista=objAutorDAO.getAutores();
                String respuesta="";
                for(AutorBean obj:lista){
                    respuesta+="<option value'"+obj.getId_autor()+"'>"+obj.getApellidos()+" "+obj.getNombres()+"</option>";
                    respuesta+="\n";
                }
                out.print(respuesta);
                System.out.println(respuesta);
                break;
            }
            case 2:{
                objAutorDAO = new AutorDAO();
                AutorBean objAutorBean = new AutorBean();
                objAutorBean.setApellidos(apellidos);
                objAutorBean.setNombres(nombres);
                objAutorBean.setDetalle(detalle);
                int resultado=objAutorDAO.addAutor(objAutorBean);
                if(resultado==1){
                    out.print("Se añadio el autor correctamente");
                }else{
                     out.print("Error, no se pudo añadir al autor");
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
