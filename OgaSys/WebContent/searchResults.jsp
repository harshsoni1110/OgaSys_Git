<%@page import="java.util.List"%>
<%@page import="com.ogasys.model.SearchResult"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Landing Page - Start Bootstrap Theme</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="assets/css/landing-page.css" rel="stylesheet">
    <link href="assets/css/map_style.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
     <div class="intro-header" style="background : none; margin-top:20px;">
        <div class="container">
    <!-- Navigation -->
            <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
                <div class="container topnav">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand topnav" href="index.jsp">Ogasys</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#about">About</a>
                            </li>
                            <li>
                                <a href="#services">Services</a>
                            </li>
                            <li>
                                <a href="#contact">Contact</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
			<div>
			</div>
            <div class="bs-example" data-example-id="simple-thumbnails">
            <div class="row">
              <div class="col-xs-6 col-md-3 border_result" style="margin-right:20px">
              <c:forEach items="${resultList}" var="garage">
              <a href="${pageContext.request.contextPath}/CostEstimationController?id=<c:out value="${garage.getGarageId()}"/>" class="thumbnail">
                  <img data-src="holder.js/100%x180" alt="100%x180" src="./img/intro-bg.jpg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block; id=g1">
                </a>
                <div>
                <h3 style="margin-left:15px;width: 80%;"><label>Garage Name: </label><c:out value="${garage.getGarageName()}"/></h3>
                <label class="col-lg-3 control-label" style="margin-left:-30px;width: 80%; float:left"><lable>Pick up: </lable><c:out value="${garage.getPickUp()}"/> </label>
                <label class="col-lg-3 control-label" style="margin-left:-32px;width: 80%; float:left"><lable>Estimated Cost: </lable><c:out value="${garage.getEstimatedCost()}"/></label>
                <label class="col-lg-3 control-label" style="margin-left:-60px;width: 80%; float:left">Ratings : 4.5/5</label>
                </div>
                <a class="btn btn-default" style="width:280px">Garage 1</a>          
			</c:forEach>
			</div>
            </div>
          </div>
        </div>
    </div>
</body>
</html>