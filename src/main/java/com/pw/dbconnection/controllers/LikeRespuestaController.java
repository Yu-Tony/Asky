/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.LikeDAO;
import com.pw.dbconnection.dao.LikeRespuestaDAO;
import com.pw.dbconnection.models.LikeModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author teb - https://github.com/Yu-Tony
 */
@WebServlet(name = "LikeRespuestaController", urlPatterns = {"/LikeRespuestaController"})
public class LikeRespuestaController extends HttpServlet {

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        
        /*
            if likeup and is liked = 1 dio like (true)
            if likeup and not liked = 2 quito like (eliminar)
            if likedown and is liked = 3 dio dislike (false)
            if likedown and not liked = 4 quito dislike (eliminar)
        */
        //System.out.println("Enter Like");
        String usuarioPreguntaLike = request.getParameter("usuarioPreguntaLike");
        int idPreguntaLike = Integer.parseInt(request.getParameter("idPreguntaLike"));
        boolean utilPreguntaLike=  Boolean.parseBoolean(request.getParameter("utilPreguntaLike")); 
        int tipoLike =Integer.parseInt(request.getParameter("tipoLike"));
        //System.out.println("id del like " + usuarioPreguntaLike);
      
        if(usuarioPreguntaLike!=null && usuarioPreguntaLike!="")
        {
            LikeModel like = new LikeModel(usuarioPreguntaLike,idPreguntaLike,utilPreguntaLike);
            if(tipoLike==1)
            {
  
                 /*System.out.println("user "  + like.getUsuario());
                System.out.println(like.getPregunta());
                System.out.println(like.isUtil());
                 System.out.println("Like");*/
                LikeRespuestaDAO.insertLikeRespuesta(like);
               
            }
            
            if(tipoLike==2)
            {
                 /*System.out.println("user "  + like.getUsuario());
                System.out.println(like.getPregunta());
                System.out.println(like.isUtil());
                System.out.println("NotLike");*/
                LikeRespuestaDAO.deleteLikeRespuesta(like);
                
            }
            
            if(tipoLike==3)
            {
                /* System.out.println("user "  + like.getUsuario());
                System.out.println(like.getPregunta());
                System.out.println(like.isUtil());
                 System.out.println("Dislike");*/
                LikeRespuestaDAO.insertLikeRespuesta(like);
               
            }
             
            if(tipoLike==4)
            {
                /*System.out.println("user "  + like.getUsuario());
                System.out.println(like.getPregunta());
                System.out.println(like.isUtil());
                System.out.println("Nor Dislike");*/
                LikeRespuestaDAO.deleteLikeRespuesta(like);
            }
         
        } 

            

       
     
        // response.sendRedirect("UsersController");
    }

}
