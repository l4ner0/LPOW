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
 * @author Usuario
 */
public class LibroServlet extends HttpServlet {

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
        libroDAO objLibroDAO=null;
        PrintWriter out = response.getWriter();
        int op=Integer.parseInt(request.getParameter("op"));
        
        switch(op){
            case 1:{
                objLibroDAO=new libroDAO();
                ArrayList<libroBean> lista=new ArrayList<libroBean>();
                lista = objLibroDAO.getLibrosTabla();
                request.setAttribute("listasLibros", lista);
                break;
            }
            
            case 2:{
                objLibroDAO=new libroDAO();
                libroBean objLibroBean=new libroBean();
                
                int tipoDocumento=Integer.parseInt(request.getParameter("tipoDocumento"));
                int escuela=Integer.parseInt(request.getParameter("escuela"));
                int autor=Integer.parseInt(request.getParameter("autor"));
                String isbn=request.getParameter("isbn");
                String portada=request.getParameter("portada");
                String titulo=request.getParameter("titulo");
                String datosPubli=request.getParameter("datosPubli");
                int stockInicial=Integer.parseInt(request.getParameter("stockInicial"));
                
                objLibroBean.setId_tipo_documento(tipoDocumento);
                objLibroBean.setId_escuela(escuela);
                objLibroBean.setId_autor(autor);
                objLibroBean.setISBN(isbn);
                objLibroBean.setPortada(portada);
                objLibroBean.setTitulo(titulo);
                objLibroBean.setDatos_publi(datosPubli);
                objLibroBean.setStock_inicial(stockInicial);
                
                int resultado=objLibroDAO.addLibro(objLibroBean);
                
                if(resultado==1){
                    out.print("Se añadio el libro correctamente");
                }else{
                     out.print("Error, no se pudo añadir el libro");
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
