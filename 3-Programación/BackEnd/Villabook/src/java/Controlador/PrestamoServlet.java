/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Bean.prestamoBean;
import Controlador.Funciones.Fecha;
import DAO.prestamoDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
public class PrestamoServlet extends HttpServlet {

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
        prestamoDAO prestamo = null;
        Gson gson = new Gson();
        PrintWriter out = response.getWriter();
        int op=Integer.parseInt(request.getParameter("op"));
        System.out.println("El op es: "+op);
        
        switch(op){
            case 1:{
                
                ArrayList<prestamoBean> lista = new ArrayList<>();
                prestamo = new prestamoDAO();
                int idPrestamo = Integer.parseInt(request.getParameter("id_prestamo"));
                lista = prestamo.verAprobarEntrega(idPrestamo);
                out.print(gson.toJson(lista));
                out.flush();
                out.close();
                break;
            }
            
            case 2:{
                prestamo = new prestamoDAO();
                Fecha sumaFecha = new Fecha();
                SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy/MM/dd");
                int idPrestamoPendiente = Integer.parseInt(request.getParameter("idPrestamoPendiente"));
                String fechaPrestamo = request.getParameter("fechaPrestamo");
                String horaPrestamo = request.getParameter("horaPrestamo");
                Date fecha = sumaFecha.sumarRestarDiasFecha(fechaPrestamo, 1);
                String fechaDevolucion=formatoDeFecha.format(fecha);
                int resultado=prestamo.aprobarEntrega(idPrestamoPendiente,fechaDevolucion,horaPrestamo);
                
                if(resultado==1){
                    out.print("1");
                }else{
                     out.print("-1");
                }
                break;
            }
            
            case 3:{
                prestamo = new prestamoDAO();
                int idPrestamoPendiente = Integer.parseInt(request.getParameter("id_prestamo"));
                String motivo = request.getParameter("motivo");
                int resultado=prestamo.noAprobarEnrega(idPrestamoPendiente,motivo);
                if(resultado==1){
                    out.print("1");
                }else{
                     out.print("-1");
                }
                break;
            }
            
            case 4:{
                prestamo = new prestamoDAO();
                ArrayList<prestamoBean> lista = new ArrayList<>();
                int idPrestamoCancelado = Integer.parseInt(request.getParameter("id_prestamo"));
                lista = prestamo.verNoAprobarEntrega(idPrestamoCancelado);
                out.print(gson.toJson(lista));
                out.flush();
                out.close();
                break;
            }
            
            case 5:{
                prestamo = new prestamoDAO();
                ArrayList<prestamoBean> lista = new ArrayList<>();
                String codAlumno = request.getParameter("codAlumno");
                lista=prestamo.filtrarPendiente(codAlumno);
                out.print(gson.toJson(lista));
                out.flush();
                out.close();
                 break;
            }
            
            case 6:{
                prestamo = new prestamoDAO();
                ArrayList<prestamoBean> lista = new ArrayList<>();
                String codAlumno = request.getParameter("codAlumno");
                lista=prestamo.filtrarNoAprobado(codAlumno);
                out.print(gson.toJson(lista));
                out.flush();
                out.close();
                 break;
            }
            
            case 7:{
                prestamo = new prestamoDAO();
                ArrayList<prestamoBean> lista = new ArrayList<>();
                int condicionEntrega = Integer.parseInt(request.getParameter("condicionEntrega"));
                lista=prestamo.filtrarEntregas(condicionEntrega);
                out.print(gson.toJson(lista));
                out.flush();
                out.close();
                break;
            }
            
            case 8:{
                prestamo = new prestamoDAO();
                int idPrestamo = Integer.parseInt(request.getParameter("idPrestamo"));
                int resultado=prestamo.entregado(idPrestamo);
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
