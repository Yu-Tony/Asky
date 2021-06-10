/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.BestDAO;
import com.pw.dbconnection.dao.LikeDAO;
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
@WebServlet(name = "BestController", urlPatterns = {"/BestController"})
public class BestController extends HttpServlet {

 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        
        //System.out.println("Enter Like");
  
        int idRespuestaBest = Integer.parseInt(request.getParameter("idRespuestaBest"));
        int idPreguntaBest = Integer.parseInt(request.getParameter("idPreguntaBest"));
        boolean bestRespuesta=  Boolean.parseBoolean(request.getParameter("bestRespuesta")); 

        //System.out.println("id del like " + usuarioPreguntaLike);
      
        if(bestRespuesta==true)
        {
           BestDAO.insertBest(idRespuestaBest, idPreguntaBest);
           // System.out.println("idRespuestaBest yes " + idRespuestaBest);
             //System.out.println("idPreguntaBest yes " + idPreguntaBest);
        }
        else
        {
            BestDAO.deletetBest(idPreguntaBest);
           // System.out.println("idPreguntaBest no " + idPreguntaBest);
        }

            

       
     
        // response.sendRedirect("UsersController");
    }

}
