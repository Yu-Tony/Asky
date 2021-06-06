function checkPassword(str)
{
  var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
  return re.test(str);
}


function validatePassword(){

  var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
  var password = document.getElementById("contrasena");
  var confirm_password = document.getElementById("pw2SU");

  if(!re.test(password.value))
  {
    password.setCustomValidity("La contraseña debe contener al menos 8 caracteres, 1 numero, 1 letra minuscula, 1 letra mayuscula y 1 caracter especial");
  }

  else {

    password.setCustomValidity('');

    if(password.value != confirm_password.value) {
      confirm_password.setCustomValidity("Las contraseñas no coinciden");
    } else {
      confirm_password.setCustomValidity('');
    }

  }
 
}

//------------------------VALIDATION------------------------
function validateFName()
{
  var re = /^[ñA-Za-z _]*[ñA-Za-z][ñA-Za-z _]*$/;
  var firstName = document.getElementById("nombre");

  if(!re.test(firstName.value))
  {
    firstName.setCustomValidity("El nombre debe de incluir solo letras");
  }
  else {
    firstName.setCustomValidity('');
  }

}

function validateLName()
{
  var re = /^[ñA-Za-z _]*[ñA-Za-z][ñA-Za-z _]*$/;
  var lastName = document.getElementById("apellidos");

  if(!re.test(lastName.value))
  {
    lastName.setCustomValidity("Los apellidos deben incluir solo letras");
    
  }
  else {
    lastName.setCustomValidity('');
  }

}

function validateMail()
{
  var re = /([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{1,64})@([a-zA-Z0-9-]{2,253})\.([a-zA-Z0-9-]{2,3})/;
  var mail = document.getElementById("correo");

  if(!re.test(mail.value))
  {
    mail.setCustomValidity("poner un correo valido como example@gmail.com");
  }
  else {
    mail.setCustomValidity('');
  }

}

function validateBirth()
{
    
}

/*function existingUsername()
{
  //var re = /([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{1,64})@([a-zA-Z0-9-]{2,253})\.([a-zA-Z0-9-]{2,3})/;
  var email = document.getElementById("emailLI");

  if(email.value!="stan nct")
  {
    email.setCustomValidity("The username doesn't exist");
  }
  else {
    email.setCustomValidity('');
  }

}*/

//------------------------CHANGE NAVBAR

 function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imagen_perfil')
                        .attr('src', e.target.result)
                };

                reader.readAsDataURL(input.files[0]);
            }
           
        }



function LoggedIn()
{
     $("#ProfileDropdown").css("visibility", "visible");
     $("#btnIniciarSesion").css("visibility", "hidden");
      $("#btnRegistrarse").css("visibility", "hidden");
     
     
}




/*
function checkForm(form)
{

  //FIRST NAME - LAST NAME
  re = /^[ñA-Za-z _]*[ñA-Za-z][ñA-Za-z _]*$/;
  if(form.FirstName.value != "" && form.LastName.value != "") 
  {
    if(!re.test(form.FirstName.value) || !re.test(form.LastName.value))
    {
      alert("Error: Name should only have letters");
      form.username.focus();
      return false;
    }
    alert("Error: Name cannot be blank!");
    form.username.focus();
    return false;
  }

  //USERNAME
  if(form.username.value == "") {
    alert("Error: Username cannot be blank!");
    form.username.focus();
    return false;
  }
  
  re = /[0-9a-zA-Z_]{3,}/;
  if(!re.test(form.username.value)) {
    alert("Error: Username must contain only letters, numbers and underscores. And must be at least 3 characters long");
    form.username.focus();
    return false;
  }

  //PASSWORD
  if(form.pw1.value != "" ) 
  {
    if(form.pw1.value == form.pw2.value) 
    {
      if(!checkPassword(form.pw1.value)) 
      {
        alert("Password needs to be at leats 8 characters long, contain 1 uppercase, 1 lowercase and 1 number");
        form.pw1.focus();
        return false;
      }
    }
    else
    {
      alert("Error: Password doesn't match");
      form.pw1.focus();
      return false;
    }
  
  } 
  else 
  {
    alert("Error: Please check that you've entered your password");
    form.pw1.focus();
    return false;
  }
  return true;
}*/


//pattern name required pattern="[ñA-Za-z _]*[ñA-Za-z][ñA-Za-z _]" title="Last Name only have to include letters"
//pattern email required pattern="([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{1,64})@([a-zA-Z0-9-]{2,253})\.([a-zA-Z0-9-]{2,3})" title="Enter a valid email like example@gmail.com" 
//patter psw required  pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[.!#$%&'*+/=?^_`{|}~-@])[a-zA-Z\d@.!#$%&'*+/=?^_`{|}~-]{8,}" title="Must have 8 characters, 1 mayus, 1 min, 1 number, 1 punctuaction sign"



