<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
 	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="assets/css/bootstrapValidator.css"/>
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    
    <script  src="assets/js/jquery-1.11.2.min.js"></script>
    <script  src="assets/js/bootstrap.min.js"></script>
    <script  src="assets/js/bootstrapValidator.js"></script>
</head>
<body>
<div class="well well-sm col-lg-4 col-lg-offset-4" style="margin-top: 50px;">
	
    <form class="form-horizontal" method="post" action="Controller">
        <fieldset>
        
            <legend class="text-center header" style="margin-right:600px;color: red;">
            <%
					String changeFailure=(String)request.getAttribute("failure");
					if(changeFailure!=null)
					{ %> Password incorrect 
		
			<%}%>
			</legend>
            <h3 align="center">Change Password</h3>
            
            <div class="form-group">
                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-key bigicon"></i></span>
                <div class="col-md-8">
                    <input type="password" name="curr" id="curr_password" class="form-control input-sm" placeholder="Current Password">
                </div>
            </div>

            <div class="form-group">
                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-key bigicon"></i></span>
                <div class="col-md-8">
                    <input type="password" class="form-control" name="new" id="password" class="form-control input-sm" placeholder="New Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required="required" >
                </div>
            </div>

            <div class="form-group">
                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-key bigicon"></i></span>
                <div class="col-md-8">
                    <input type="password" name="confirm" id="rename_password" class="form-control input-sm" placeholder="Confirm Password">
                </div>
            </div>
            <div class="modal-footer">
                <input type="hidden" name="action" value="userchangepassword"/>
                <button  type="submit" id="btnSelected" class="btn btn-primary">Save changes</button>
                <button type="reset" class="btn">Cancel</button>
            </div>
        </fieldset>
    </form>
</div>
<script type="text/javascript">
    var password = document.getElementById("password")
    ,confirm_password = document.getElementById("rename_password");

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
  rename_password.onkeyup = validatePassword;
    </script>

<script src="assets/js/bootstrap.min.js"></script>

</body>
</html>