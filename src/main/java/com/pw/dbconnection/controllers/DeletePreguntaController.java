/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.LikeDAO;
import com.pw.dbconnection.dao.PreguntaDAO;
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
@WebServlet(name = "DeletePreguntaController", urlPatterns = {"/DeletePreguntaController"})
public class DeletePreguntaController extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        
         
    }
    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
      int idPregunta =Integer.parseInt(request.getParameter("idPreguntaBorrar"));

      PreguntaDAO.deletePregunta(idPregunta);

      System.out.println("hace el request a doGet" );
      response.sendRedirect("/DbConnection/UsersController");
    }


}
