<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>::Garage Registration::</title>

    <link rel="stylesheet" href="assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="assets/css/bootstrapValidator.css"/>

    <!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <!--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />-->

    <script  src="assets/js/jquery-1.11.2.min.js"></script>
    <script  src="assets/js/bootstrap.min.js"></script>
    <script  src="assets/js/bootstrapValidator.js"></script>
</head>
<body background="assets/img/bg.jpg">
    
    <div class="container" style="margin-top: 60px;">
        <div class="row">
            <!-- form: -->
            <!-- <section> -->
                <div class="col-lg-8 col-lg-offset-2">
                  <div class="panel panel-primary" style="box-shadow: 5px 5px 5px 5px #888888;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Sign up</h3>
                    </div>
                    <div class="panel-body">
                    <form id="garageRegister" method="post" class="form-horizontal"  action="Controller">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Garage Name</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="garageName" pattern="[A-Za-z\s]*" title="Garage name should contains only alphabets and space character" placeholder="Garage name" required="required"/>
                            </div>
                           
                        </div>

                       
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Shop Number and/or Name</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" name="shopNumber" placeholder="Garage and/or shop number and/or Name" required="required"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-3 control-label">Street &amp; Landmark</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="street" placeholder="Street" />
                            </div>
                            
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="landmark"  placeholder="Landmark" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">City</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="city" pattern="[A-Za-z/s]*" title="city name should contains only alphabets and space" placeholder="City" required="required"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">State/Province</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="state" pattern="[A-Za-z/s]*" title="state name should contains only alphabets and space" placeholder="State/Province" required="required"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Postal code</label>
                            <div class="col-lg-3">
                                <input type="text" class="form-control" name="postalCode" pattern="[0-9]{6}" title="postal code should contain at least 6 digits" placeholder="Postal code" required="required"/>
                            </div>
                        </div>
                         
                       
                        <div class="form-group">
                                <label class="col-lg-3 control-label">Phone/Mobile number</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" pattern="[0-9]{10,11}" name="phoneNumber" placeholder="Phone/Mobile Number" required="required"/>
                                </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Email address</label>
                            <div class="col-lg-5">
                                <input type="email" class="form-control" id="emailId" name="email" placeholder="example: abc@gmail.com" required="required"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Password</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Password" required="required"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Retype password</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" id="confirm_password" name="confirmPassword" placeholder="Retype password as above" required="required"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" name="register" value="Register">Register</button>
                                <button type="reset" class="btn btn-info" id="resetBtn">Cancel</button>
                                <input type="hidden" name="action" value="registergarage"/>
                            </div>
                        </div>
                    </form>
                    </div>
                  </div>
                </div>
          </div>
    </div>
    <script type="text/javascript">
    var password = document.getElementById("password")
    ,confirm_password = document.getElementById("confirm_password");

  function validatePassword(){

	  if(password.value != confirm_password.value) {
      confirm_password.setCustomValidity("Passwords don't Match");
    }
    /*else if(password.value==emailId.value) {
    	password.setCustomValidity("Error: Password must be different from Username!");
    }*/
    else {
      confirm_password.setCustomValidity('');
    }
  }

  password.onchange = validatePassword;
  //password.onkeyup = validatePassword;
  confirm_password.onkeyup = validatePassword;
    </script>
</body>
</html>
