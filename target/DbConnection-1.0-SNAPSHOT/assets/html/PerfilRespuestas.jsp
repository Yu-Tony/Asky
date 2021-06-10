<%-- 
    Document   : PerfilRespuestas
    Created on : 10 jun. 2021, 0:06:29
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
    
<c:forEach var ="respuestas" items="${UserAnswers}">
  <div class="row MainRow" >

    <div class="col-sm-3">

    </div>


    <!--QUIESTIONS-->
    <div class="col-sm-8" >
    <div class="container question" style="background-color: #ffffff; margin-bottom: 2%; padding: 5%;">
        <!--NAME-->
        <div class="row">
            <div class="col-2"> <img src="https://www.edmundsgovtech.com/wp-content/uploads/2020/01/default-picture_0_0.png" alt="Avatar" style="max-width: 100%;" /></div>
            <div class="col-4"> <h6 style="padding-top: 10%;">${respuestas.usuario}</h6></div>
            <div class="col-4"><i class="far fa-calendar-alt" style="padding-top: 7%;"></i> ${respuestas.fecha_Respuesta}</div>
            
            <div class="col-1" id="check-comment"><i class="far fa-check-square"></i></div>
            <div class="col-1" id="delete-comment">
              
              <!-- Button trigger modal -->

                  <i class="fas fa-trash-alt"  data-toggle="modal" data-target=".exampleModalCenter1"></i>


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
            <h6>${respuestas.contenido}</h6>
            </div>
            <div class="col-2">
                <h6>Editado</h6>
            </div>
        </div>

        <div class="row">
            <div class="col-10"></div>
            
            <div class="col-2">
              <p>
                <button class="btn btn-outline-primary" type="button" data-toggle="collapse" data-target="#collapseEditA" aria-expanded="false" aria-controls="collapseEditA">
                  Editar
                </button>
              </p>

              
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
          
        </div>
        <div class="col-4">
            TAGS
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
    <div id="includeRightSideBar"></div>
    </div>
</div>
  </c:forEach>
</body>
</html>
