<%@page import="java.io.PrintWriter"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.BasicDBObject" %>
<%@ page import="com.ogasys.model.ServiceFault" %>

<!DOCTYPE html>
<html>
<head>
    <title>::Search Garages::</title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/bootstrapValidator.css"/>
    <!--link rel="stylesheet" href="assets/css/modern.min.css"/-->
    

    <!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <!--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />-->

    <script type="text/javascript" src="assets/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
</head>

<body background="bg.jpg" onload="garageDetails()">
    <div class="topmenu-outer">
                        <div class="top-menu">
                            <ul class="nav navbar-nav navbar-left">
                                <li>        
                                    <a href="javascript:void(0);" class="waves-effect waves-button waves-classic sidebar-toggle"><i class="fa fa-bars"></i></a>
                                </li>
                                <li>
                                    <a href="#cd-nav" class="waves-effect waves-button waves-classic cd-nav-trigger"><i class="fa fa-diamond"></i></a>
                                </li>
                                <li>        
                                    <a href="javascript:void(0);" class="waves-effect waves-button waves-classic toggle-fullscreen"><i class="fa fa-expand"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle waves-effect waves-button waves-classic" data-toggle="dropdown">
                                        <i class="fa fa-cogs"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-md dropdown-list theme-settings" role="menu">
                                        <li class="li-group">
                                            <ul class="list-unstyled">
                                                <li class="no-link" role="presentation">
                                                    Fixed Header 
                                                    <div class="ios-switch pull-right switch-md">
                                                        <input type="checkbox" class="js-switch pull-right fixed-header-check" checked>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="li-group">
                                            <ul class="list-unstyled">
                                                <li class="no-link" role="presentation">
                                                    Fixed Sidebar 
                                                    <div class="ios-switch pull-right switch-md">
                                                        <input type="checkbox" class="js-switch pull-right fixed-sidebar-check">
                                                    </div>
                                                </li>
                                                <li class="no-link" role="presentation">
                                                    Horizontal bar 
                                                    <div class="ios-switch pull-right switch-md">
                                                        <input type="checkbox" class="js-switch pull-right horizontal-bar-check">
                                                    </div>
                                                </li>
                                                <li class="no-link" role="presentation">
                                                    Toggle Sidebar 
                                                    <div class="ios-switch pull-right switch-md">
                                                        <input type="checkbox" class="js-switch pull-right toggle-sidebar-check">
                                                    </div>
                                                </li>
                                                <li class="no-link" role="presentation">
                                                    Compact Menu 
                                                    <div class="ios-switch pull-right switch-md">
                                                        <input type="checkbox" class="js-switch pull-right compact-menu-check">
                                                    </div>
                                                </li>
                                                <li class="no-link" role="presentation">
                                                    Hover Menu 
                                                    <div class="ios-switch pull-right switch-md">
                                                        <input type="checkbox" class="js-switch pull-right hover-menu-check">
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="li-group">
                                            <ul class="list-unstyled">
                                                <li class="no-link" role="presentation">
                                                    Boxed Layout 
                                                    <div class="ios-switch pull-right switch-md">
                                                        <input type="checkbox" class="js-switch pull-right boxed-layout-check">
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="li-group">
                                            <ul class="list-unstyled">
                                                <li class="no-link" role="presentation">
                                                    Choose Theme Color
                                                    <div class="color-switcher">
                                                        <a class="colorbox color-blue" href="indexca00.html?theme=blue" title="Blue Theme" data-css="blue"></a>
                                                        <a class="colorbox color-green" href="indexaf91.html?theme=green" title="Green Theme" data-css="green"></a>
                                                        <a class="colorbox color-red" href="index0e99.html?theme=red" title="Red Theme" data-css="red"></a>
                                                        <a class="colorbox color-white" href="index13d4.html?theme=white" title="White Theme" data-css="white"></a>
                                                        <a class="colorbox color-purple" href="index938c.html?theme=purple" title="purple Theme" data-css="purple"></a>
                                                        <a class="colorbox color-dark" href="index4965.html?theme=dark" title="Dark Theme" data-css="dark"></a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="no-link"><button class="btn btn-default reset-options">Reset Options</button></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li>    
                                    <a href="javascript:void(0);" class="waves-effect waves-button waves-classic show-search"><i class="fa fa-search"></i></a>
                                </li>

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle waves-effect waves-button waves-classic" data-toggle="dropdown"><i class="fa fa-bell"></i><span class="badge badge-success pull-right">3</span></a>
                                    <ul class="dropdown-menu title-caret dropdown-lg" role="menu">
                                        <li><p class="drop-title">You have 3 pending tasks !</p></li>
                                        <li class="dropdown-menu-list slimscroll tasks">
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="#">
                                                        <div class="task-icon badge badge-success"><i class="icon-user"></i></div>
                                                        <span class="badge badge-roundless badge-default pull-right">1min ago</span>
                                                        <p class="task-details">New user registered.</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <div class="task-icon badge badge-danger"><i class="icon-energy"></i></div>
                                                        <span class="badge badge-roundless badge-default pull-right">24min ago</span>
                                                        <p class="task-details">Database error.</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <div class="task-icon badge badge-info"><i class="icon-heart"></i></div>
                                                        <span class="badge badge-roundless badge-default pull-right">1h ago</span>
                                                        <p class="task-details">Reached 24k likes</p>
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="drop-all"><a href="#" class="text-center">All Tasks</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle waves-effect waves-button waves-classic" data-toggle="dropdown">
                                        <span class="user-name">David<i class="fa fa-angle-down"></i></span>
                                        <img class="img-circle avatar" src="assets/img/avatar1.png" width="40" height="40" alt="">
                                    </a>
                                    <ul class="dropdown-menu dropdown-list" role="menu">
                                        <li role="presentation"><a href="profile.html"><i class="fa fa-user"></i>My Profile</a></li>
                                        <li role="presentation"><a href="calendar.html"><i class="fa fa-calendar"></i>Update Profile</a></li>
                                        <li role="presentation"><a href="#progress"><i class="fa fa-battery-empty"></i>History</a></li>
                                        <li role="presentation"><a href="Change-Password.html"><i class="fa fa-key"></i>Change Password</a></li>
                                        <li role="presentation" class="divider"></li>
                                        <li role="presentation"><a href="lock-screen.html"><i class="fa fa-lock"></i>Lock screen</a></li>
                                        <li role="presentation"><a href="login.html"><i class="fa fa-sign-out m-r-xs"></i>Log out</a></li>
                                    </ul>
                                </li>
                            </ul><!-- Nav -->
                        </div><!-- Top Menu -->
                    </div>
                </div>
            </div><!-- Navbar -->    
	<% List<ServiceFault> faultPriceList= (List<ServiceFault>)session.getAttribute( "faultPriceList" );
	PrintWriter pw = response.getWriter();
	BasicDBObject garage = (BasicDBObject) session.getAttribute("garage");
	pw.println(" Garage Name: "+garage.get("GarageName").toString());
	pw.println(" Pick up price: "+garage.get("PickUpPrice").toString());
	double amount=Double.parseDouble(garage.get("PickUpPrice").toString());

