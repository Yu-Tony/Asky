function checkPassword(str)
{
  var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
  return re.test(str);
}


function validatePassword(){

  var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
  var password = document.getElementById("pw1SU");
  var confirm_password = document.getElementById("pw2SU");

  if(!re.test(password.value))
  {
    password.setCustomValidity("Password must contain at least 8 characters, 1 number, 1 lowercase letter, 1 uppercase letters and 1 special character");
  }

  else {

    password.setCustomValidity('');

    if(password.value != confirm_password.value) {
      confirm_password.setCustomValidity("Passwords Don't Match");
    } else {
      confirm_password.setCustomValidity('');
    }

  }
 
}

function validateFName()
{
  var re = /^[ñA-Za-z _]*[ñA-Za-z][ñA-Za-z _]*$/;
  var firstName = document.getElementById("firstName");

  if(!re.test(firstName.value))
  {
    firstName.setCustomValidity("First Name only have to include letters");
  }
  else {
    firstName.setCustomValidity('');
  }

}

function validateLName()
{
  var re = /^[ñA-Za-z _]*[ñA-Za-z][ñA-Za-z _]*$/;
  var lastName = document.getElementById("lastName");

  if(!re.test(lastName.value))
  {
    lastName.setCustomValidity("Last Name only have to include letters");
    
  }
  else {
    lastName.setCustomValidity('');
  }

}

function validateMail()
{
  var re = /([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{1,64})@([a-zA-Z0-9-]{2,253})\.([a-zA-Z0-9-]{2,3})/;
  var mail = document.getElementById("mailSU");

  if(!re.test(mail.value))
  {
    mail.setCustomValidity("Enter a valid email like example@gmail.com");
  }
  else {
    mail.setCustomValidity('');
  }

}

function existingUsername()
{
  //var re = /([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{1,64})@([a-zA-Z0-9-]{2,253})\.([a-zA-Z0-9-]{2,3})/;
  var email = document.getElementById("emailLI");

  if(email.value!="i can call you master you can call me mine")
  {
    email.setCustomValidity("The username doesn't exist");
  }
  else {
    email.setCustomValidity('');
  }

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
