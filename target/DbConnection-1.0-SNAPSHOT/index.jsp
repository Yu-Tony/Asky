
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
        
       $("#ProfileDropdown").css("visibility", "hidden");
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
      $("#includeFooter").load("assets/html/footer.html"); 
    });

    $(function(){
      $("#includePagination").load("assets/html/paginacion.html"); 
    });

    $(function(){
      $("#includeSidebar").load("assets/html/sidebar.html"); 
    });

    $(function(){
      $("#includeNavBar").load("assets/html/navbar.html"); 
    });


  </script>

 <div id="includeNavBar"></div>


  <div id="includeSidebar"></div>

  <!--PREGUNTAS-->
  <div class="container" style="margin-top: 2%;">

   <div class="row">
   
        <div class="col-sm-3">

        </div>


        <!--QUIESTIONS-->
        <div class="col-sm-8" >
          <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
            <!--NAME-->
            <div class="row">
              <div class="col-2 "> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
              <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
              <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
              <div class="col-1"> <i class="far fa-star fav">0</i></div>
            </div>
            <!--TITLE-->
            <div class="row">
              <div class="col-2"></div>
              <div class="col-10">
                <h3>Titulo de la pregunta</h3>
              </div>
            </div>
            <!--DESCRIPTION-->
            <div class="row">
              <div class="col-2"></div>
              <div class="col-10">
                <h6>Descripcion de la pregunta</h6>
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
                TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
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


      <!--QUIESTIONS-->
      <div class="col-sm-8" >
        <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
          <!--NAME-->
          <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">Nombre del Usuario</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> Fecha</div>
            <div class="col-1"> <i class="far fa-star fav">0</i></div>
          </div>
          <!--TITLE-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h3>Titulo de la pregunta</h3>
            </div>
          </div>
          <!--DESCRIPTION-->
          <div class="row">
            <div class="col-2"></div>
            <div class="col-10">
              <h6>Descripcion de la pregunta</h6>
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
              TAGS
            </div>
          </div>

          <hr>
        </div>
      </div>

      

      <div class="col-sm-1">
        <div id="includeRightSideBar"></div>
      </div>
   </div>

   <div id="includePagination"></div>

</div>

<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="fas fa-chevron-up"></i></a>

<div id="includeFooter"></div>


</body>

</html>