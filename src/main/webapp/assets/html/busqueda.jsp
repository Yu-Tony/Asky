<%-- 
    Document   : busqueda
    Created on : 16 may. 2021, 22:46:59
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
  <link rel="stylesheet" href="../css/navbar.css" />
  <link rel="stylesheet" href="../css/Home.css">
  <link rel="stylesheet" href="../css/sidebar.css">
  <link rel="stylesheet" href="../css/paginacion.css">

    <!--JS-->
  <script src="../js/NavBar.js"></script>



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
        

      /*------------TOGGLE LIKE/DISLIKE CON NUMERO---------------*/
      $('.like').click(function() 
      {
        var val = parseInt($(this).text(), 10);
        var val3 =  parseInt($(this).parent().parent().find(".idPregunta").text(), 10); 
    
        $(this).parent().parent().find(".IDthisPregunta").text(val3);
        var val4 =  parseInt($(this).parent().parent().find(".IDthisPregunta").text(), 10);
         var val5 =  $(this).parent().parent().find(".nombrePersona").text(); 
  
        /*REVISA SI ALGO M??S YA EST?? SELECCIONADO*/
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
      $("#includeFooter").load("footer.jsp"); 
    });

    $(function(){
      $("#includePagination").load("paginacion.html"); 
    });

    $(function(){
      $("#includeSidebar").load("sidebar.jsp"); 
    });

    $(function(){
      $("#includeNavBar").load("navbar.jsp"); 
    });


  </script>

  <!--NAVBAR-->
  

 <div id="includeNavBar"></div>


  <div id="includeSidebar"></div>

  

  <!--PREGUNTAS-->
  <div class="container" style="margin-top: 2%;">

    <div class="row" style="padding-left: 2%;">
        <div class="col-sm-3"></div>

        <div class="col-sm-8">

            <div class="row">
            <h1>Search Results</h1>
            </div>

            <div class="row">

                <div class="col-10">
                    <h2 class="lead">
                    <strong class="text" style="color: #3466aa; font-size: 120%">3</strong>
                    results were found for the search for
                    <strong class="text" style="color: #3466aa; font-size: 120%">NCT</strong >
                    </h2>
                </div>

                <div class="col-2">

                    <p>
                        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                            <i class="fas fa-sliders-h" style="float: right"></i>
                        </button>
                    </p>
                    
                </div>

                <div class="collapse" id="collapseExample" style="margin-bottom: 2%;">
                        <div class="card card-body">
                            <form>
                                <div class="container advanced-search">
                        
                                <div class="row">
                                    <div class="col-12">
                                        <label for="exampleInputEmail1">Palabra(s) a buscar</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleFormControlSelect1">Seleccionar categor??a</label>
                                        <select class="form-control" id="exampleFormControlSelect1">
                                            <option>Entretenimiento</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <label for="">Seleccionar rango de fechas</label>
                                        <input type="text" name="daterange" value="01/01/2018 - 01/15/2018" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                
                                        <label for="">Minimo Util</label>
                                        <input type="number" value="500" min="0" max="1000" step="10"/>
                        
                                    </div>
                                    <div class="col-6">
                                        <label for="">Minimo Favoritos</label>
                                        <input type="number" value="500" min="0" max="1000" step="10"/>
                                    </div>
                                </div>
                        
                                </div>
                        
                                
                                
                                <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-primary" style="margin-bottom: 5%;">Buscar</button>
                                </div>
                        
                                
                            </form>                    </div>
                </div>

            </div>


  

        </div>
    </div>
   <c:forEach var ="preguntas" items="${srchResult}">
   <div class="row">

        <div class="col-sm-3">

        </div>


        <!--QUIESTIONS-->
        <div class="col-sm-8" >
          <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
            <!--NAME-->
            <div class="row">
              <div class="col-2 "> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
              <div class="col-4"> <h6 style="padding-top: 10%;">${preguntas.usuarioPregunta}</h6></div>
              <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i>${preguntas.fecha_Pregunta}</div>
              <div class="col-1"> <i class="far fa-star fav">${preguntas.fav}</i></div>
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
                <i class="far fa-thumbs-up like likeup"> ${preguntas.util}</i>
                <i class="far fa-thumbs-down like likedown"> 0</i>
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


   <div id="includePagination"></div>

</div>

<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="fas fa-chevron-up"></i></a>
<div id="includeFooter"></div>


</body>

</html>
