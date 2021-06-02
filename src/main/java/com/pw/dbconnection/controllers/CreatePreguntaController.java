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
import com.pw.dbconnection.utils.FileUtils;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author molec
 */

@WebServlet(name = "CreatePreguntaController", urlPatterns = {"/CreatePreguntaController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class CreatePreguntaController extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String Titulo = request.getParameter("qTitulo");
        //2
        String Contenido = request.getParameter("pregunta");      
        //7
        String username = "bernabe4";    
        //8
        int categoria = 1;
        //9
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/uuuu");
        LocalDate localDate = LocalDate.now();
        java.util.Date fecha_crea = java.sql.Date.valueOf(localDate);
        //PreguntaModel(String contenido, int id, String descripcion, String imagenPregunta, String usuarioPregunta, int categoriaPregunta, Date fecha_Pregunta, int fav, int util, int comentarios)
        PreguntaModel pregunta = new PreguntaModel(Titulo, Contenido, username, categoria, fecha_crea);
        PreguntaDAO.insertPregunta(pregunta);
        
        response.sendRedirect("assets/html/CrearPreguntas.jsp");        
    }
}