%>
    <div class="container" style="margin-top: 30px;">
        <div class="row">
            <!-- form: -->
            <!-- <section> -->
                <div class="col-lg-8 col-lg-offset-2">
                  <div class="panel panel-primary" style="box-shadow: 5px 5px 5px 5px #888888; margin-top:80px">
                    <div class="panel-heading">
                        <h3 class="panel-title">Estimation of Selected Garage</h3>
                    </div>
                    <div class="panel-body">
                    <form id="defaultForm" class="form-horizontal" action="ServiceRequest" method="get" >
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Garage Name :</label>
                            <label class="col-lg-3 control-label">
								<%=garage.get("GarageName").toString() %>
                            </label>
                        </div>

                         <div class="form-group">
                            <label class="col-lg-3 control-label">Address : </label>
                            
                                
                                    <label  class="col-lg-3 control-label">
                                         <%=garage.get("Address").toString() %>
                                    </label>
                            
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Contact No :</label>
                            
                                
                                    <label  class="col-lg-3 control-label">
                                         <%=garage.get("ContactNumber").toString() %>
                                    </label>
                            
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Pickup Charge :</label>
                            
                                
                                    <label  class="col-lg-3 control-label" id="pickup">
                                         <%=garage.get("PickUpPrice").toString() %>
                                    </label>
                        </div>
                        <hr style="height:50px; border-top:1px solid #3be; margin-bottom:-20px">
                        
                        
                        
                        <div id="main-wrapper">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-body">
                                    <div id="progress" class="table-responsive project-stats">
                                       <table class="table">
                                           <thead>
                                               <tr>
                                                   <th>#</th>
                                                   <th>Faults</th>
                                                   <th>Price</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                           <%	
                                       	for(int i=0;i<faultPriceList.size();i++)
                                       	{		%>
                                       			<tr>
                                                   <th scope="row"><%=i+1 %></th>
                                                   <td><%=faultPriceList.get(i).getFaultName() %></td>
                                                   <td><%=faultPriceList.get(i).getFaultPrice() %></td>
                                               	</tr>
                                       		<%amount+=faultPriceList.get(i).getFaultPrice();}%>
                                         </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- Main Wrapper -->
                        <hr style="height:50px; border-top:1px solid #3be; margin-bottom:-20px">
                        
                        <div class="form-group" style="margin-left:250px">
                            <label class="col-lg-3 control-label">Total :</label>
                                    <input type="text" value=<%=amount %>  class="col-lg-3 control-label" id="pickup">                                    
                        </div>
                        <div class="form-group">
                            <div style="margin-left: 100px; float:left;">
                                <button type="submit" class="btn btn-primary" name="searchwithpick" value="search" style="width:150px; height:40px; background-color:#e34; border-color : #e34;">Request with Pick UP</button>
                                
                            </div>

                            <div style="margin-left: 30px; float:left;">
                                <button type="submit" class="btn btn-primary" name="searchwithoutpick" value="search" style="width:150px; height:40px; background-color:#e34; border-color : #e34;">Request  without Pick UP</button>
                                
                            </div>

                            <div  style="margin-right: 120px; float:right;">
                                <a href="searchResults.jsp"><input type="button" class="btn btn-primary" name="search" value="Back To Results" style="width:150px; height:40px;  "></a>
                                
                            </div>
                        </div>
                    </form>
                    </div>
                  </div>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>

