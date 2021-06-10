<%-- 
    Document   : perfil
    Created on : 22 may. 2021, 2:12:28
    Author     : molec
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<!--REF NAVBAR https://epicbootstrap.com/snippets/header-blue -->
<!--DROPDOWN https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_ref_js_dropdown_multilevel_css&stacked=h -->

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ASKY</title>
  
  <link rel="shortcut icon" type="image/x-icon" href="/Asky/conversation.png" />

       <!--BOOTSTRAP -->
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
       


<!--CSS-->
  <link rel="stylesheet" href="./assets/css/navbar.css" />
<!--JS-->
  <script src="./assets/js/NavBar.js"></script>


    <!--FONT AWESOME  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  
    


</head>

<body style="background-color: #F1F1F1;">

  <script>
    
    $(document).ready(function() 
    {
         //.data("greeting", "Hello World");
        //    var misPreg = "$/{preguntonas}";
        /*----------------LOAD CONTENT-------------------*/
        $(".getPerfilEditar").load("/DbConnection/assets/html/PerfilEditar.jsp"); 
        //$(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp"); 
        $(".getPerfilPreguntas").load("greeting", "/DbConnection/assets/html/PerfilPreguntas.jsp");
        $(".getPerfilRespuestas").load("/DbConnection/assets/html/PerfilRespuestas.jsp"); 
        $(".getPerfilEditar").hide();
        $(".getPerfilPreguntas").hide();
        $(".getPerfilRespuestas").hide();

      /*------------TOGGLE LIKE/DISLIKE CON NUMERO---------------*/
      $('.like').click(function() 
      {
        var val = parseInt($(this).text(), 10);
        var val2= parseInt( $(this).siblings("i").text(), 10);
    
        /*REVISA SI ALGO MÁS YA ESTÁ SELECCIONADO*/
        if (($(this).hasClass('likeup'))) 
        {

          if(($(this).siblings("i").hasClass('is-liked')))
          {
            $(this).siblings("i").toggleClass('is-liked');

            if ($(this).siblings("i").hasClass('is-liked')) 
            {
              val2++;
            } else 
            {
              if(val2 > 0)
              val2--;
            }
            
            $(this).siblings("i").text(" " + val2);

          }
        }

        if (($(this).hasClass('likedown'))) 
        {

          if(($(this).siblings("i").hasClass('is-liked')))
          {
            $(this).siblings("i").toggleClass('is-liked');

            if ($(this).siblings("i").hasClass('is-liked')) 
            {
              val2++;
            } else 
            {
              if(val2 > 0)
              val2--;
            }
            
            $(this).siblings("i").text(" " + val2);

          }
        }

        /*APLICA EL TOGGLE AL QUE SE CLICKEO Y AUMENTA EL NUMERO*/
        $(this).toggleClass('is-liked');

        if ($(this).hasClass('is-liked')) 
        {
          val++;
        } else 
        {
          val--;
        }

        $(this).text(" " + val);
      
      });

      /*-----------------TOOGLE FAV CON NUMERO---------------------*/
      $('.fav').click(function()
      {
        
        var val = parseInt($(this).text(), 10);
        $(this).toggleClass('is-fav');
        if ($(this).hasClass('is-fav')) 
        {
          val++;
        } else 
        {
          val--;
        }

        $(this).text( val);
      });

      /*-----------------SHOW EDIT PROFILE---------------------*/
      $('.EditProfile').click(function()
      {     
          
            $.post("./ShowStuffController", {parameter : 6, usuario: $('.idUser').text()});
            setTimeout(function () {
                $(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp"); 
            }, 500);
     
            $(".getPerfilEditar").toggle();
            $(".getPerfilPreguntas").hide();
            $(".getPerfilRespuestas").hide();
            $('.EditPic').toggle() 
    
      });

      /*-----------------SHOW QUESTIONS--------------------*/
      $('.PerfilPregunta').click(function()
      {
            $.post("./ShowStuffController", {parameter : 1, usuario: $('.idUser').text()});
            setTimeout(function () {
                $(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp"); 
            }, 500);
            
            
            //onclick="location.href = '/DbConnection/assets/html/perfil.jsp';"   
            //$(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp", {preguntonas: misPreg}); 
            
           
            //$(".getPerfilPreguntas").data("yey", "/DbConnection/assets/html/PerfilEditar.jsp");  , {UserQuestions : }}
            $(".getPerfilEditar").hide();
            $(".getPerfilPreguntas").toggle();
            $(".getPerfilRespuestas").hide();

    
      });
        $('.PerfilPreguntaUtil').click(function()
      {
            $.post("./ShowStuffController", {parameter : 3, usuario: $('.idUser').text()});
            setTimeout(function () {
                $(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp"); 
            }, 500);
            
            
            //onclick="location.href = '/DbConnection/assets/html/perfil.jsp';"   
            //$(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp", {preguntonas: misPreg}); 
            
           
            //$(".getPerfilPreguntas").data("yey", "/DbConnection/assets/html/PerfilEditar.jsp");  , {UserQuestions : }}
            $(".getPerfilEditar").hide();
            $(".getPerfilPreguntas").toggle();
            $(".getPerfilRespuestas").hide();

    
      });
        $('.PerfilPreguntaNoUtil').click(function()
      {
            $.post("./ShowStuffController", {parameter : 4, usuario: $('.idUser').text()});
            setTimeout(function () {
                $(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp"); 
            }, 500);
            
            
            //onclick="location.href = '/DbConnection/assets/html/perfil.jsp';"   
            //$(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp", {preguntonas: misPreg}); 
            
           
            //$(".getPerfilPreguntas").data("yey", "/DbConnection/assets/html/PerfilEditar.jsp");  , {UserQuestions : }}
            $(".getPerfilEditar").hide();
            $(".getPerfilPreguntas").toggle();
            $(".getPerfilRespuestas").hide();

    
      });
      
      $('.PerfilPreguntaFav').click(function()
      {
            $.post("./ShowStuffController", {parameter : 5, usuario: $('.idUser').text()});
            setTimeout(function () {
                $(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp"); 
            }, 500);
            
            
            //onclick="location.href = '/DbConnection/assets/html/perfil.jsp';"   
            //$(".getPerfilPreguntas").load("/DbConnection/assets/html/PerfilPreguntas.jsp", {preguntonas: misPreg}); 
            
           
            //$(".getPerfilPreguntas").data("yey", "/DbConnection/assets/html/PerfilEditar.jsp");  , {UserQuestions : }}
            $(".getPerfilEditar").hide();
            $(".getPerfilPreguntas").toggle();
            $(".getPerfilRespuestas").hide();

    
      });

      /*-----------------SHOW ANSWERS--------------------*/
      $('.PerfilRespuesta').click(function()
      {
            $.post("./ShowStuffController", {parameter : 2, usuario: $('.idUser').text()});
            setTimeout(function () {
                $(".getPerfilRespuestas").load("/DbConnection/assets/html/PerfilRespuestas.jsp"); 
            }, 500);
            $(".getPerfilEditar").hide();
            $(".getPerfilPreguntas").hide();
            $(".getPerfilRespuestas").toggle();

    
      });

      
      
    });



    $(function(){
      $("#includeFooter").load("/assets/html/footer.jsp"); 
    });

    $(function(){
      $("#includePagination").load("/assets/html/paginacion.html"); 
    });

    $(function(){
      $("#includeNavBar").load("assets/html/navbar.jsp"); 
    });

    



  </script>

<div id="includeNavBar" style="top: 0;  z-index: 100; position: fixed; width: 100%;"></div>

  <div class="row" style="margin-bottom: 100px">
       <div class="col-12"></div>
   </div>


<!--PREGUNTAS-->
 <c:set var = "miUsuario" value = "${usuario}"/>
  <!--PREGUNTAS-->
<div class="container" style="margin-top: 2%; margin-bottom: 4%;">
<div class="idUser" style="display: none">${miUsuario.username}</div>
    <div class="row">
        <div class="col-sm-10">
          <h1>${miUsuario.username}</h1>
        <c:if test = "${miUsuario.estado == false}">
          <h6>Usuario suspendido</h6>
         </c:if>
          <c:if test = "${miUsuario.estado == true}">
          <h6>Usuario Activo</h6>
         </c:if>
        </div>
    </div>
     <div class="row">
        <div class="col-sm-3"><!--left col-->
          
            <div class="text-center">
            <img src="assets/Images/poppy.png" class="avatar img-circle img-thumbnail" alt="avatar">
            <div class="EditPic" style="  display:none;">
                <h6>Upload a different photo...</h6>
                <input type="file" class="text-center center-block file-upload">
            </div>
            <c:if test = "${dueño eq true}">
                <button class="btn btn-primary EditProfile" style="margin-top:5%;">Editar Perfil</button>
            </c:if>
   
            </div>

            </hr><br>

             
        <c:choose>
            <c:when test ="${dueño eq true}">
                <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                <li class="list-group-item text-right PerfilPregunta"><span class="pull-left"><strong>Preguntas</strong></span> ${miUsuario.preguntas}</li>
                <li class="list-group-item text-right PerfilRespuesta"><span class="pull-left"><strong>Respuestas</strong></span> ${miUsuario.respuestas}</li>
                <li class="list-group-item text-right PerfilPreguntaUtil"><span class="pull-left"><strong>Util</strong></span> ${miUsuario.utils}</li>
                <li class="list-group-item text-right PerfilPreguntaNoUtil"><span class="pull-left"><strong>No Util</strong></span> 0</li>
                <li class="list-group-item text-right PerfilPreguntaFav"><span class="pull-left"><strong>Favoritas</strong></span> ${miUsuario.favs}</li>

            </c:when>
             <c:otherwise>
                <li class="list-group-item text-right PerfilPregunta"><span class="pull-left"><strong>Preguntas</strong></span> ${miUsuario.preguntas}</li>
                <li class="list-group-item text-right PerfilRespuesta"><span class="pull-left"><strong>Respuestas</strong></span> ${miUsuario.respuestas}</li>
            </c:otherwise>
        </c:choose>
          

        </div><!--/col-3-->

        <div class="col-sm-9">
          
            <div class="getPerfilEditar"></div>
            <div class="getPerfilPreguntas"></div>
            <div class="getPerfilRespuestas"></div>

           
        </div><!--/tab-content-->

    </div><!--/col-9-->

  

</div>


<div id="includeFooter"></div>


</body>

</html>
