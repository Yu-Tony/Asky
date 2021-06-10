/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.RespuestaDAO;
import com.pw.dbconnection.models.PreguntaModel;
import com.pw.dbconnection.models.RespuestaModel;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
@WebServlet(name = "CrearRespuestaController", urlPatterns = {"/CrearRespuestaController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class CrearRespuestaController extends HttpServlet{
      
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           
       
        String contenido = request.getParameter("Respuesta");      
        String usuario = request.getParameter("nombrePersona");      
        String preguntaID = request.getParameter("idPreguntaRes"); 
        
        
        //9
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/uuuu");
        LocalDate localDate = LocalDate.now();
        java.util.Date fecha_crea = java.sql.Date.valueOf(localDate);
        
        String imagen=null;
        boolean mejor = false;
        boolean edit = false;
        boolean delete = false;
        
        int id = Integer.parseInt(preguntaID);
     
        /* System.out.println(contenido);
         System.out.println(usuario);
         System.out.println(id);*/
         
        //id, contenido, imagen, mejor, usuario, pregunta, fecha, edit
         RespuestaModel myRespuesta = new RespuestaModel(contenido,imagen,mejor,usuario,id, fecha_crea,edit, delete);
          
        RespuestaDAO.insertRespuesta(myRespuesta);
        
       
        
        response.sendRedirect("/DbConnection/assets/html/pregunta.jsp");              
    }
}