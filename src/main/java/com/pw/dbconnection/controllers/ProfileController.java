/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.PreguntaDAO;
import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.PreguntaModel;
import com.pw.dbconnection.models.UserModel;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author molec
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/ProfileController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class ProfileController extends HttpServlet {
     
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*int a = 0;
        
        System.out.println("ESTO SALIO 3");
        if(MomoSession!=null){
            a = (int)MomoSession.getAttribute("IdShowPregunta");
            System.out.println(MomoSession.getAttribute("IdShowPregunta"));
            PreguntaModel miPregunta = PreguntaDAO.idPregunta(a);
            List<RespuestaModel> misRespuestas = RespuestaDAO.getRespuestas(a);
            System.out.println(misRespuestas.size());
            MomoSession.setAttribute("MostrarPregunta", miPregunta);
            MomoSession.setAttribute("MostrarRespuestas", misRespuestas);
            System.out.println(miPregunta.getContenido());
        
        
            //request.getRequestDispatcher("index.jsp").forward(request, response);
            request.getRequestDispatcher("assets/html/pregunta.jsp").forward(request, response);
        }*/
        String user = request.getParameter("user");
        UserModel myUser = UserDAO.getUserById(user);
        List<PreguntaModel> misPreguntas = PreguntaDAO.buscarPreguntaPorUsuario(user);
        
        //System.out.println(myUser.getUsername());
        HttpSession MomoSession = request.getSession(false); 
        request.setAttribute("usuario", myUser);
        request.setAttribute("preguntas", misPreguntas);
        if(MomoSession!=null){
              System.out.println( "este usuario esta en sesion: " + MomoSession.getAttribute("correo"));
              String test = (String)MomoSession.getAttribute("correo");
              if(test == null){
                  
              }else{
                if(test.equals(user)){
                   request.setAttribute("dueño", true);
                }else{
                   request.setAttribute("dueño", false);
                }
              }
        }
       
        System.out.println( "valio");

        request.getRequestDispatcher("assets/html/perfil.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //String name = request.getParameter("name");
        System.out.println( "valio");
        response.sendRedirect("ProfileController");        
    }
}
