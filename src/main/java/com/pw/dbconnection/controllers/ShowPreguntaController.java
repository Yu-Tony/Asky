/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.PreguntaDAO;
import com.pw.dbconnection.models.PreguntaModel;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "ShowPreguntaController", urlPatterns = {"/ShowPreguntaController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class ShowPreguntaController extends HttpServlet{
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int a = 0;
        HttpSession MomoSession = request.getSession(false); 
        System.out.println("ESTO SALIO 3");
        if(MomoSession!=null){
            a = (int)MomoSession.getAttribute("IdShowPregunta");
            System.out.println(MomoSession.getAttribute("IdShowPregunta"));
            PreguntaModel miPregunta = PreguntaDAO.idPregunta(a);
        
            request.setAttribute("MostrarPregunta", miPregunta);
            System.out.println(miPregunta.getContenido());
        
       
        
            //request.getRequestDispatcher("index.jsp").forward(request, response);
            request.getRequestDispatcher("assets/html/pregunta.jsp").forward(request, response);
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
       
        int idPregunta = Integer.parseInt(request.getParameter("IdPregunta"));  
        System.out.println("ESTO SALIO 2");
        HttpSession MomoSession = request.getSession(false);
        if(MomoSession!=null){
            MomoSession.setAttribute("IdShowPregunta", idPregunta);
            System.out.println("true");
        }
        else{
            MomoSession = request.getSession(true);
            System.out.println("false");
            MomoSession.removeAttribute("IdShowPregunta"); 
            MomoSession.setAttribute("IdShowPregunta", idPregunta);  
        }
        response.sendRedirect("ShowPreguntaController");              
    }
    
}