<script type="text/javascript">
$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#defaultForm').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            firstName: {
                validators: {
                    notEmpty: {
                        message: 'The first name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The firstname can only consist of alphabetical'
                    }
                }
            },
            lastName: {
                validators: {
                    notEmpty: {
                        message: 'The last name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The lastname can only consist of alphabetical'
                    }
                }
            },
            houseNumber: {
                validators: {
                    notEmpty: {
                        message: 'house number and/or name is required and cannot be empty'
                    }
                }
            },
            city: {
                validators: {
                    notEmpty: {
                        message: 'The city name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The city name can only consist of alphabetical'
                    }
                }
                    
            },
            state: {
                validators: {
                    notEmpty: {
                        message: 'The state name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The state name can only consist of alphabetical'
                    }
                }
            }, 
            postalCode: {
                validators: {
                    notEmpty: {
                        message: 'The postal code is required and cannot be empty'
                    },
                    digits: {
                               message: 'postal code can contain only digits'
                    },
                    regexp: {
                        regexp: /^\d{6}$/,
                        message: 'The Indian postal code must contain 6 digits'
                    }
                    /*
                    zipCode: {
                        country: 'IN',
                        message: 'The input is not a valid Indian zip code'
                    }*/
                }
            },
            phoneNumber: {
                validators: {
                    notEmpty: {
                        message: 'The phone number is required and cannot be empty'
                    },
                    digits: {
                        message: 'The value can contain only digits'
                    },
                    stringLength: {
                        min: 10,
                        max: 11,
                        message: 'The phone number must be 10 to 11 digits long'
                    }
                }
            },
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    },
                    remote: {
                        url: 'remote.php',
                        message: 'The username is not available'
                    },
                    different: {
                        field: 'password',
                        message: 'The username and password cannot be the same as each other'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm password must be same'
                    },
                    different: {
                        field: 'email',
                        message: 'The password cannot be the same as emailId'
                    },
                    stringLength: {
                        min:6,
                        max:30,
                        message: 'The password must be more than 5 and less than 30 characters long'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and cannot be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'email',
                        message: 'The password cannot be the same as emailId'
                    }
                }
            },
            gender: {
                validators: {
                    notEmpty: {
                        message: 'The gender is required'
                    }
                }
            },
            captcha: {
                validators: {
                    callback: {
                        message: 'Wrong answer',
                        callback: function(value, validator) {
                            var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                            return value == sum;
                        }
                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#defaultForm').data('bootstrapValidator').resetForm(true);
    });
});



}


</script>
</body>
</html>