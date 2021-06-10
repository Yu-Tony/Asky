<%-- 
    Document   : PerfilEditar
    Created on : 10 jun. 2021, 0:06:48
    Author     : molec
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <c:set var = "datos" value = "${DatosUsuario}"/>
    <div class="tab-content">
        <div class="tab-pane active" id="home">
            <hr>
              <form class="form" action="##" method="post" id="registrationForm">
                
                      <div class="row">
                        <div class="col-6" style="display: block;">
                            <label for="first_name"><h4>First name</h4></label>
                            <input type="text" class="form-control" name="first_name" id="first_name" placeholder="${datos.nombre}" title="enter your first name if any.">
                        </div>
                        <div class="col-6" style="display: block;">
                          <label for="last_name"><h4>Last name</h4></label>
                            <input type="text" class="form-control" name="last_name" id="last_name" placeholder="${datos.apellidos}" title="enter your last name if any.">
                        </div>
                      </div>
                     
                

                 <div class="row">
                    <div class="col-6" style="display: block;">
                          <label for="email"><h4>Email</h4></label>
                          <input type="email" class="form-control" name="email" id="email" placeholder="${datos.correo}" title="enter your email.">
                      </div>
                
                 
                      
                      <div class="col-6" style="display: block;">
                          <label for="email"><h4>Username</h4></label>
                          <input type="email" class="form-control" id="location" placeholder="${datos.username}" title="enter your usermail">
                      </div>
                 
                 </div>
                      
                 <div class="row">
                    <div class="col-6" style="display: block;">
                          <label for="password"><h4>Password</h4></label>
                          <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                      </div>
                 
                
                      
                      <div class="col-6" style="display: block;">
                        <label for="password2"><h4>Verify</h4></label>
                          <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                      </div>
                 </div>
                      
                  
               
                <div class="row">
<div class="col-6" style="display: block;">
                        <label for=""><h4>Birthday</h4></label>
                        <div class="form-row">
               
                            <div class="form-group col-md-4">
                              <div class="form-group">
                      
                                <select class="form-control" id="exampleFormControlSelect1" style="margin-top: 8px;">
                                  <!--NOTA HACERLO CON JS--->
                                  <option> 1</option>
                                  <option> 2</option>
                                  <option> 3</option>
                  
                                </select>
                              </div>
                            </div>
                  
                            <div class="form-group col-md-4">
                              <div class="form-group">
                      
                                <select class="form-control" id="exampleFormControlSelect1" style="margin-top: 8px;">
                  
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
                      
                                <select class="form-control" id="exampleFormControlSelect1" style="margin-top: 8px;">
                                  <!--NOTA HACERLO CON JS--->
                                  <option> 1998</option>
                                  <option> 1999</option>
                                  <option> 2000</option>
                  
                                </select>
                              </div>
                            </div>
                  
                          </div>
                    </div>
                </div>
                 
                      
             
                

                  <div class="form-group">
                       <div class="col-xs-12">
                            <br>
                              <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                               <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                        </div>
                  </div>
              </form>
          
          <hr>
          
         </div><!--/tab-pane-->
         <div class="tab-pane" id="messages">
           
           <h2></h2>
           
           <hr>
              <form class="form" action="##" method="post" id="registrationForm">
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="first_name"><h4>First name</h4></label>
                          <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                        <label for="last_name"><h4>Last name</h4></label>
                          <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">
                      </div>
                  </div>
      
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="phone"><h4>Phone</h4></label>
                          <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
                      </div>
                  </div>
      
                  <div class="form-group">
                      <div class="col-xs-6">
                         <label for="mobile"><h4>Mobile</h4></label>
                          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="email"><h4>Email</h4></label>
                          <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="email"><h4>Location</h4></label>
                          <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="password"><h4>Password</h4></label>
                          <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                        <label for="password2"><h4>Verify</h4></label>
                          <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                      </div>
                  </div>
                  <div class="form-group">
                       <div class="col-xs-12">
                            <br>
                              <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                               <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                        </div>
                  </div>
              </form>
           
         </div><!--/tab-pane-->
         <div class="tab-pane" id="settings">
                
               
              <hr>
              <form class="form" action="##" method="post" id="registrationForm">
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="first_name"><h4>First name</h4></label>
                          <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                        <label for="last_name"><h4>Last name</h4></label>
                          <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">
                      </div>
                  </div>
      
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="phone"><h4>Phone</h4></label>
                          <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
                      </div>
                  </div>
      
                  <div class="form-group">
                      <div class="col-xs-6">
                         <label for="mobile"><h4>Mobile</h4></label>
                          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="email"><h4>Email</h4></label>
                          <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="email"><h4>Location</h4></label>
                          <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                          <label for="password"><h4>Password</h4></label>
                          <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                      </div>
                  </div>
                  <div class="form-group">
                      
                      <div class="col-xs-6">
                        <label for="password2"><h4>Verify</h4></label>
                          <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                      </div>
                  </div>
                  <div class="form-group">
                       <div class="col-xs-12">
                            <br>
                              <button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                               <!--<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>-->
                        </div>
                  </div>
              </form>
          </div>
           
          </div><!--/tab-pane-->

          <div id="includePagination"></div>
</body>
</html>
