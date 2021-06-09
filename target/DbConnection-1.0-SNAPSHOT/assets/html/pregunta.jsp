<%-- 
    Document   : pregunta
    Created on : 6/06/2021, 01:14:01 AM
    Author     : teb - https://github.com/Yu-Tony
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
  <link rel="shortcut icon" type="image/x-icon" href="/DbConnection/assets/Images/conversation.png" />

   <!--BOOTSTRAP -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
   

  <!--CSS-->
  <link rel="stylesheet" href="/DbConnection/assets/css/navbar.css" />
  <link rel="stylesheet" href="/DbConnection/assets/css/Home.css">
  <link rel="stylesheet" href="/DbConnection/assets/css/sidebar.css">
  <link rel="stylesheet" href="/DbConnection/assets/css/paginacion.css">

    <!--JS-->
  <script src="/DbConnection/assets/js/NavBar.js"></script>



    <!--FONT AWESOME  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  

        <!--DATEPICKER-->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    
        <!--DATEPICKER FUNCTION-->
        <script>
        $(function() {
          $('input[name="daterange"]').daterangepicker({
            opens: 'left'
          }, function(start, end, label) {
            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
          });
        });
        </script>


</head>

<body style="background-color: #F1F1F1;">
    
  <script>

$(document).ready(function() 
    {   
        
        $(function(){
           // alert($('#blablabla').text());
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
      
       /*------------TOGGLE LIKE/DISLIKE CON NUMERO RESPUESTA---------------*/
        $('.likeR').click(function() 
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
                 "./LikeRespuestaController", 
                 {usuarioPreguntaLike: val5, idPreguntaLike:val4, utilPreguntaLike: true, tipoLike:1} 
                 );
            }
            else
            {
              //https://stackoverflow.com/questions/31168646/how-to-send-data-to-servlet-using-ajax-without-a-submitting-form/31175969
          
                $.post(
                 "./LikeRespuestaController", 
                 {usuarioPreguntaLike: val5, idPreguntaLike:val4, utilPreguntaLike: true, tipoLike:2}
                 );
            }
        }
        else
        {         
            if($(this).hasClass('is-liked'))
            {
              $.post(
                 "./LikeRespuestaController", 
                 {usuarioPreguntaLike: val5, idPreguntaLike:val4, utilPreguntaLike: false, tipoLike:3});
            }
            else
            {
                $.post(
                 "./LikeRespuestaController", 
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

      /*-----------------TOOGLE PREGUNTA CORRECTA---------------------*/
      $('.fa-check-square').click(function()
      {
        
        var boxes = $('div.box');

 
        
        if($(this).hasClass('far'))
        {
             if($('.fa-check-square').hasClass('fas'))
             {
                 $('.fa-check-square').removeClass('fas');
                 $('.fa-check-square').addClass('far');
             }
          //$('.fa-check-square').removeClass('fas');
         // $(this).removeClass('fas');

          $(this).addClass('fas');
          //$('.fa-check-square').addClass('far');
            $(this).removeClass('far');
        }
        else
        {
           
             
          //$('.fa-check-square').removeClass('far');
          //$(this).removeClass('far');

          $(this).addClass('far');
          //$('.fa-check-square').addClass('fas');
            $(this).removeClass('fas');
        }

      });

      /*-----------------BORRAR RESPUESTA---------------------*/
      $('.BorrarA').click(function()
      {
       
        $(this).closest('.question').text("Respuesta Eliminada");
        $(this).closest('.MainRow').remove();


      });

      /*-----------------BORRAR PREGUNTA---------------------*/
      $('.BorrarQ').click(function(){
        window.location.href='/Asky/Error404/Error404.html';
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



        /*-----------------UPLOAD IMAGE------------*/
        $(document).ready(function() {
        if (window.File && window.FileList && window.FileReader) 
        {
            $("#files").on("change", function(e) 
            {
                var files = e.target.files,
                filesLength = files.length;
                for (var i = 0; i < filesLength; i++) 
                {
                var f = files[i]
                var fileReader = new FileReader();
                fileReader.onload = (function(e) 
                {
                    var file = e.target;
                    $("<span class=\"pip\">" +
                        "<img class=\"imageThumb\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" +
                        "<br/><span class=\"remove\">Remove image</span>" +
                        "</span>").insertAfter("#files");
                    $(".remove").click(function(){
                        $(this).parent(".pip").remove();
                    });          
                });
                    fileReader.readAsDataURL(f);
                }
            });
        }  
        else 
        {
            alert("Your browser doesn't support to File API")
        }
    });

    
  
    $(function(){
      $("#includeFooter").load("/DbConnection/assets/html/footer.jsp"); 
    });

    $(function(){
      $("#includePagination").load("/DbConnection/assets/html/paginacion.html"); 
    });

    $(function(){
      $("#includeSidebar").load("/DbConnection/assets/html/sidebar.jsp"); 
    });

    $(function(){
      $("#includeNavBar").load("/DbConnection/assets/html/navbar.jsp"); 
    });



  </script>

  <!--NAVBAR-->
  
  <div id="includeNavBar" style="top: 0;  z-index: 100; position: fixed; width: 100%;"></div>

  <div class="row" style="margin-bottom: 100px">
          <div class="col-12"></div>
      </div>


  <div id="includeSidebar"></div>

  

  <!--PREGUNTAS-->
  <div class="container" style="margin-top: 2%;">

   <div class="row">

        <div class="col-sm-3">

        </div>
       
        <c:set var = "LaPregunta" scope = "application" value = "${MostrarPregunta}"/>
        <!--QUIESTIONS-->
        <div class="col-sm-8" >
          <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
            <!--NAME-->
            <div class="row MainRow">
              <div class="col-2 "> <img src="/DbConnection/${LaPregunta.profilePregunta}" alt="Avatar" style="max-width: 100%;" /></div>
              <div  id="blablabla"class="col-4"> <h6 style="padding-top: 10%;">${LaPregunta.usuarioPregunta}</h6></div>
              <div class="col-3"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> ${LaPregunta.fecha_Pregunta}</div>
              <div class="col-1"> <i class="far fa-star fav">${LaPregunta.fav}</i></div>
              <div class="col-1" id="delete-post">

                   <c:choose>
                      <c:when test ="${LaPregunta.usuarioPregunta eq NombreUsuario}">
                        <!-- Button trigger modal -->
                        <i class="fas fa-trash-alt"  data-toggle="modal" data-target=".exampleModalCenter0"></i>
                    </c:when>
                    <c:otherwise>
                    
                    </c:otherwise>
                </c:choose>
                 
 

                 <!-- Modal -->
                 <div class="modal fade exampleModalCenter0" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                   <div class="modal-dialog modal-dialog-centered" role="document">
                     <div class="modal-content">
                       <div class="modal-header">
                         <h5 class="modal-title" id="exampleModalLongTitle">Borrar</h5>
                         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                         </button>
                       </div>
                       <div class="modal-body">
                         ¿Desea borrar esta pregunta?
                       </div>
                       <div class="modal-footer">
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                         <button type="button" class="btn btn-primary BorrarQ" data-dismiss="modal">Sí</button>
                       </div>
                     </div>
                   </div>
                 </div>


              </i></div>
            </div>
            <!--TITLE-->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                  <h3>${LaPregunta.contenido}</h3>
                </div>
                <div class="col-2">
                    
                    <c:if test="${LaPregunta.editPregunta == false}">
                         <h6 ></h6>
                    </c:if>
                    <c:if test="${LaPregunta.editPregunta== true}">
                         <h6 >Editada</h6>
                    </c:if>
                     
                      
                  
                </div>
              </div>
            <!--DESCRIPTION-->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-10">
                  <h6>${LaPregunta.descripcion}</h6>
                </div>
              </div>
              <div class="row">
                  <div class="col-10">
                  </div>
                  <div class="col-2">
                    <c:choose>
                        <c:when test ="${LaPregunta.usuarioPregunta eq NombreUsuario}">
                            <button class="btn btn-outline-primary" type="button" onclick="location.href = '/Asky/CrearPregunta/crearPregunta.html';">
                             Editar
                        </button>
                        </c:when>
                    </c:choose>
                    
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
                  
                   <div class="idPregunta" style="display: none">${LaPregunta.id}</div>
                           <div class="nombrePersona" name="nombrePersona" style="display: none">${NombreUsuario}</div>
                           <div class="IDthisPregunta" name="preguntaID" style="display: none" ></div>
                           <c:if test = "${NombreUsuario != null}">
                                <i class="far fa-thumbs-up like likeup" name="like"   > ${LaPregunta.util}</i>
                           </c:if>
                           <c:if test = "${NombreUsuario == null}">
                                <i class="far fa-thumbs-up likeup"  > ${LaPregunta.util}</i>
                           </c:if>
                           
                          
                    
                           <c:if test = "${NombreUsuario != null}">
                               <i class="far fa-thumbs-down like likedown" name="dislike"> 0</i>
                           </c:if>
                           <c:if test = "${NombreUsuario == null}">
                                 <i class="far fa-thumbs-down likedown"></i>
                           </c:if>
                                 
              </div>
              <div class="col-3">
                <i class="far fa-comment"></i>
                 ${LaPregunta.comentarios} 
              </div>
              <div class="col-4">
                  CATEGORIA: ${LaPregunta.categoriaPregunta} 
              </div>
            </div>

            <hr>
          </div>

        </div>

        

        <div class="col-sm-1">
          <div id="includeRightSideBar"></div>
        </div>
   </div>

   <div class="row">
        <div class="col-sm-3">

        </div>
        <div class="col-sm-8">
            <h3 >Respuestas</h3>
        <hr>
            
        </div>
 
   </div>

   <c:forEach var ="respuestas" items="${MostrarRespuestas}">

    <div class="row" >

        <div class="col-sm-3">

        </div>


        <!--ANSWERS-->

        
            <div class="col-sm-8" >
            <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
                <!--NAME-->
                <div class="row MainRow">
                    <div class="col-2"> <img src="/DbConnection/${respuestas.profileRespuesta}" alt="Avatar" style="max-width: 100%;" /></div>
                    <div class="col-4"> <h6 style="padding-top: 10%;">${respuestas.usuario}</h6></div>
                    <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> ${respuestas.fecha_Respuesta}</div>

                    <!--  -->
                   <c:choose>
                      <c:when test ="${LaPregunta.usuarioPregunta eq NombreUsuario}">
                         <div class="col-1" id="check-comment"><i class="far fa-check-square"></i></div>
                    </c:when>
                    <c:otherwise>
                      <div class="col-1" id="check-comment"><i class="far"></i></div>
                    </c:otherwise>
                </c:choose>
        
                  <div class="col-1" id="delete-comment">

                       <c:choose>
                      <c:when test ="${respuestas.usuario eq NombreUsuario}">
                        <!-- Button trigger modal -->
                          <i class="fas fa-trash-alt"  data-toggle="modal" data-target=".exampleModalCenter1"></i>
                    </c:when>
                    <c:otherwise>
                    
                    </c:otherwise>
                </c:choose>
                     


                        <!-- Modal -->
                        <div class="modal fade exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Borrar</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                ¿Desea borrar este comenatrio?
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                <button type="button" class="btn btn-primary BorrarA" data-dismiss="modal">Sí</button>
                              </div>
                            </div>
                          </div>
                        </div>



                    </div>
                </div>
                <!--TITLE-->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-10">

                    </div>
                </div>
                <!--DESCRIPTION-->
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                    ${respuestas.contenido}
                    </div>
                    <div class="col-2">
                       <c:if test="${respuestas.editRespuesta == false}">
                         <h6 ></h6>
                    </c:if>
                    <c:if test="${respuestas.editRespuesta== true}">
                         <h6 >Editado</h6>
                    </c:if>
                    </div>
                </div>

                <div class="row">
                    <div class="col-10"></div>

                    <div class="col-2">
                         <c:choose>
                        <c:when test ="${respuestas.usuario eq NombreUsuario}">
                           <button class="btn btn-outline-primary" type="button" data-toggle="collapse" data-target="#collapseEditA" aria-expanded="false" aria-controls="collapseEditA">
                          Editar
                        </button>
                        </c:when>
                    </c:choose>
   

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
                    <c:if test = "${NombreUsuario != null}">
                         <i class="far fa-thumbs-up likeR likeup" name="like"   > ${respuestas.util}</i>
                    </c:if>
                    <c:if test = "${NombreUsuario == null}">
                         <i class="far fa-thumbs-up likeup"  > ${LaPregunta.util}</i>
                    </c:if>
                    
                    <c:if test = "${NombreUsuario != null}">
                        <i class="far fa-thumbs-down likeR likedown" name="dislike"> 0</i>
                    </c:if>
                    <c:if test = "${NombreUsuario == null}">
                          <i class="far fa-thumbs-down likedown"></i>
                    </c:if>
                </div>
                <div class="col-3">

                </div>
                <div class="col-4">
                 
                </div>
                </div>

                <hr>
            </div>


            <div class="collapse" id="collapseEditA" style="margin-bottom: 2%;">
              <div class="card card-body">
                <form action="post_comment.php" method="post" id="commentform">
                  <div class="row">
                    <div class="col-sm-12">

                      <h5>Editar Texto</h5>
                      <textarea class="form-control" rows="5" id="pregunta" required></textarea>
                      <h5>Editar Imagenes</h5>


                      <div class="field" style="align-self:center;">
                        <input type="file" id="files" name="files[]" multiple accept="image/*" />
                      </div>   
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4" style="margin-top: 2%; margin-bottom: 4%;"> <button  type="submit"  class="btn btn-primary">Guardar Cambios</button></div>     
                   </div>


                </form>          
              </div>
            </div>

          </div>
    

        <div class="col-sm-1">
      
        </div>
    </div>
                
           </c:forEach>        

        <div class="row">

        <div class="col-sm-3">
    
        </div>
 
        <div class="col-sm-1">
          <div id="includeRightSideBar"></div>
        </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
    
            </div>
            
            <div class="col-sm-8">

                <c:if test = "${NombreUsuario != null}">
                    <form action="post_comment.php" method="post" id="commentform">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3>Leave a Comment</h3>
                                <textarea class="form-control" rows="5" id="pregunta" required></textarea>
                                <h5>Subir Imagenes</h5>
                                <div class="field" style="align-self:center;">
                                    <input type="file" id="files" name="files[]" multiple accept="image/*" />
                                </div>   
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4" style="margin-top: 2%; margin-bottom: 4%;"> <button  type="submit"  class="btn btn-primary">Publicar</button></div>     
                        </div>
                    </form>
                </c:if>
            </div>
     
       </div>
       

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

</div>


<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="fas fa-chevron-up"></i></a>
<div id="includeFooter"></div>


</body>

</html>

