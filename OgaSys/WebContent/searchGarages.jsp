<%@page import="java.io.PrintWriter"%>
<%@page import="com.ogasys.model.Fault"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<%

	ArrayList <Fault> lsBasic = (ArrayList<Fault>)request.getAttribute("BasicPackage");
	ArrayList <Fault> lsPremium = (ArrayList <Fault>)request.getAttribute("PremiumPackage");
	ArrayList <Fault> lsAdvance = (ArrayList <Fault>)request.getAttribute("AdvancePackage");
	if (lsBasic == null || lsPremium == null || lsAdvance == null) {
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/FaultPackageController");
		rd.forward(request, response);

	
}
	
%>


<head>
    <title>::Search Garages::</title>

    <link rel="stylesheet" href="assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="/assets/css/bootstrapValidator.css"/>

    <!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <!--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />-->
	<%! 
		String basicPkgFaultName = "";
		String premiumPkgFaultName = "";
		String advancePkgFaultName = "";
	%>	

    <script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrapValidator.js"></script>
    <script>
    $(document).ready ( function () {
		<%
			
			basicPkgFaultName = "";
			premiumPkgFaultName = "";
			advancePkgFaultName = "";
			

			for (Fault f : lsBasic) {
				basicPkgFaultName += "<li>" + f.getFaultname() + "</li>";
		 	} 
			
			
			premiumPkgFaultName = basicPkgFaultName;// + "<ul>";
			for (Fault f : lsPremium) {
				premiumPkgFaultName += "<li>" + f.getFaultname() + "</li>";
		 	} 
			
			advancePkgFaultName = premiumPkgFaultName;// + "<ul>";
			for (Fault f : lsAdvance) {
				advancePkgFaultName += "<li>" + f.getFaultname() + "</li>";
		 	} 
			
		%>
		pkgDet = document.getElementById("faultList");
		pkgDet.innerHTML = "<%=basicPkgFaultName %>";	
	
   });
    	
    
	function loadFaults (ele) {
		pkgType = ele.value;
		// setting type of package
		pkgTextEle = document.getElementById("pkgText");
		pkgTextEle.innerHTML = pkgType;
		
		//retriving package details div
		pkgDet = document.getElementById("faultList");
		pkgDet.innerHTML = "";
		
		if (pkgType.match ("Basic")){
			pkgDet.innerHTML = "<%=basicPkgFaultName %>";
			
		}
		else if (pkgType.match ("Premium")) {
			//alert ("<%=lsPremium.size() %>");
			pkgDet.innerHTML = "<%=premiumPkgFaultName %>";

		}
		else {
			pkgDet.innerHTML = "<%=advancePkgFaultName %>";
		}

	}



	</script>    
</head>
<body background="bg.jpg">
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation" >
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <b> <a class="navbar-brand topnav" href="index.jsp">Ogasys</a></b>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <span><a href="#" data-toggle="modal" data-target="#myModal" style="font-size : 26px;">Login</span></a>
                    </li>
               
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container" style="margin-top: 60px;">
        <div class="row">
            <!-- form: -->
            <!-- <section> -->
                <div class="col-lg-8 col-lg-offset-2">
                  <div class="panel panel-primary" style="box-shadow: 5px 5px 5px 5px #888888; margin-top:80px">
                    <div class="panel-heading">
                        <h3 class="panel-title">Search Garages</h3>
                    </div>
                    <div class="panel-body">
                    <form id="defaultForm" method="get" class="form-horizontal" action="${pageContext.request.contextPath}/SearchGarageController">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Select City :</label>
                            <select class="form-control" id="location" style="width:30%" name="location">
                                <option>Ahemadabad</option>
                                <option>Gandhinagar</option>
                                <option>regional</option>
                            </select>
                                                    
                        </div>

                       



                       
                       
                        
                         
                         <div class="form-group">
                            <label class="col-lg-3 control-label">Vehicle Type</label>
                            <div class="col-lg-5">
                                <div class="inline-radio">
                                    <label>
                                        <input type="radio" name="vtype" value="2 Wheeler" checked="checked" /> 2 Wheeler
                                    </label>
                                
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label>
                                        <input type="radio" name="vtype" value="4 Wheeler" /> 4 Wheeler
                                    </label>
                                </div>
                                
                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Select Package :</label>
                            <select class="form-control" name="package" id="package" style="width:30%" 
                            onchange="loadFaults(this);">
                                <option value="Basic">Basic</option>
                                <option value="Premium">Premium</option>
                                <option value="Advanced">Advanced</option>
                            </select>
                                                    
                        </div>
                        <div style="margin-left: 60px">
                       <h4>
                       		Faults Covered in <span id = "pkgText" > </span> 
                       </h4>
                       <ol id="faultList">
                        <li>Basic1</li>
                        <li>Basic2</li>
                        <li>Basic3</li>
                       </ol>
                       </div>
                    <script type="text/javascript">
                        function faults(sel)
                        {
                            var e = document.getElementById("package");
                            var pack = e.options[e.selectedIndex].value;
                            
                            if ( pack == "Basic" ) {

                            document.getElementById("faultList").innerHTML = "<li>Basic1</li><li>Basic2</li><li>Basic3</li>";
                            }
                            else if ( sel.options[sel.selectedIndex].value == "Premium" ) {
                            //faults.innerHTML = "Hello"
                            document.getElementById("faultList").innerHTML = "<li>Premium1</li><li>Premium2</li><li>Premium3</li>";
                            }
                            else if ( sel.options[sel.selectedIndex].value == "Advanced" ) {
                            document.getElementById("faultList").innerHTML = "<li>Advanced1</li><li>Advanced2</li><li>Advanced3</li>";
                            }
                           
                        }

                    </script>
                       
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3 " style="margin-left: 20   0px; ">
                                <button type="submit" class="btn btn-primary" name="search" value="search" style="width:300px; height:40px">Search Garage</button>
                                
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
