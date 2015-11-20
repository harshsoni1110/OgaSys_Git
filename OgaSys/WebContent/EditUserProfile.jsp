<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OgaSys::Edit User Profile::</title>
<link rel="stylesheet" href="assets/css/bootstrap.css" />
</head>
<body>
	<div class="container" style="padding-top: 60px;">
		<div class="row">
			<div class="panel panel-primary"
				style="box-shadow: 5px 5px 5px 5px #888888;">
				<div class="panel-heading">
					<h1 class="panel-title center">Edit Profile</h1>
				</div>
				<div class="panel-body">

					<!-- left column -->
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="text-center">
							<ul style="list-style: none;">

								<li><img src="assets/img/profile.jpg"
									class="avatar img-circle img-thumbnail" alt="avatar"></li>
								<!--<div id="file-uploader" >-->
								<li><br /></li>
								<li><input type="file" id="upload" class="btn btn-primary"
									 data-filename-placement="inside"> </input></li>
							</ul>
						</div>
					</div>
					<!-- edit form column -->
					<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
						<!--<div class="alert alert-info alert-dismissable">
        <a class="panel-close close" data-dismiss="alert">×</a> 
        <i class="fa fa-coffee"></i>
        This is an <strong>.alert</strong>. Use this to show important messages to the user.
      </div>-->
						<h3>Personal info</h3>
						<form id="userRegister" method="post" class="form-horizontal"
							action="Controller">
							<div class="form-group">
								<label class="col-lg-3 control-label">Full name</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="firstName"
										pattern="[A-Za-z]*"
										title="first name should contains only alphabets"
										placeholder="First name" required="required" />
								</div>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="lastName"
										pattern="[A-Za-z]*"
										title="last name should contains only alphabets"
										placeholder="Last name" required="required" />
								</div>
							</div>

							<!--<div class="form-group">
                            <label class="col-lg-3 control-label">Username</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="username" />
                            </div>
                        </div>-->

							<div class="form-group">
								<label class="col-lg-3 control-label">House/Flat
									Number/Name</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="houseNumber"
										placeholder="House and/or flat number and/or Name"
										required="required" />
								</div>
							</div>


							<div class="form-group">
								<label class="col-lg-3 control-label">Street &amp;
									Landmark</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="street"
										placeholder="Street" />
								</div>

								<div class="col-lg-4">
									<input type="text" class="form-control" name="landmark"
										placeholder="Landmark" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-3 control-label">City</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="city"
										pattern="[A-Za-z]*"
										title="city name should contains only alphabets"
										placeholder="City" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">State/Province</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="state"
										pattern="[A-Za-z]*"
										title="state name should contains only alphabets"
										placeholder="State/Province" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Postal code</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" name="postalCode"
										pattern="[0-9]{6}"
										title="postal code should contain at least 6 digits"
										placeholder="Postal code" required="required" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-3 control-label">Gender</label>
								<div class="col-lg-5">
									<div class="radio">
										<label> <input type="radio" name="gender" value="1"
											required /> Male
										</label>
									</div>
									<div class="radio">
										<label> <input type="radio" name="gender" value="2"
											required /> Female
										</label>
									</div>
									<!-- <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" value="other" /> Other
                                    </label>
                                </div> -->
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-3 control-label">Phone/Mobile
									number</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" pattern="[0-9]{10,11}"
										name="phoneNumber" placeholder="Phone/Mobile Number"
										required="required" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-3 control-label">Email address</label>
								<div class="col-lg-5">
									<input type="email" class="form-control" id="emailId"
										name="email" placeholder="example:you@domain.com"
										required="required" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-3 control-label">Password</label>
								<div class="col-lg-5">
									<input type="password" class="form-control" id="password"
										name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
										placeholder="Password" required="required" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-3 control-label">Retype password</label>
								<div class="col-lg-5">
									<input type="password" class="form-control"
										id="confirm_password" name="confirmPassword"
										placeholder="Retype password as above" required="required" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input class="btn btn-primary" value="Save Changes"
										type="submit"> <span></span> <input
										class="btn btn-default" value="Cancel" type="reset">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
