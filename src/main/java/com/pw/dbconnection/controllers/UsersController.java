package com.pw.dbconnection.controllers;

import com.mysql.cj.log.Log;
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
import javax.servlet.http.HttpSession;


@WebServlet(name = "UsersController", urlPatterns = {"/UsersController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class UsersController extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         System.out.println("Entro a doget qwq");
        HttpSession MomoSession = request.getSession(false);
        String a=null;
        String b=null;
       
        if(MomoSession!=null){
          a = (String)MomoSession.getAttribute("correo");
          b = (String)MomoSession.getAttribute("contraseña");
           request.setAttribute("userSession", a);
          request.setAttribute("pass",  b);
           System.out.println(a);
         
        System.out.println(a);
        }
        else{
            MomoSession = request.getSession(true);
             request.setAttribute("userSession", a);
          request.setAttribute("pass",  b);
           System.out.println(a);
           
        }
        
        // Obtenemos las Preguntas del DAO
        List<PreguntaModel> Preguntas = PreguntaDAO.getPreguntas();
        List<CategoriaModel> Categorias = CategoriaDAO.getCategorias();
        // Lo agregamos como atributo al request
        request.setAttribute("preguntasDB", Preguntas);
        request.setAttribute("categoriasDB", Categorias);
        
    
        request.getRequestDispatcher("index.jsp").forward(request, response);
      // request.getRequestDispatcher("UserController");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                      System.out.println("Entro a doPost");
        // Obtenemos el nombre debe coincidir con el name del input
        //1
        String nombre = request.getParameter("nombre");
        //2
        String apellidos = request.getParameter("apellidos");
        //3
        int year = Integer.parseInt(request.getParameter("YearSelected"));
        int month = Integer.parseInt(request.getParameter("MonthSelected"));
        int day = Integer.parseInt(request.getParameter("DaySelected"));
        
        //String year = request.getParameter("YearSelected");
        //String month = request.getParameter("MonthSelected");
        //String day = request.getParameter("DaySelected");
        
        LocalDate date1 = LocalDate.of(year, month, day); 
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
        //C:\Users\Nahom\OneDrive\Escritorio\PrograWeb\Proyecto\Proyecto_PW1\DbConnection\target\DbConnection-1.0-SNAPSHOT\assets\Images
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
        int result = UserDAO.insertUser(user);
        
        // Retornamos al index
        
       if(result==1)
       {
            /*HttpSession MomoSession = request.getSession();
            if(MomoSession!=null)
            {
                MomoSession.setAttribute("correo", correo);
                MomoSession.setAttribute("contraseña", contrasena);
               // System.out.println("dopost session !=null");

            }
            else
            {
                MomoSession = request.getSession(true);
                MomoSession.setAttribute("correo", correo);
                MomoSession.setAttribute("contraseña", contrasena);
                //System.out.println("dopost session==null");

            }*/
        
             PrintWriter out = response.getWriter();  
            response.setContentType("text/html");  
            out.println("<script type=\"text/javascript\">");  
            out.println("alert('Bienvenido');");  
            out.println("</script>");
            
            response.setHeader("Refresh", "1; URL=UsersController");
           //response.sendRedirect("UsersController");
       }
       else
       {
           //https://stackoverflow.com/questions/4064605/java-servlets-open-message-popup
           //https://coderanch.com/t/357276/java/Servlet-Redirect-time-delay
           PrintWriter out = response.getWriter();  
            response.setContentType("text/html");  
            out.println("<script type=\"text/javascript\">");  
            out.println("alert('El nombre de usuario ya está en uso');");  
            out.println("</script>");
            
            response.setHeader("Refresh", "1; URL=UsersController");
            //response.sendRedirect("UsersController");
       }
             
        
 
  
        
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
