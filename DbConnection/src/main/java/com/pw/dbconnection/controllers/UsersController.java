package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.utils.FileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.text.SimpleDateFormat;  

/**
 * Este servlet controlara los Usuarios, verifiquen el web.xml
 * este es el primer archivo en llamarse, alli exsite un apartado llamado
 * welcome file list donde pueden colocar que archivo quieren que sea el primero
 * en ser cargado
 * en este momento es este
 * @author magoc
 */
@WebServlet(name = "UsersController", urlPatterns = {"/UsersController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class UsersController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos los usuarios del DAO
        List<UserModel> users = UserDAO.getUsers();
        // Lo agregamos como atributo al request
        request.setAttribute("users", users);
        // Enviamos el request a index.jsp con la informacion
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
                     
        // Obtenemos el nombre debe coincidir con el name del input
        //1
        String nombre = request.getParameter("nombre");
        //2
        String apellidos = request.getParameter("apellidos");
        //3
        LocalDate date1 = LocalDate.of(2017, 1, 13); 
        java.util.Date fecha_nac = java.sql.Date.valueOf(date1);
        
        //4
        String correo = request.getParameter("correo");
        //5
        Boolean estado = true;

        //6
        String path = request.getServletContext().getRealPath("");
        // Obtenemos la Direccion donde deseamos guardarlo
        File fileSaveDir = new File(path + FileUtils.RUTE_USER_IMAGE);
        // Sino existe el directorio la creamos
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        // Obtenemos la imagen, debe coincidir con el name del input
        Part file = request.getPart("profile_pic");
        String contentType = file.getContentType();
        // Remplazamos el nombre que tiene para que no existan duplicados
        String profile_pic = file.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType);
        String fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + profile_pic;
        // Copiamos la imagen en la ruta especificada
        file.write(fullPath);
        
        //7
        String username = request.getParameter("username");
        //8
        String contrasena = request.getParameter("contrasena");
        //9
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/uuuu");
        LocalDate localDate = LocalDate.now();
        java.util.Date fecha_crea = java.sql.Date.valueOf(localDate);
        

        UserModel user = new UserModel(nombre, apellidos,fecha_nac,correo, estado, FileUtils.RUTE_USER_IMAGE + "/" + profile_pic, username, contrasena, fecha_crea);
        UserDAO.insertUser(user);
        // Retornamos al index
        response.sendRedirect("index.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
