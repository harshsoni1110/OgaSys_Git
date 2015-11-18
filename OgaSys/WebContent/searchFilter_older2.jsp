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
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

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
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header" style="background : none;">
        <div class="container">

            <div style="margin-top:20px; width:45%;">
                <div class="panel panel-primary" style="margin-top:20px; width:100%; margin-left:300px">
                    <div class="panel-heading" >
                        <h3 class="panel-title">Location</h3>
                    </div>
                    <div class="panel-body">
                        <div style="width:80%">
                        <label ><input type="radio" name="checkAddress" checked="checked" onChange="checkLocation()"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Use Current Location</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label ><input type="radio" name="checkAddress"  id="checkAddress" onChange="checkAddress()"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Address</label>

                        <div id="mydiv"  style="visibility:hidden">
                            <input type="text" name="testing">
                       </div>
                        <script type="text/javascript">
                         function checkAddress(){

                                var a = document.getElementById("checkAddress").value;
                               // window.alert(a);
                                    if (a == 'on' ) 
                                    {                              
                                        document.getElementById('mydiv').setAttribute('style','visibility:visible');
                                    }
                                    else{
                                      //  window.alert(a);
                                          
                                        document.getElementById('mydiv').setAttribute('style','visibility:hidden');
                                } 
                        }
                        function checkLocation(){

                            var a = document.getElementById("checkAddress").value;
                             //   window.alert(a);
                                    if (a == 'on' ) 
                                    {                              
                                        document.getElementById('mydiv').setAttribute('style','visibility:hidden');
                                    }
                        }
                        </script>

                        </div>

                    </div>
                </div>


                <div class="panel panel-primary" style="margin-top:20px; width:100%; margin-left:300px">
                    <div class="panel-heading" >
                        <h3 class="panel-title">Vehicle Type</h3>
                    </div>
                    <div class="panel-body">
                        
                        <div style="width:80%">
                            
                        <label ><input type="radio" name="vtype" checked="checked" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Two Wheelers</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label ><input type="radio" name="vtype"  id="checkAddress" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Four Wheelers</label>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary" style="margin-top:20px; width:100%; margin-left:300px">
                    <div class="panel-heading" >
                        <h3 class="panel-title">Select Packages</h3>
                    </div>
                    <div class="panel-body">
                        
                        <div style="width:80%">
                            
                        <label class="radio-inline"><input type="checkbox" name="p1">&nbsp;&nbsp;&nbsp;Package 1</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline"><input type="checkbox" name="p2">&nbsp;&nbsp;&nbsp;Package 2</label>
                        </div>

                    </div>
                </div>

            </div>
            <!--div>
                <div class="panel panel-primary" style="margin-top:20px; width:50%; margin-left:260px;">
                    <div class="panel-heading" >
                        <h3 class="panel-title">Type &nbspOf&nbsp Vehicle</h3>
                    </div>
                    <div class="panel-body">
                        
                        <div style="width:60%">
                            
                        <label class="radio-inline"><input type="radio" name="optradio">Two Wheeler</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline"><input type="radio" name="optradio">Four Wheeler</label>
                        </div>

                    </div>
                </div-->
               <div style="float: left;margin-left: 450px;margin-top: 50px;">
                     <ul class="list-inline intro-social-buttons">
                            <li>
                                <a href="#results" class="btn btn-danger btn-lg btn-huge lato">Search Garages</span></a>
                            </li>
                        </ul></div>
        </div>
            </div>
            <!--/div-->
        </div>
        <!-- /.container -->
    </div>
    <!-- /.intro-header -->
    <!-- Page Content -->
    <a  name="results"></a>
    <div class="content-section-a">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    
                    <div class="clearfix"></div>
                    <h2 class="section-heading">Death to the Stock Photo:<br>Special Thanks</h2>
                    <p class="lead">A special thanks to <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a> for providing the photographs that you see in this template. Visit their website to become a member.</p>
                </div>
               
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

  

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#about">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#services">Services</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#contact">Contact</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Your Company 2014. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <script type="text/javascript">
                    function load_home(){
                        document.getElementById("map").innerHTML='<object type="text/html" data="map.html" ></object>';
                    }
    </script>

</body>

</html>
