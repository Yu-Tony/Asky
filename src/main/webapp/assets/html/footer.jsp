<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<body>
    <!--FOOTER-->
    <footer class="text-center text-white" style="background-color: #1C1C1C;">
      <div class="row my-5 justify-content-center py-5">
          <div class="col-11">
              <div class="row ">
                  <div class="col-xl-8 col-md-4 col-sm-4 col-12 my-auto mx-auto a">
                      <h3 class="text-muted mb-md-0 mb-5 navbar-brand" style="font-size: 80px;">ASKY</h3>
                  </div>
                  <div class="col-xl-2 col-md-4 col-sm-4 col-12">
                      <h6 class="mb-3 mb-lg-4 bold-text "><b>CATEGORIAS</b></h6>
                      <ul class="list-unstyled mb-0">
                          
                        <c:forEach var="categ" items="${categorias}">
                            <li>
                                <a href="#!" class="text-white">${categ.nombre}</a>
                            </li>
                        </c:forEach>
 
                        
                      </ul>

                  </div>
                  <div class="col-xl-2 col-md-4 col-sm-4 col-12">
                    <div class="row" style="margin-bottom: 1%;">                    
                      <h6 class="mt-55 mt-2 text-muted bold-text"><b>TEB SOTO</b></h6>
                    </div>
                    <div class="row" style="margin-bottom: 10%;">                    
                     <small> <span><i class="fa fa-envelope" aria-hidden="true"></i></span> EstebanSM6@outlook.com</small>
                    </div>

                    <div class="row" style="margin-bottom: 1%;">                    
                      <h6 class="mt-55 mt-2 text-muted bold-text"><b>MANUEL ZU?IGA</b></h6>
                    </div>
                    <div class="row" style="margin-bottom: 10%;">                    
                     <small> <span><i class="fa fa-envelope" aria-hidden="true"></i></span> moleconpollo1@gmail.com</small>
                    </div>

                  </div>
              </div>

          </div>
      </div>
  </footer>

</body>
