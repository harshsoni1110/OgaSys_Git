<%@page import="com.ogasys.constant.JspFiles"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ogasys.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>

<!-- Title -->
<title>OgaSys::User Profile::</title>

<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta charset="UTF-8">
<meta name="description" content="Admin Dashboard Template" />
<meta name="keywords" content="admin,dashboard" />
<meta name="author" content="Steelcoders" />

<!-- Styles -->
<%!
	
	//User user;
	
%>
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/modern.min.css" rel="stylesheet" type="text/css" />
<link href="assets/plugins/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css" />


<style type="text/css">
body {
	background: #F1F3FA;
}
</style>
</head>
<%  
           //User user=null;
           // user = (User) session.getAttribute("user");
			 //{
				//System.out.print(user.toString() + "h");
				//response.sendRedirect(JspFiles.INDEX_FILE);
		//	}
%>

<body>
	<div class="container" style="padding-top: 60px;">
		<div class="panel panel-primary"
			style="box-shadow: 5px 5px 5px 5px #888888;">
			<div class="panel-heading">
				<h1 class="panel-title center">My Profile</h1>
			</div>
			<div class="panel-body">

				<!-- left column -->
				<!-- edit form column -->
				<div class="col-md-6 col-sm-6 col-xs-2 center">

					<div class="row">
						<div class="col-md-5 center">
							<div class="profile-image-container" style="margin-top: 10px;">
								<img src="assets/img/profile.jpg"
									class="avatar img-circle img-thumbnail" alt="avatar">
							</div>
							<h3 class="text-center"><%=((User)session.getAttribute("user")).getFirstName() %></h3>
						</div>
						<div class="col-md-3" style="margin-left: 600px;">
							<a class="btn btn-primary" name="edit" href="#"
								style="border-radius: 5px;">Edit Profile</a>
						</div>
					</div>
					<div class="profile-content">
						<div class="box box-border page-row">
							<h3 style="color: #337ab7;">Personal Details:</h3>
							<hr>
							<table class="table-responsive"
								style="font-size: large; font-family: arial-black;">
								<tr>
									<th><span>Full Name</span></th>
									<td>: <%= ((User)session.getAttribute("user")).getFirstName() %></td>
								</tr>

								<tr>
									<th>Gender</th> 
									<td>: <%=((User)session.getAttribute("user")).getFirstName() %></td>
								</tr>
								<tr>
									<th>Email</th>
									<td>: <%=((User)session.getAttribute("user")).getFirstName() %></td>
								</tr>
								<tr>
									<th>Phone/Mobile Number</th>
									<td>: <%=((User)session.getAttribute("user")).getFirstName() %></td>
								</tr>

							</table>
							<h3 style="color: #337ab7;">Address Details:</h3>
							<hr>
							<table class="table-responsive"
								style="font-size: large; font-family: arial-black;">
								<tr>
									<th><span>Address </span></th>
									<td>: 
									 <%=((User)session.getAttribute("user")).getFirstName()%>, 
									 <%=((User)session.getAttribute("user")).getFirstName()%> 
									</td>
								</tr>

								<tr>
									<th>City</th>
									<td>: <%=((User)session.getAttribute("user")).getFirstName()%></td>
								</tr>
								<tr>
									<th>State</th>
									<td>: <%=((User)session.getAttribute("user")).getFirstName() %></td>
								</tr>
								<tr>
									<th>Postal Code</th>
									<td>: <%=((User)session.getAttribute("user")).getFirstName() %></td>
								</tr>

							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>