/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Bean.devolucionBean;
import Bean.empleadoBean;
import Bean.libroBean;
import Bean.prestamoBean;
import DAO.alumnoDAO;
import DAO.devolucionDAO;
import DAO.empleadoDAO;
import DAO.libroDAO;
import DAO.prestamoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

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
        HttpSession sesion = request.getSession(true);
        libroDAO objLibroDAO=null;
        prestamoDAO objPrestamoDAO = null;
        devolucionDAO objDevolucionDAO = null;
        int op=Integer.parseInt(request.getParameter("op"));
        String pagina="";
        switch(op){
            case 1:{
                if(sesion.getAttribute("idEmpleado")!=null){
                    
                    alumnoDAO objAlumnoDAO = new alumnoDAO();
                    objLibroDAO = new libroDAO();
                    objPrestamoDAO = new prestamoDAO();
                    objDevolucionDAO = new devolucionDAO();
                    
                    int numEstudiantes=objAlumnoDAO.contarEstudiantes();
                    int numLibros = objLibroDAO.contarLibros();
                    int numPrestamosPendientes = objPrestamoDAO.contarPrestamosPendientes();
                    int numDevolucionesPendientes = objDevolucionDAO.contarDevolucionesPendientes();
                    
                    request.setAttribute("numEstudiantes", numEstudiantes);
                    request.setAttribute("numLibros", numLibros);
                    request.setAttribute("numPrestamosPendientes", numPrestamosPendientes);
                    request.setAttribute("numDevolucionesPendientes", numDevolucionesPendientes);
                     pagina="/Vistas/Administrador/inicio.jsp";
                     break;
                }else{
                    pagina="/Vistas/Seguridad/loginAdministrador.jsp";
                     break;
                }
            }
            
            case 2:{
                if(sesion.getAttribute("idEmpleado")!=null){
                    objLibroDAO=new libroDAO();
                    objPrestamoDAO = new prestamoDAO();
                    ArrayList<libroBean> lista=new ArrayList<libroBean>();
                     int numPrestamosPendientes = objPrestamoDAO.contarPrestamosPendientes();
                     request.setAttribute("numPrestamosPendientes", numPrestamosPendientes);
                    lista = objLibroDAO.getLibrosTabla();
                    
                    request.setAttribute("listasLibros", lista);
                    pagina="/Vistas/Administrador/libros.jsp";
                    break;
                }else{
                    pagina="/Vistas/Seguridad/loginAdministrador.jsp";
                    break;
                } 
            }
            
            case 3:{
                if(sesion.getAttribute("idEmpleado")!=null){
                    
                    objPrestamoDAO = new prestamoDAO();
                    ArrayList<prestamoBean> lista = new ArrayList<prestamoBean>();
                    lista = objPrestamoDAO.listarEntregasPendientes();
                      int numPrestamosPendientes = objPrestamoDAO.contarPrestamosPendientes();
                    request.setAttribute("listaEntregasPendientes", lista);
                    request.setAttribute("numPrestamosPendientes", numPrestamosPendientes);
                    pagina="/Vistas/Administrador/entregas-pendientes.jsp";
                    break;
                }else{
                    pagina="/Vistas/Seguridad/loginAdministrador.jsp";
                     break;
                }
            }
            
            case 4:{
                if(sesion.getAttribute("idEmpleado")!=null){
                    
                    objPrestamoDAO = new prestamoDAO();
                    ArrayList<prestamoBean> lista = new ArrayList<>();
                    lista = objPrestamoDAO.listarEntregasNoAprobadas();
                    int numPrestamosPendientes = objPrestamoDAO.contarPrestamosPendientes();
                    request.setAttribute("listaEntregasNoAprobadas", lista);
                    request.setAttribute("numPrestamosPendientes", numPrestamosPendientes);
                    pagina="/Vistas/Administrador/entregas-noAprobadas.jsp";
                    break;
                }else{
                    pagina="/Vistas/Seguridad/loginAdministrador.jsp";
                     break;
                } 
            }
            
            case 5:{
                if(sesion.getAttribute("idEmpleado")!=null){
                    
                    objPrestamoDAO = new prestamoDAO();
                    ArrayList<prestamoBean> lista = new ArrayList<>();
                    lista = objPrestamoDAO.listarEntregasAprobadas();
                    int numPrestamosPendientes = objPrestamoDAO.contarPrestamosPendientes();
                    request.setAttribute("listaEntregasAprobadas", lista);
                    request.setAttribute("numPrestamosPendientes", numPrestamosPendientes);
                    pagina="/Vistas/Administrador/entregas-aprobadas.jsp";
                    break;
                }else{
                    pagina="/Vistas/Seguridad/loginAdministrador.jsp";
                     break;
                } 
            }
            
            case 6:{
                if(sesion.getAttribute("idEmpleado")!=null){
                    objPrestamoDAO = new prestamoDAO();
                    int numPrestamosPendientes = objPrestamoDAO.contarPrestamosPendientes();
                    request.setAttribute("numPrestamosPendientes", numPrestamosPendientes);
                    objDevolucionDAO = new devolucionDAO();
                    ArrayList<devolucionBean> lista = new ArrayList<>();
                    lista = objDevolucionDAO.verDevolucionesPendientes();
                    request.setAttribute("listaDevolucionesPendientes", lista);
                    pagina="/Vistas/Administrador/devoluciones-pendientes.jsp";
                    break;
                }else{
                    pagina="/Vistas/Seguridad/loginAdministrador.jsp";
                     break;
                }
            }
            
            case 7:{
                if(sesion.getAttribute("idEmpleado")!=null){
                    objPrestamoDAO = new prestamoDAO();
                    int numPrestamosPendientes = objPrestamoDAO.contarPrestamosPendientes();
                    request.setAttribute("numPrestamosPendientes", numPrestamosPendientes);
                      objDevolucionDAO = new devolucionDAO();
                    ArrayList<devolucionBean> lista = new ArrayList<>();
                    lista = objDevolucionDAO.verDevolucionesAprobadas();
                    request.setAttribute("listaDevolucionesAprobadas", lista);
                    pagina="/Vistas/Administrador/devoluciones-aprobadas.jsp";
                    break;
                }else{
                    pagina="/Vistas/Seguridad/loginAdministrador.jsp";
                     break;
                }   
            }
            
            case 8:{
                String email=request.getParameter("loginEmail");
                String clave=request.getParameter("loginPassword");
                empleadoDAO objEmpleadoDAO= new empleadoDAO();
                alumnoDAO objAlumnoDAO = new alumnoDAO();
                objLibroDAO = new libroDAO();
                objPrestamoDAO = new prestamoDAO();
                objDevolucionDAO = new devolucionDAO();
                ArrayList<empleadoBean> objEmpleadoBean =null;
                String md5=DigestUtils.md5Hex(clave);
                int idEmpleado=objEmpleadoDAO.validarIngresoEmpleado(email, md5);
                if(idEmpleado != -1){
                    objEmpleadoBean = objEmpleadoDAO.getEmpleado(idEmpleado);
                    for(empleadoBean obj:objEmpleadoBean){
                        sesion.setAttribute("idEmpleado", obj.getId_empleado());
                        sesion.setAttribute("nombreEmpleado", obj.getNombres());
                    }
                    
                    int numEstudiantes=objAlumnoDAO.contarEstudiantes();
                    int numLibros = objLibroDAO.contarLibros();
                    int numPrestamosPendientes = objPrestamoDAO.contarPrestamosPendientes();
                    int numDevolucionesPendientes = objDevolucionDAO.contarDevolucionesPendientes();
                    
                    request.setAttribute("numEstudiantes", numEstudiantes);
                    request.setAttribute("numLibros", numLibros);
                    request.setAttribute("numPrestamosPendientes", numPrestamosPendientes);
                    request.setAttribute("numDevolucionesPendientes", numDevolucionesPendientes);
                    
                    pagina="/Vistas/Administrador/inicio.jsp";
                }else{
                    pagina="/Vistas/Seguridad/loginAdministrador.jsp";
                }
                break;
            }
            
            case 9:{
                sesion.invalidate();
                pagina="/Vistas/Seguridad/loginAdministrador.jsp";
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
