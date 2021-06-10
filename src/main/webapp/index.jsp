
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
 
  <link rel="shortcut icon" type="image/x-icon" href="assets/Images/conversation.png" />

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
 


  <!--CSS-->
  <link rel="stylesheet" href="./assets/css/navbar.css" />
  <link rel="stylesheet" href="./assets/css/Home.css">
  <link rel="stylesheet" href="./assets/css/sidebar.css">
     <link rel="stylesheet" href="./assets/css/paginacion.css">
    <!--JS-->
  <script src="./assets/js/NavBar.js"></script>
  
  
  
    <script type="javascript">
        $(document).ready(function() 
        {   
        function OpenPregunta(myId){
          $.post("./ShowPreguntaController", {IdPregunta : myId});
          //  onclick="location.href = '/DbConnection/assets/html/pregunta.jsp';" 
          
         
        }
        });
    </script>


    <!--FONT AWESOME  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  
    


</head>

<body style="background-color: #F1F1F1;">


    
  <script>
     
    
    $(document).ready(function() 
    {
      $('.container').on('click', '.col-sm-8', function(){
          //System.out.println($(this).children('.idPregunta').text());
          $.post("./ShowPreguntaController", {IdPregunta : $(this).children('.IdMyPreg').text()});
           setTimeout(function () {
            window.location.href = '/DbConnection/assets/html/pregunta.jsp'; //will redirect to your blog page (an ex: blog.html)
           }, 500);
          //System.out.println("ESTO SALIO");
          
      });       
       
       

       
      /*------------TOGGLE LIKE/DISLIKE CON NUMERO---------------*/
      $('.like').click(function() 
      {
        var val = parseInt($(this).text(), 10);
        var val3 =  parseInt($(this).parent().parent().find(".idPregunta").text(), 10); 
    
        $(this).parent().parent().find(".IDthisPregunta").text(val3);
        var val4 =  parseInt($(this).parent().parent().find(".IDthisPregunta").text(), 10);
         var val5 =  $(this).parent().parent().find(".nombrePersona").text(); 
  
        /*REVISA SI ALGO MÁS YA ESTÁ SELECCIONADO*/
        if (($(this).hasClass('likeup'))) 
        {
            var val2= parseInt( $(this).parent().parent().find(".likedown").text(), 10);
           
         if(($(this).parent().parent().find(".likedown").hasClass('is-liked')))

          {
              $(this).parent().parent().find(".likedown").toggleClass('is-liked');

            if ($(this).parent().parent().find(".likedown").hasClass('is-liked')) 
            {
              val2++;
            } else 
            {
              if(val2 > 0)
              val2--;
            }
            
            $(this).parent().parent().find(".likedown").text(" " + val2);

          }

         
           
    
        }

        if (($(this).hasClass('likedown'))) 
        {
            var val2= parseInt( $(this).parent().parent().find(".likeup").text(), 10);
          if(($(this).parent().parent().find(".likeup").hasClass('is-liked')))
          {
           $(this).parent().parent().find(".likeup").toggleClass('is-liked');

            if ($(this).parent().parent().find(".likeup").hasClass('is-liked')) 
            {
              val2++;
            } else 
            {
              if(val2 > 0)
              val2--;
            }
            
           $(this).parent().parent().find(".likeup").text(" " + val2);

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
           
        if($(this).hasClass('likeup'))
        {
             if($(this).hasClass('is-liked'))
            {
                $.post(
                 "./LikeController", 
                 {usuarioPreguntaLike: val5, idPreguntaLike:val4, utilPreguntaLike: true, tipoLike:1} 
                 );
            }
            else
            {
              //https://stackoverflow.com/questions/31168646/how-to-send-data-to-servlet-using-ajax-without-a-submitting-form/31175969
          
                $.post(
                 "./LikeController", 
                 {usuarioPreguntaLike: val5, idPreguntaLike:val4, utilPreguntaLike: true, tipoLike:2}
                 );
            }
        }
        else
        {         
            if($(this).hasClass('is-liked'))
            {
              $.post(
                 "./LikeController", 
                 {usuarioPreguntaLike: val5, idPreguntaLike:val4, utilPreguntaLike: false, tipoLike:3});
            }
            else
            {
                $.post(
                 "./LikeController", 
                 {usuarioPreguntaLike: val5, idPreguntaLike:val4, utilPreguntaLike: false, tipoLike:4});
            }
        }

     
      
      });
      
      /*-----------------TOOGLE FAV CON NUMERO---------------------*/
      $('.fav').click(function()
      {
        
        var val = parseInt($(this).text(), 10);
         var val3 =  parseInt($(this).parent().parent().parent().find(".idPregunta").text(), 10); 
    
        $(this).parent().parent().parent().find(".IDthisPregunta").text(val3);
        var val4 =  parseInt($(this).parent().parent().parent().find(".IDthisPregunta").text(), 10);
         var val5 =  $(this).parent().parent().parent().find(".nombrePersona").text(); 
         
        $(this).toggleClass('is-fav');
        if ($(this).hasClass('is-fav')) 
        {
          val++;
          $.post(
                 "./FavController", 
                 {usuarioPreguntaFav: val5, idPreguntaFav: val4, utilPreguntaFav: true, tipoFav: 1});
        } else 
        {
          val--;
          $.post(
                 "./FavController", 
                 {usuarioPreguntaFav: val5, idPreguntaFav:val4, utilPreguntaFav: false, tipoFav:2});
        }

        $(this).text( val);
      });
      
       /*-----------------SCROLL TO TOP---------------------*/
      $(window).scroll(function () {
			if ($(this).scrollTop() > 50) {
				$('#back-to-top').fadeIn();
			} else {
				$('#back-to-top').fadeOut();
			}
		});
                
		// scroll body to 0px on click
      $('#back-to-top').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 400);
			return false;
		});
    
    });
  
  
    $(function(){
      $("#includeFooter").load("assets/html/footer.jsp"); 
    });

    $(function(){
      $("#includePagination").load("assets/html/paginacion.html"); 
    });

    $(function(){
      $("#includeSidebar").load("assets/html/sidebar.jsp"); 
    });

    $(function(){
      $("#includeNavBar").load("assets/html/navbar.jsp"); 
    });


  </script>

  
  <div id="includeNavBar" style="top: 0;  z-index: 100; position: fixed; width: 100%;"></div>

  <div class="row" style="margin-bottom: 100px">
          <div class="col-12"></div>
      </div>
  
  <div id="includeSidebar"></div>

  <!--PREGUNTAS-->
  <div class="container" style="margin-top: 2%;">

    
      <!--https://flylib.com/books/en/1.177.1.20/1/-->
 <c:set var = "NombreUsuario" scope = "application" value = "${userSession}"/>
 <c:set var = "ImagenUsuario" scope = "application" value = "${picture}"/>
 <c:set var = "EstadoUsuario" scope = "application" value = "${status}"/>
 <c:set var = "categorias" scope = "application" value = "${categoriasDB}"/>
    
    <c:forEach var ="preguntas" items="${preguntasDB}">
        <div   class="row">
   
            <div class="col-sm-3">
                    
            </div>


      <!--QUIESTIONS-->
            <div  class="col-sm-8" >
              <div class="IdMyPreg" style="display: none">${preguntas.id}</div>
              <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
                <!--NAME-->
                <div class="row">
                  <div class="col-2"> <img src="${preguntas.profilePregunta}" alt="Avatar" style="max-width: 100%;" /></div>
                 <div  class="col-4"> <a href="ProfileController?user=${preguntas.usuarioPregunta}"  style="padding-top: 10%;">${preguntas.usuarioPregunta}</a></div>
                  <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i>  ${preguntas.fecha_Pregunta}</div>
                  <c:if test = "${NombreUsuario != null}">
                    <div class="col-1"> <i class="far fa-star fav">${preguntas.fav}</i></div>
                  </c:if>
                  <c:if test = "${NombreUsuario == null}">
                     <div class="col-1"> <i class="far fa-star">${preguntas.fav}</i></div>
                  </c:if>
                 
                </div>
                <!--TITLE-->
                <div class="row">
                  <div class="col-2"></div>
                    <div id = "cont" class="col-10">
                    <div class="IdMyPreg" style="display: none">${preguntas.id}</div>
                    <h3> ${preguntas.contenido}</h3>
                  </div>
                </div>
                <!--DESCRIPTION-->
                <div class="row">
                  <div class="col-2"></div>
                  <div class="col-10">
                    <h6>     ${preguntas.descripcion}</h6>
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
                      
                     
                     
                       
                            <div class="idPregunta" style="display: none">${preguntas.id}</div>
                           <div class="nombrePersona" name="nombrePersona" style="display: none">${NombreUsuario}</div>
                           <div class="IDthisPregunta" name="preguntaID" style="display: none" ></div>
                           
                           <c:if test = "${NombreUsuario != null}">
                                <i class="far fa-thumbs-up like likeup" name="like"   > ${preguntas.util}</i>
                           </c:if>
                           <c:if test = "${NombreUsuario == null}">
                                <i class="far fa-thumbs-up likeup"  > ${preguntas.util}</i>
                           </c:if>
                           
                                <!--DISLIKE-->
                                <c:if test = "${NombreUsuario != null}">
                                <c:if test = "${EstadoUsuario}">
                                    <c:choose>
                                        <c:when test ="${preguntas.usuarioPregunta eq NombreUsuario}">
                                            <i class="far fa-thumbs-down like likedown" name="dislike"> ${preguntas.noUtil}</i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="far fa-thumbs-down like likedown" name="dislike"></i>
                                        </c:otherwise>
                                    </c:choose>
                             
                                </c:if>
                            </c:if>
                            <c:if test = "${NombreUsuario == null}">
                                       <i class="far fa-thumbs-down likedown"></i>
                            </c:if>     
                                     
                          
                    
                  
                     
               
                  </div>
                  <div class="col-3">
                    <i class="far fa-comment"></i>
                   ${preguntas.comentarios} 
                  </div>
                  <div class="col-4">
                    CATEGORIA: ${preguntas.categoriaPregunta} 
                  </div>
                </div>

                <hr>
              </div>
            </div>

      

      <div class="col-sm-1">
        <div id="includeRightSideBar"></div>
      </div>
   </div>
                                
            </c:forEach>

   
    <div class="text-center">
        <ul class="pagination">
            <li><a href="">«</a></li>
            <li><a class="active" href="UsersController?page=1">1</a></li>
            <li><a href="UsersController?page=2">2</a></li>
            <li><a href="UsersController?page=3">3</a></li>
            <li><a href="UsersController?page=4">4</a></li>
            <li><a href="UsersController?page=5">5</a></li>
            <li><a href="UsersController?page=6">6</a></li>
            <li><a href="#">»</a></li>
          </ul>
    </div>

<!--<div id="includePagination"></div>-->
   

</div>

<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="fas fa-chevron-up"></i></a>

<div id="includeFooter"></div>


</body>

</html>