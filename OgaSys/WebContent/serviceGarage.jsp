<%@page import="com.ogasys.constant.JspFiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ogasys.model.Service"%>
<%@page import="com.ogasys.model.ServiceFault"%>
<%@page import="com.ogasys.model.FaultPrice"%>
<%@page import="com.ogasys.model.Fault"%>
<%@page import="com.ogasys.model.User"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<%
	// checking garage session
/*	if (session.getAttribute("userGarage") == null) {
		response.sendRedirect(JspFiles.INDEX_FILE);
		return;
	}*/
%>
<%! Service s = null;
	User ServiceRequester = null;
	ArrayList <ServiceFault> lsServiceFaults = new ArrayList <ServiceFault>();
	ArrayList <FaultPrice> lsGarageFaultsPrice = new ArrayList <FaultPrice>();
	ArrayList <Fault> lsFaults = new ArrayList <Fault>();
	ArrayList <Fault> lsExteriorFaults = new ArrayList <Fault>();
	ArrayList <Fault> lsInteriorFaults = new ArrayList <Fault>();
	String exteriorString = "";
	String interiorString = "";
	String faultString = "";
	int rowCount = 1;
	double totalPrice = 0;

%>

<%
		s = (Service)request.getAttribute("RequestedServiceObj");
		ServiceRequester = (User)request.getAttribute("ServiceRequester");
		//out.println("<p>"+s.toString()+ "</p>");
		
		
		if (s != null) {
			lsServiceFaults = s.getFaults();
			lsGarageFaultsPrice = (ArrayList <FaultPrice>) request.getAttribute("GarageFaultPrice");
			lsFaults = (ArrayList <Fault>)request.getAttribute("AllFaults");
		//	out.println(lsGarageFaultsPrice);
		//	out.println("Service Faults " + lsServiceFaults);
		    

			//out.println("Fault Price");
			int colCount = 1;
			boolean flag = false;
			//out.println (lsGarageFaultsPrice);
			//out.println (lsServiceFaults);
			for (FaultPrice faultPrice : lsGarageFaultsPrice){
				flag = false;
				for (ServiceFault serviceFault : lsServiceFaults) {
					if (serviceFault.getFaultId().equals(faultPrice.getFaultId().toString()) ){
						faultString += "<tr><td><input type=\"checkbox\" name=\"serviceFaults\" value=\""+ faultPrice.getFaultId() +"\" checked = \"checked\" disabled/></td><th scope=\"row\">"+rowCount+"</th><td>"+faultPrice.getFaultName()+"</td><td>Rs."+faultPrice.getPrice()+"</td></tr>";
						flag = true;
						totalPrice += Double.parseDouble(faultPrice.getPrice());
						break;
					}
				}// inner
				if (!flag)
					faultString += "<tr><td><input type=\"checkbox\" name=\"serviceFaults\" value=\""+ faultPrice.getFaultId() +"\"/></td><th scope=\"row\">"+rowCount+"</th><td>"+faultPrice.getFaultName()+"</td><td>Rs."+faultPrice.getPrice()+"</td></tr>";
				rowCount++;	
				
			}//outer
			/*
			for (Fault fault : lsFaults) {
				//out.println("FAULT STARTS    HERE" + fault);
				for (FaultPrice faultPrice : lsGarageFaultsPrice) {
					if (fault.getFaultType().equals("Exterior")) {
					//	out.println(" EXTERIOR   "  +fault);
						//lsExteriorFaults.add(fault);
						if (faultPrice.getFaultId().equals(fault.getFaultId().toString())) {
							exteriorString += "<tr><td><input type=\"checkbox\" name=\""+ fault.getFaultName() +"\" value=\""+ fault.getFaultId().toString() +"\"" ;
							for (ServiceFault serviceFault : lsServiceFaults) {
								if (serviceFault.getFaultId().equals(fault.getFaultId().toString())){
									exteriorString += " checked=\"checked\" disabled /></td><th scope=\"row\">"+rowCount+"</th><td>"+fault.getFaultName()+"</td><td>Rs."+faultPrice.getPrice()+"</td></tr>";
									break;
								}
								else
									exteriorString+= "/></td><th scope=\"row\">"+rowCount+"</th><td>"+fault.getFaultName()+"</td><td>Rs."+faultPrice.getPrice()+"</td></tr>";
							}
							 
							break;
						}// if of faultprice and fault match
						
					}// exterior if
					else {//interior if
						if (fault.getFaultType().equals("Interior")){ // interior
							if (faultPrice.getFaultId().equals(fault.getFaultId().toString())) {
							interiorString += "<tr><td><input type=\"checkbox\" name=\""+ fault.getFaultName() +"\" value=\""+ fault.getFaultId().toString() +"\"" ;
							for (ServiceFault serviceFault : lsServiceFaults) {
								if (serviceFault.getFaultId().equals(fault.getFaultId().toString())){
									interiorString += " checked=\"checked\" disabled ";
									break;
								}
							}
							 interiorString+= "/></td><th scope=\"row\">"+rowCount+"</th><td>"+fault.getFaultName()+"</td><td>Rs."+faultPrice.getPrice()+"</td></tr>";
							break;
							}//if of 
						}
					}// exterior if else
					rowCount++;
				}//inner for loop ends here
				
			}//outer for loop ends here*/
				
			
%>

    <title>Ogasys Jobsheet Update</title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.css"/>
    <!--link rel="stylesheet" href="assets/css/modern.min.css"/-->
     <link href="assets/assets/css/map_style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="assets/http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    

    <!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <!--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />-->

    <script type="text/javascript" src="assets/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
</head>
<body background="bg.jpg" onload="garageDetails()">
    <!--nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation" >
        <div class="container topnav">
            < Brand and toggle get grouped for better mobile display >
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="index.jsp"><img src="assets/img/ogasys logo 120x40.svg"></a>
            </div>
            < Collect the nav links, forms, and other content for toggling >
            
            <! /.navbar-collapse >
        </div>
        <! /container >
    </nav-->

    
<div class="topmenu-outer" style="margin-top:-30px;">
                        <div class="top-menu">
                              <a style="margin-left:10px" class="navbar-brand topnav" href="index.jsp"><img src="assets/img/ogasys logo 120x40.svg"></a>  
                            <ul class="nav navbar-nav navbar-right">
                               

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle waves-effect waves-button waves-classic" data-toggle="dropdown" ><i class="fa fa-bell"></i><span class="badge badge-success pull-right">3</span></a>

                                    <ul class="dropdown-menu title-caret dropdown-lg" role="primary " style="z-index:2 !important;position:absolute;" scrolling="no">
                                        <li><p class="drop-title">You have 3 pending tasks !</p></li>
                                        <li class="dropdown-menu-list slimscroll tasks">
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="#">
                                                        <i class="icon-user"></i>
                                                        <p class="task-details">New user registered.</p>
                                                    </a>
                                                </li>


                                                <li>
                                                    <a href="#">
                                                        <i class="icon-user"></i>
                                                        <!--span class="badge badge-roundless badge-default pull-right">1min ago</span-->
                                                        <p class="task-details">New user registered.</p>
                                                    </a>
                                                </li>
                                                
                                                <li>
                                                    <a href="#">
                                                        <p class="task-details">New user registered.</p>
                                                    </a>
                                                </li>
                                               
                                              
                                            </ul>
                                        </li>
                                        <li class="drop-all"><a href="#" class="text-center">All Tasks</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle waves-effect waves-button waves-classic" data-toggle="dropdown" style="padding :19px 8px;">
                                        <span class="user-name">David</span>
                                        <img class="img-circle avatar" src="assets/img/avatar1.png" width="40" height="40" alt="">
                                    </a>
                                    <ul class="dropdown-menu dropdown-list" role="menu">
                                        <li role="presentation"><a href="profile.html"><i class="fa fa-user"></i>My Profile</a></li>
                                        <li role="presentation"><a href="calendar.html"><i class="fa fa-calendar"></i>Update Profile</a></li>
                                        <li role="presentation"><a href="#progress"><i class="fa fa-calendar"></i>History</a></li>
                                        <li role="presentation"><a href="Change-Password.html"><i class="fa fa-key"></i>Change Password</a></li>
                                        <li role="presentation" class="divider"></li>
                                        <li role="presentation"><a href="login.html"><i class="fa fa-sign-out m-r-xs"></i>Log out</a></li>
                                    </ul>
                                </li>
                            </ul><!-- Nav -->
                        </div><!-- Top Menu -->
    <div class="container" style="margin-top: 30px;">

        <div class="row" >
            <!-- form: -->
            <!-- <section> -->
                <div class="col-lg-8 col-lg-offset-2">
                  <div class="panel panel-primary" style="margin-top:80px">
                    <div class="panel-heading">
                        <h3 class="panel-title">Service of Garage</h3>
                    </div>
                    <div class="panel-body">
                    <form id="defaultForm" method="post" class="form-horizontal" name="frmUpdateService" action="">
                        <div class="form-group" style="margin-left:20px">
                            <label class="col-lg-3 control-label">Requester Name :</label>
                            <label class="col-lg-3 control-label">
								<%=ServiceRequester.getFirstName() + " " + ServiceRequester.getLastName() %>
                          
                            </label>
                        </div>

                         <div class="form-group " style="margin-left:20px">
                            <label class="col-lg-3 control-label">Address :</label>
                            
                                
                                    <label  class="col-lg-3 control-label">
                                         <%= ServiceRequester.getAddress().getFlatNumber()+ " " + ServiceRequester.getAddress().getStreet() + " " + ServiceRequester.getAddress().getLandmark() + " " + ServiceRequester.getAddress().getStreet() + " " + ServiceRequester.getAddress().getCity() %>
                                    </label>
                            
                        </div>

                        <div class="form-group" style="margin-left:20px">
                            <label class="col-lg-3 control-label">Contact No :</label>
                            
                                
                                    <label  class="col-lg-3 control-label">
                                         <%=ServiceRequester.getContactNumber() %>
                                    </label>
                            
                        </div>




                        <br>
                        <b><u><h4>Faults</h4></u></b>
                        
                     <div id="main-wrapper">
                    <div class="row" style="margin-bottom:90px">
                        <div class="col-lg-12 col-md-12">
                            <div class="panel panel-white">
                                <div class="panel-body">
                                    <div id="progress" class="table-responsive project-stats">
                                       <table class="table">

                                           <thead>
                                               <tr>
                                                    <td></td>
                                                   <th>#</th>
                                                   <th>Faults</th>
                                                   
                                                   <th>Price</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody id= "interiorFaults"> <!--  HERE HERE HERE -->
                                           <% out.println(faultString); %> 
<!--                                                <tr>
                                                    <td><input type="checkbox" name="fault1" checked/></td>
                                                   <th scope="row">1.</th>

                                                   <td>Fault 1</td>
                                                   
                                                   <td>Rs. 100</td>
                                                   
                                               </tr>

                                               <tr>
                                               <td><input type="checkbox" name="fault1" checked/></td>
                                                   <th scope="row">2.</th>
                                                   <td>Fault 2</td>
                                                   
                                                   <td>Rs. 100</td>
                                                   
                                               </tr>

                                               <tr>
                                               <td><input type="checkbox" name="fault1" checked/></td>
                                                   <th scope="row">3.</th>
                                                   <td>Fault 3</td>
                                                   
                                                   <td>Rs. 100</td>
                                                   
                                               </tr>

                                               <tr>
                                               <td><input type="checkbox" name="fault1" checked/></td>
                                                   <th scope="row">4.</th>
                                                   <td>Fault 4</td>
                                                   
                                                   <td>Rs. 100</td>
                                                   
                                               </tr>
                                                -->
                                           </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- Main Wrapper -->
                              
                    
                        

                      
                        
                        
                        <div class="form-group" style="margin-left:250px;margin-bottom:50px">
                            <label class="col-lg-3 control-label">Total :</label>
                                    <input type="text" value="<%=totalPrice %>"  class="col-lg-3 control-label" id="pickup" disabled="disabled">

                        </div>

                   
                       
                        <div class="form-group">
                            

                            <div style="margin-left: 180px; float:left;">
                                <button type="submit" class="btn btn-primary" name="search" value="search" style="width:150px; height:40px; background-color:#e34; border-color : #e34;">Notify User</button>
                                
                            </div>

                            <div  style="margin-right: 160px; float:right;">
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





<%
		}
		else {
			out.println ("Not a Service");
		}
%>


</body>
</html>
