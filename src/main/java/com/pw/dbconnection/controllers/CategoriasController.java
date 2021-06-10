/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.PreguntaDAO;
import com.pw.dbconnection.models.PreguntaModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author teb - https://github.com/Yu-Tony
 */
@WebServlet(name = "CategoriasController", urlPatterns = {"/CategoriasController"})
public class CategoriasController extends HttpServlet {

    
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
  HttpSession MomoSession = request.getSession(false);
        String a=null;

        if(MomoSession!=null){
          a = (String)MomoSession.getAttribute("srchString");
         // request.setAttribute("categResult", a);
        }
        else{
            MomoSession = request.getSession(true);  
        }
        
 
          
       // System.out.println("idk por que se imprime esto" +nombre);
        
          String spageid1=request.getParameter("page"); 
         if(spageid1==null)
         {
             spageid1 = "1";
               
  System.out.println("pagina numero " +spageid1);  
         }

        int pageid1=Integer.parseInt(spageid1);  
        int total1=10;  

        if(pageid1==1){}  
        else{  
            pageid1=pageid1-1;  
            pageid1=pageid1*total1+1;  
        }  
        spageid1 = Integer.toString(pageid1);
       
        spageid1 = Integer.toString(pageid1);
     
        List<PreguntaModel> Preguntas = PreguntaDAO.getPreguntasCategoria(a,spageid1);
        
        if(Preguntas!=null)
        {
               if(MomoSession!=null){
 
            MomoSession.setAttribute("categResult", Preguntas);
            System.out.println("chica " + Preguntas.get(0).getContenido());
            }
            else{
                MomoSession = request.getSession(true);
                MomoSession.setAttribute("categResult", Preguntas);  
              System.out.println("bom " + Preguntas.get(0).getContenido());
        }
        }
        // System.out.println("cosa a buscar en doget de categorias " + Preguntas.get(0).getContenido());
         
    

       //response.sendRedirect("success.jsp");
         RequestDispatcher aDispatcher = request.getRequestDispatcher("assets/html/categorias.jsp");
         aDispatcher.forward(request,response);
          // request.getRequestDispatcher("categorias.jsp").forward(request, response);
      
    }

  /*System.out.println("entro a categ controller doPost");
           String nombreCategoria = request.getParameter("categoriaSelected");
        System.out.println("nombre de categoria en controller " + nombreCategoria);*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String nombreCategoria = request.getParameter("categoriaSelected");
        //String nombre = request.getParameter("busqueda");
        // System.out.println("cosa a buscar en dopost " + nombreCategoria);

 
        List<PreguntaModel> Preguntas = PreguntaDAO.getPreguntasCategoria(nombreCategoria, "1");
         
       
        //request.setAttribute("categResult", Preguntas);
        HttpSession MomoSession = request.getSession(false);
        if(MomoSession!=null){
            MomoSession.setAttribute("srchString", nombreCategoria);
            MomoSession.setAttribute("categResult", Preguntas);
          
        }
        else{
            MomoSession = request.getSession(true);
            MomoSession.setAttribute("srchString", nombreCategoria);
            MomoSession.setAttribute("categResult", Preguntas);  
        }
        
        response.sendRedirect("CategoriasController");
            
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
