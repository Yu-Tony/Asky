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
  <link rel="stylesheet" href="/Asky/NavBar/NavBar.css" />
  <link rel="stylesheet" href="/Asky/Home.css">

    <!--JS-->
  <script src="/Asky/NavBar/NavBar.js"></script>
  <script src="/Asky/Home.js"></script>


    <!--FONT AWESOME  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  
    


</head>

<body style="background-color: #F1F1F1;">

  <script>
    
    $(document).ready(function() 
    {

        /*----------------LOAD CONTENT-------------------*/
        $(".getPerfilEditar").load("/Asky/Perfil/PerfilEditar.html"); 
        $(".getPerfilPreguntas").load("/Asky/Perfil/PerfilPreguntas.html"); 
        $(".getPerfilRespuestas").load("/Asky/Perfil/PerfilRespuestas.html"); 
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
     
            $(".getPerfilEditar").toggle();
            $(".getPerfilPreguntas").hide();
            $(".getPerfilRespuestas").hide();
            $('.EditPic').toggle() 
    
      });

      /*-----------------SHOW QUESTIONS--------------------*/
      $('.PerfilPregunta').click(function()
      {
     
            $(".getPerfilEditar").hide();
            $(".getPerfilPreguntas").toggle();
            $(".getPerfilRespuestas").hide();

    
      });

      /*-----------------SHOW ANSWERS--------------------*/
      $('.PerfilRespuesta').click(function()
      {
     
            $(".getPerfilEditar").hide();
            $(".getPerfilPreguntas").hide();
            $(".getPerfilRespuestas").toggle();

    
      });

      
      
    });



    $(function(){
      $("#includeFooter").load("/Asky/Footer/Footer.html"); 
    });

    $(function(){
      $("#includePagination").load("/Asky/Paginacion/paginacion1.html"); 
    });



    



  </script>

  <!--NAVBAR-->
  

  <nav class="navbar sticky-top navbar-expand-lg navbar-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation" style="background-color: #82B7DC;">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#" style="color: whitesmoke;">  <img src = '/Asky/conversation.png' style="height: 30px; margin-right: 5px;" /> ASKY</a>
  
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
        
      
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="width:400px" ">
        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
        
      </ul>

      
      <div class="inline my-2 my-lg-0">
        
       
     
      
      </div>


       

        <span class="navbar-text" style="margin-right: 2%">
         
          <ul class="navbar-nav mr-auto">
          
            <li class="nav-item">
              <button class="btn btn-outline-primary my-2 my-sm-0">Preguntar  <i class="fas fa-question"></i></button>
            </li>

            <form class="nav-item active" method="POST">
              <!-- Button trigger modal -->
              <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modalIniciar">
                Iniciar sesión
              </button>

              <!-- Modal -->
              <div class="modal fade" id="modalIniciar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                     
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body"  style="padding-left: 0px; padding-right: 0px;">
                      <div class="container-fluid">
                        <div class="row"  >
                          <div class="col-image col-lg-6">
                            <img src="/Asky/Assets/login.jpg" class="img-fluid" alt="Responsive image">
                          </div>
                
                          <div class="col-sm-12 col-md-12 col-lg-6">
                                                     
                              <div class="container">
                        
                                <div class="text-center">
                                  <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" class="img-fluid rounded-circle" alt="Responsive image" style="margin-bottom: 30px;"/>
                                  <input id="emailLI" type="text" class="form-control input-sm" placeholder="Enter Email" name="email" required autocomplete="off" required oninput="existingUsername();" /> 
                                  <input id="ps1LI" type="password" class="form-control input-sm" placeholder="Enter Password" name="password" required /> 
                                </div>

                
                               
                
                        
                                <div class="container text-center" >
                                  <div class="col-4">  <span class="psw">Forgot <a href="https://www.youtube.com/watch?v=Fc-fa6cAe2c">password?</a></span></div>
                                  <div class="col-4"> <button  type="submit" class="btn btn-primary">Login</button></div>
                                  <div class="col-4">  <label style="float: right;"> <input type="checkbox" checked="checked" name="remember" /> Remember me </label></div>

                                
                                 
                                
                                </div>
                        
                
                              </div>
                
                          </div>
                        </div>
                      </div>
                    </div>
                  
                  </div>
                </div>
              </div>
                    
            </form>

            <form class="nav-item active" method="POST">
              <!-- Button trigger modal -->
              <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modalRegistrarse">
                Registrarse
              </button>

              <!-- Modal -->
              <div class="modal fade" id="modalRegistrarse" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                     
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body"  style="padding-left: 0px; padding-right: 0px;">
                      <div class="container-fluid">
                        <div class="row"  >
                          <div class="col-image col-lg-6">
                            <img src="/Asky/Assets/signin.jpg" class="img-fluid" alt="Responsive image">
                          </div>

                          <div class="col-lg-6 col-md-12 col-sm-12 col-12">
              
                            <div class="text-center">
                              <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" class="img-fluid rounded-circle" alt="Responsive image" style="margin-bottom: 30px;"/>
                          
                              <input type="file" id="upload" hidden />
                              <label for="upload" class="btn btn-outline-primary center">Choose file</label>
                              <div class="input-group" style="margin-bottom: 15px;"> 
                        
                                <input id="firstName" type="text" class="form-control input-sm" placeholder="Enter First Name" name="FirstName" required oninput="validateFName();" />
                                <input id="lastName" type="text" class="form-control input-sm" placeholder="Enter Last Name" name="LastName" required oninput="validateLName();" /> 
                      
                              </div> 
                              <input id="mailSU" type="text" class="form-control input-sm" placeholder="Enter Email" name="email" autocomplete="off" required oninput="validateMail();"/> 
                              <input id="usernamSU" type="text" class="form-control input-sm" placeholder="Enter Username" name="username" autocomplete="off" required/> 
                              <input id="pw1SU" type="password" class="form-control input-sm" placeholder="Enter Password" name="pw1" required oninput="validatePassword();" /> 
                              <input id="pw2SU" type="password" class="form-control input-sm" placeholder="Confirm Password" name="pw2" required  oninput="validatePassword();"/>  
                              <label for="Birthday"><b>Birthday</b></label>
                              <div class="form-row">
                                 
                                <div class="form-group col-md-4">
                                  <div class="form-group">
                          
                                    <select class="form-control"  style="margin-top: 8px;">
                                      <!--NOTA HACERLO CON JS--->
                                      <option> 1</option>
                                      <option> 2</option>
                                      <option> 3</option>
                      
                                    </select>
                                  </div>
                                </div>
                      
                                <div class="form-group col-md-4">
                                  <div class="form-group">
                          
                                    <select class="form-control"  style="margin-top: 8px;">
                      
                                      <option> Jan</option>
                                      <option> Feb</option>
                                      <option> Mar</option>
                                      <option> Apr</option>
                                      <option> May</option>
                                      <option> Jun</option>
                                      <option> Jul</option>
                                      <option> Aug</option>
                                      <option> Sep</option>
                                      <option> Oct</option>
                                      <option> Nov</option>
                                      <option> Dec</option>
                      
                                    </select>
                                  </div>
                                </div>
                      
                                <div class="form-group col-md-4">
                                  <div class="form-group">
                          
                                    <select class="form-control" style="margin-top: 8px;">
                                      <!--NOTA HACERLO CON JS--->
                                      <option> 1998</option>
                                      <option> 1999</option>
                                      <option> 2000</option>
                      
                                    </select>
                                  </div>
                                </div>
                      
                              </div>

                              <div class="container" >
                                <div class="row">
                                    <div class="col-md-4 col-sm-12 text-center" style="visibility: hidden;">https://www.youtube.com/watch?v=H0_HrmPljVU</div>
                                    <div class="col-md-4 col-sm-12 text-center" > <button id = "buttonSignUp" type="submit" onclick="hideSignLog()" class="btn btn-outline-primary" style="align-self: center;">Sign In</button></div>
                                    <div class="col-md-4 col-sm-12 text-center"> <label style="float: right;"> <input type="checkbox" checked="checked" name="remember" /> Remember me </label>
                                    </div>
                                </div>
                            </div>
                            </div>

                      

              
                        </div>

                        </div>
                      </div>
                    </div>
                  
                  </div>
                </div>
              </div>
                    
            </form>



            <div class="dropdown">
              <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
               <img src="https://64.media.tumblr.com/0ec4ce1891988685d8e0fde02613e879/360aba19a5843b67-af/s640x960/eb66bc39b8a25fefb7b489237fccd01fb6bdc297.jpg" style="max-width: 25px;">
                 <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
                <a href="#" class="dropdown-item"><i class="fas fa-user"></i></i> Profile</a>
                <a href="#" class="dropdown-item"><i class="fa fa-sliders"></i> Settings</a>
                <div class="divider dropdown-divider"></div>
                <a href="#" class="dropdown-item"><i class="fas fa-sign-out-alt"></i>Logout</a>

              </ul>
            </div>
          </ul>
        </span>




    </div>
  </nav>

  <!--Ventana modal de Log In-->
  <div id="id01" class="modal">
    <form class="modal-content animate" action="UserControllerLogIn" method="POST">

      <div class="container" style="background-color: white;">

        <div class="row">
         
          <div class="col-image col-lg-6">
            <img src="https://i.pinimg.com/originals/97/77/4b/97774b381943e06f38abced86a009fef.jpg" class="responsive-image " alt="Responsive image">

          </div>

          <div class="col-sm-12 col-md-12 col-lg-6">
              <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
        
              <div class="container">
        
                <div class="imgcontainer">
            
                  <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar"
                    class="avatar" />
                  <div class="container">
                   
                  </div>
                </div>

                <input id="emailLI" type="text" class="form-control input-sm" placeholder="Enter Email" name="email" required autocomplete="off" required oninput="existingUsername();" /> 
                <input id="ps1LI" type="password" class="form-control input-sm" placeholder="Enter Password" name="password" required /> 

        
                <div class="container" style="text-align: center;">
                  <span class="psw">Forgot <a href="https://www.youtube.com/watch?v=Fc-fa6cAe2c">password?</a></span>
                  <button  type="submit" onclick="hideSignLog()" class="btn btn-primary">Login</button>
                  <label style="float: right;"> <input type="checkbox" checked="checked" name="remember" /> Remember me </label>
                </div>
        

              </div>

          </div>

          
        </div>

      </div>


      <div class="container" style="background-color: #242222">
        <button type="button" style="float: right;" onclick="document.getElementById('id01').style.display = 'none'" type="button"class="btn btn-outline-primary">Cancel </button>
       
      </div>

    </form>
  </div>

  <!--Ventana modal de Sign In-->
  <div id="id02" class="modal">

    <form id ="formSignUp" class="modal-content animate" action="UserControllerSignIn" method="post" onsubmit="return checkForm(this);">

      <div class="container" style="background-color: white;">

        <div class="row">
         
          <div class="col-image col-lg-6 ">
            <img src="https://i.pinimg.com/originals/97/77/4b/97774b381943e06f38abced86a009fef.jpg" class="responsive-image " alt="Responsive image">

          </div>

          <div class="col-lg-6 col-md-12 col-sm-12 col-12">
              <span onclick="document.getElementById('id02').style.display = 'none'" class="close" title="Close Modal">&times;</span>

              <div class="imgcontainer">
            
                <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar"
                  class="avatar" />
                <div class="container">
                  <input type="file" id="upload" hidden />
                  <label for="upload" class="btn btn-primary center">Choose file</label>
                </div>
              </div>
        
              <div class="container">
        
                <div class="input-group" style="margin-bottom: 5px;"> 
          
                  <input id="firstName" type="text" class="form-control input-sm" placeholder="Enter First Name" name="FirstName" required oninput="validateFName();" />
                  <input id="lastName" type="text" class="form-control input-sm" placeholder="Enter Last Name" name="LastName" required oninput="validateLName();" /> 
        
                </div> 
            
                <input id="mailSU" type="text" class="form-control input-sm" placeholder="Enter Email" name="email" autocomplete="off" required oninput="validateMail();"/> 
                <input id="usernamSU" type="text" class="form-control input-sm" placeholder="Enter Username" name="username" autocomplete="off" required/> 
                <input id="pw1SU" type="password" class="form-control input-sm" placeholder="Enter Password" name="pw1" required oninput="validatePassword();" /> 
                <input id="pw2SU" type="password" class="form-control input-sm" placeholder="Confirm Password" name="pw2" required  oninput="validatePassword();"/> 
        
        
                <label for="Birthday"><b>Birthday</b></label>
                <div class="form-row">
                   
                  <div class="form-group col-md-4">
                    <div class="form-group">
            
                      <select class="form-control"  style="margin-top: 8px;">
                        <!--NOTA HACERLO CON JS--->
                        <option> 1</option>
                        <option> 2</option>
                        <option> 3</option>
        
                      </select>
                    </div>
                  </div>
        
                  <div class="form-group col-md-4">
                    <div class="form-group">
            
                      <select class="form-control"  style="margin-top: 8px;">
        
                        <option> Jan</option>
                        <option> Feb</option>
                        <option> Mar</option>
                        <option> Apr</option>
                        <option> May</option>
                        <option> Jun</option>
                        <option> Jul</option>
                        <option> Aug</option>
                        <option> Sep</option>
                        <option> Oct</option>
                        <option> Nov</option>
                        <option> Dec</option>
        
                      </select>
                    </div>
                  </div>
        
                  <div class="form-group col-md-4">
                    <div class="form-group">
            
                      <select class="form-control" style="margin-top: 8px;">
                        <!--NOTA HACERLO CON JS--->
                        <option> 1998</option>
                        <option> 1999</option>
                        <option> 2000</option>
        
                      </select>
                    </div>
                  </div>
        
                </div>
        
               

                  <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-12"></div>
                        <div class="col-md-4 col-sm-12 text-center" > <button id = "buttonSignUp" type="submit" onclick="hideSignLog()" class="btn btn-primary" style="align-self: center;">Sign In</button></div>
                        <div class="col-md-4 col-sm-12"> <label style="float: right;"> <input type="checkbox" checked="checked" name="remember" /> Remember me </label>
                        </div>
                    </div>
                </div>
      

              </div>

          </div>

          <div class="container" style="background-color: #242222; margin-left: 10px; margin-right: 10px;">
            <button type="button" style="float: right;" onclick="document.getElementById('id02').style.display = 'none'" type="button" class="btn btn-outline-primary"> Cancel</button>
          </div>
          
        </div>

      </div>
    </form>

  </div>




  <!--PREGUNTAS-->
