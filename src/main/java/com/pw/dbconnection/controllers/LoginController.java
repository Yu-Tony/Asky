/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.CategoriaDAO;
import com.pw.dbconnection.dao.PreguntaDAO;
import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.CategoriaModel;
import com.pw.dbconnection.models.PreguntaModel;
import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.utils.FileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author teb - https://github.com/Yu-Tony
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class LoginController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


   
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
        
             //1
        String correo = request.getParameter("correo");
         System.out.println("correo login" + correo);
        //2
        String contrasena = request.getParameter("contrasena");
         System.out.println("pass login" + contrasena);
      
        UserModel user = new UserModel(correo, contrasena);
        UserDAO.getUser(user);
        // Retornamos al index
        
        HttpSession MomoSession = request.getSession();
        if(MomoSession!=null){
            MomoSession.setAttribute("correo", correo);
            MomoSession.setAttribute("contrase??a", contrasena);
            System.out.println("dopost session !=null");
          
        }else{
            MomoSession = request.getSession(true);
            MomoSession.setAttribute("correo", correo);
            MomoSession.setAttribute("contrase??a", contrasena);
            System.out.println("dopost session==null");
           
        }
        

        
        response.sendRedirect("UsersController");
        
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
