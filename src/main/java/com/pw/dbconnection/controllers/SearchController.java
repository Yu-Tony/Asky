/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.LikeDAO;
import com.pw.dbconnection.dao.PreguntaDAO;
import com.pw.dbconnection.models.LikeModel;
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
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class SearchController extends HttpServlet {
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        String usuario = request.getParameter("usuario");
        int pregunta = Integer.parseInt(request.getParameter("pregunta"));
        boolean util=  Boolean.parseBoolean(request.getParameter("util")); 
       
	LikeModel like = new LikeModel(usuario,pregunta,util);
        LikeDAO.insertLike(like);
        */
        
        String nombre = request.getParameter("busqueda");
        System.out.println(nombre);
        List<PreguntaModel> Preguntas = PreguntaDAO.buscarPregunta(nombre);

       
        //request.setAttribute("srchResult", Preguntas);
        HttpSession MomoSession = request.getSession(false);
        if(MomoSession!=null){
            MomoSession.setAttribute("srchResult", Preguntas);
            System.out.println("SE SETEO");
        }
        else{
            MomoSession = request.getSession(true);
            MomoSession.setAttribute("srchResult", Preguntas);  
        }
        response.sendRedirect("assets/html/busqueda.jsp");        
    }
   
}
