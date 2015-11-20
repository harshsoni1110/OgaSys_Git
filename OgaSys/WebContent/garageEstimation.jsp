<%@page import="java.io.PrintWriter"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.BasicDBObject" %>
<%@ page import="com.ogasys.model.ServiceFault" %>

<!DOCTYPE html>
<html>
<head>
    <title>::Search Garages::</title>

    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href=".css/bootstrapValidator.css"/>

    <!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <!--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />-->

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
</head>

<body background="bg.jpg" onload="garageDetails()">
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
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	<% List<ServiceFault> faultPriceList= (List<ServiceFault>)session.getAttribute( "faultPriceList" );
	PrintWriter pw = response.getWriter();
	BasicDBObject garage = (BasicDBObject) session.getAttribute("garage");
	pw.println(" Garage Name: "+garage.get("Name").toString());
	pw.println(" Pick up price: "+garage.get("pickupprice").toString());
	double amount=0;
	for(int i=0;i<faultPriceList.size();i++)
	{
		pw.println(faultPriceList.get(i).getFaultName());
		pw.println(faultPriceList.get(i).getFaultPrice());
		amount+=faultPriceList.get(i).getFaultPrice();
	}

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
                    <form id="defaultForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Garage Name :</label>
                            <label class="col-lg-3 control-label">
								<%=garage.get("Name").toString() %>
                            </label>
                        </div>

                         <div class="form-group">
                            <label class="col-lg-3 control-label">Address : </label>
                            
                                
                                    <label  class="col-lg-3 control-label">
                                         <%=garage.get("address").toString() %>
                                    </label>
                            
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Contact No :</label>
                            
                                
                                    <label  class="col-lg-3 control-label">
                                         <%=garage.get("contact").toString() %>
                                    </label>
                            
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Pickup Charge :</label>
                            
                                
                                    <label  class="col-lg-3 control-label" id="pickup">
                                         <%=garage.get("pickupprice").toString() %>
                                    </label>
                        </div>
                        <hr style="height:50px; border-top:1px solid #3be; margin-bottom:-20px">
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Total :</label>
                            
                                
                                    <input type="text" value="<%=amount %>"  class="col-lg-3 control-label" id="pickup">
                                         
                                    
                        </div>

                   
                       
                        <div class="form-group">
                            <div style="margin-left: 200px; float:left;">
                                <button type="submit" class="btn btn-primary" name="search" value="search" style="width:150px; height:40px; background-color:#e34; border-color : #e34;">Request For Service</button>
                                
                            </div>

                            <div  style="margin-right: 200px; float:right;">
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