<div class="container" style="margin-top: 2%; margin-bottom: 4%;">

    <div class="row">
        <div class="col-sm-10">
          <h1>User name</h1>
          <h6>Usuario suspendido</h6>
        </div>
    </div>
     <div class="row">
        <div class="col-sm-3"><!--left col-->
          
            <div class="text-center">
            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
            <div class="EditPic" style="  display:none;">
                <h6>Upload a different photo...</h6>
                <input type="file" class="text-center center-block file-upload">
            </div>
            <button class="btn btn-primary EditProfile" style="margin-top:5%;">Editar Perfil</button>
           
   
            </div>

            </hr><br>

             
        
          <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
          <li class="list-group-item text-right PerfilPregunta"><span class="pull-left"><strong>Preguntas</strong></span> 125</li>
          <li class="list-group-item text-right PerfilRespuesta"><span class="pull-left"><strong>Respuestas</strong></span> 13</li>
          <li class="list-group-item text-right PerfilPregunta"><span class="pull-left"><strong>Util</strong></span> 13</li>
          <li class="list-group-item text-right PerfilPregunta"><span class="pull-left"><strong>No Util</strong></span> 13</li>
          <li class="list-group-item text-right PerfilPregunta"><span class="pull-left"><strong>Favoritas</strong></span> 13</li>

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
