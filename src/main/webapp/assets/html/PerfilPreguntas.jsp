<%-- 
    Document   : PerfilPreguntas
    Created on : 10 jun. 2021, 0:06:08
    Author     : molec
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <c:forEach var ="preguntas" items="${UserQuestions}">
    <div class="row">
    
        <div class="col-sm-3">
  
        </div>
  
  
        <!--QUIESTIONS-->
        <div class="col-sm-8" >
          <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
            <!--NAME-->
            <div class="row">
              <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
              <div class="col-4"> <h6 style="padding-top: 10%;">${preguntas.usuarioPregunta}</h6></div>
              <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> ${preguntas.fecha_Pregunta}</div>
              <div class="col-1"> <i class="far fa-star fav">0</i></div>
            </div>
            <!--TITLE-->
            <div class="row">
              <div class="col-2"></div>
              <div class="col-10">
                <h3>${preguntas.contenido}</h3>
              </div>
            </div>
            <!--DESCRIPTION-->
            <div class="row">
              <div class="col-2"></div>
              <div class="col-10">
                <h6>${preguntas.descripcion}</h6>
              </div>
            </div>
            <!--SEPARADOR 1-->
            <div class="row">
              <div class="col-2"></div>
              <div class="col-10">
              <hr>
              </div>
            </div>
            <!--LIKES-->
            <div class="row">
              <div class="col-2"></div>
              <div class="col-3">
                <i class="far fa-thumbs-up like likeup"> 0</i>
                  <i class="far fa-thumbs-down like likedown"> 0</i>
              </div>
              <div class="col-3">
                <i class="far fa-comment"></i>
                2
              </div>
              <div class="col-4">
                Categoría: ${preguntas.categoriaPregunta}
              </div>
            </div>
  
            <hr>
          </div>
        </div>

        
  

     </div>
              
  </c:forEach>
</body>
</html>
