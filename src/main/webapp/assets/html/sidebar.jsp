<%-- 
    Document   : sidebar
    Created on : 17/05/2021, 09:31:35 AM
    Author     : teb - https://github.com/Yu-Tony
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<body>



<div class="container-fluid" >
  <div class="row d-flex d-md-block flex-nowrap wrapper" >
      <div class="col-md-3 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
          <div class="list-group border-0 text-center text-md-left">

              <a href="#menu2" class="list-group-item d-inline-block collapsed" data-toggle="collapse" aria-expanded="false"><i class="fas fa-book-open"></i> <span class="d-none d-md-inline">Categorias </span></a>
              <div class="collapse" id="menu2" data-parent="#sidebar">
                  

                  
                  <c:forEach var="categ" items="${categorias}">
                       <a href="#" class="list-group-item" data-parent="#menu2">${categ.nombre}</a>
                  </c:forEach>

              </div>

              <a href="#menu3" class="list-group-item d-inline-block collapsed" data-toggle="collapse" aria-expanded="false"><i class="fas fa-question"></i> <span class="d-none d-md-inline">Preguntas </span></a>
              <div class="collapse" id="menu3" data-parent="#sidebar">
                  <a href="#" class="list-group-item" data-parent="#menu3">3.1</a>
                  <a href="#menu3sub2" class="list-group-item" data-toggle="collapse" aria-expanded="false">3.2 </a>
                  <div class="collapse" id="menu3sub2">
                      <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 a</a>
                      <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 b</a>
                      <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 c</a>
                  </div>
                  <a href="#" class="list-group-item" data-parent="#menu3">3.3</a>
              </div>

              <a href="#menu4" class="list-group-item d-inline-block collapsed" data-toggle="collapse" aria-expanded="false"><i class="fas fa-tags"></i><span class="d-none d-md-inline">Tags </span></a>
              <div class="collapse" id="menu4" data-parent="#sidebar">
                  <a href="#" class="list-group-item" data-parent="#menu4">3.1</a>
                  <a href="#menu4sub2" class="list-group-item" data-toggle="collapse" aria-expanded="false">3.2 </a>
                  <div class="collapse" id="menu4sub2">
                      <a href="#" class="list-group-item" data-parent="#menu4sub2">3.2 a</a>
                      <a href="#" class="list-group-item" data-parent="#menu4sub2">3.2 b</a>
                      <a href="#" class="list-group-item" data-parent="#menu4sub2">3.2 c</a>
                  </div>
                  <a href="#" class="list-group-item" data-parent="#menu4">3.3</a>
              </div>

              <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fas fa-users"></i> <span class="d-none d-md-inline">Usuarios</span></a>
              <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fas fa-info-circle"></i><span class="d-none d-md-inline">Ayuda</span></a>
             
          </div>
      </div>
     
  </div>
</div>


</body>

