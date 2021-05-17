/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.FavDAO;
import com.pw.dbconnection.dao.LikeDAO;
import com.pw.dbconnection.models.FavModel;
import com.pw.dbconnection.models.LikeModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author teb - https://github.com/Yu-Tony
 */
@WebServlet(name = "FavController", urlPatterns = {"/FavController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class FavController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         System.out.println("entro a fav");
        /*
           tipoFav = 1 dio fav (crear)
           tipoFav = 2 quito fav (eliminar)
           
        */
       
        String usuarioPreguntaFav = request.getParameter("usuarioPreguntaFav");
        int idPreguntaFav = Integer.parseInt(request.getParameter("idPreguntaFav"));
        boolean utilPreguntaFav=  Boolean.parseBoolean(request.getParameter("utilPreguntaFav")); 
        int tipoFav =Integer.parseInt(request.getParameter("tipoFav"));
        System.out.println("noombre de fav" + usuarioPreguntaFav);
       
      
        if(usuarioPreguntaFav!=null && usuarioPreguntaFav!="")
        {
            System.out.println("noombre de fav" + usuarioPreguntaFav);
            FavModel fav = new FavModel(usuarioPreguntaFav,idPreguntaFav,utilPreguntaFav);
            if(tipoFav==1)
            {
  
                /* System.out.println("user que le da like "  + like.getUsuario());
                System.out.println(like.getPregunta());
                System.out.println(like.isUtil());*/
                FavDAO.insertFav(fav);
                
            }
            
            if(tipoFav==2)
            {
                FavDAO.deleteFav(fav);
               
            }
            
            
         
        } 

    }

}
