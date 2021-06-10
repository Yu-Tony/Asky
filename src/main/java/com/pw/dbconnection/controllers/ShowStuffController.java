/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.PreguntaDAO;
import com.pw.dbconnection.dao.RespuestaDAO;
import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.PreguntaModel;
import com.pw.dbconnection.models.RespuestaModel;
import com.pw.dbconnection.models.UserModel;
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
@WebServlet(name = "ShowStuffController", urlPatterns = {"/ShowStuffController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class ShowStuffController extends HttpServlet{
    
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             System.out.println("please work");
        //String name = request.getParameter("name");
        int idStuff = Integer.parseInt(request.getParameter("parameter"));  
        String usuario = request.getParameter("usuario");
        if(idStuff==1){
            System.out.println("pues entro");
            HttpSession MomoSession = request.getSession(false);
            List<PreguntaModel> Preguntas = PreguntaDAO.buscarPreguntaPorUsuario(usuario);
            MomoSession.setAttribute("UserQuestions", Preguntas);
            
        }
        if(idStuff==2){
            System.out.println("pues entro al 2");
            HttpSession MomoSession = request.getSession(false);
            List<RespuestaModel> Respuestas = RespuestaDAO.getRespuestasByUser(usuario);
            MomoSession.setAttribute("UserAnswers", Respuestas);
            
        }
        if(idStuff==3){
            System.out.println("pues entro al 3");
            HttpSession MomoSession = request.getSession(false);
            List<PreguntaModel> Preguntas = PreguntaDAO.buscarPreguntaPorUsuarioUtil(usuario, true);
            MomoSession.setAttribute("UserQuestions", Preguntas);
            
        }
        if(idStuff==4){
            System.out.println("pues entro al 4");
            HttpSession MomoSession = request.getSession(false);
            List<PreguntaModel> Preguntas = PreguntaDAO.buscarPreguntaPorUsuarioUtil(usuario, false);
            MomoSession.setAttribute("UserQuestions", Preguntas);
            
        }
        if(idStuff==5){
            System.out.println("pues entro al 5");
            HttpSession MomoSession = request.getSession(false);
            List<PreguntaModel> Preguntas = PreguntaDAO.buscarPreguntaPorUsuarioFav(usuario);
            MomoSession.setAttribute("UserQuestions", Preguntas);
            
        }
        if(idStuff==6){
            System.out.println("pues entro al 6");
            HttpSession MomoSession = request.getSession(false);
            UserModel myUser = UserDAO.getUserById(usuario);
            MomoSession.setAttribute("DatosUsuario", myUser);
            
        }
        //response.sendRedirect("ProfileController");        
    }
    
}
