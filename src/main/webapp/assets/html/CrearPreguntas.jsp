<%-- 
    Document   : CrearPreguntas
    Created on : 1/06/2021, 11:55:44 PM
    Author     : teb - https://github.com/Yu-Tony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<!--REF NAVBAR https://epicbootstrap.com/snippets/header-blue -->
<!--DROPDOWN https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_ref_js_dropdown_multilevel_css&stacked=h -->
<!--UPLOAD IMAGE REF https://stackoverflow.com/questions/37205438/image-upload-with-preview-and-delete-option-javascript-jquery-->
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
  <link rel="stylesheet" href="../css/crearPregunta.css">



  <!--JS-->
    <script src="../js/NavBar.js"></script>

    <!--FONT AWESOME  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  


</head>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<body style="background-color: #F1F1F1;">

  <script>
    
  
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

     /*-----------------TOOLTIP INPUT------------*/
     $(document).ready(function() {
  $('input[rel="txtTooltip"]').tooltip();
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

    <div class="row">
     
        <div class="col-sm-3">


        </div>

        <div class="col-sm-1">

        </div>

        <!--QUIESTIONS-->
        <div class="col-sm-7" style="margin-bottom: 5%;">
     
          <form class="modal-content animate" action="./CreatePreguntaController" method="POST">
  
              <div class="container" style="background-color: white;">
        
                <div class="row">
                 
    
        
                  <div class="col-12" style="display: inline-block;">
          <h2> Realiza una pregunta.</h2>
                  
                  <hr>
                      
                      <label for="titulo" style="  display: inline-block;">Titulo de la pregunta</label>
                        <input id = "qTitulo" class="form-control input" name="titulo" required autocomplete="off" /> 

                        <label for="pregunta" style="  display: inline-block;">Descripción</label>
                        <textarea class="form-control" rows="5" id="pregunta" required></textarea>

                        <!--<label for="tags" style="  display: inline-block;">Tags</label>

                        <input class="form-control input" name="tags" required type="text" rel="txtTooltip" title="Tags separados por comas ' , '"  data-toggle="tooltip" data-placement="bottom" /> 
                         --> 
      

                        <label for="sel1">Categoria </label>
                        <select class="form-control" id="sel1" required>
                            
                             <c:forEach var="categ" items="${categorias}">
                                <li>
                                   <option>${categ.nombre}</option>
                                </li>
                            </c:forEach>

                        </select>

                        
                          <label style="  display: inline-block;">Subir imagen</label>
                
                     
                          <div class="field" style="align-self:center;">
                            <input type="file" id="files" name="files[]" multiple accept="image/*" />
                          </div>                
             


                        <div class="container" style="text-align: center; margin-bottom: 2%; margin-top: 3%;">
                          <button  type="submit"  class="btn btn-primary">Publicar Pregunta</button>
                        </div>
                
        
                  </div>
        
                  
                </div>
        
              </div>
        
        
    
        
            </form>

        </div>

        

    </div>



</div>


<div id="includeFooter"></div>


</body>

</html>
