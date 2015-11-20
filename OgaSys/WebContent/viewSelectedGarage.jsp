<%@page import="java.io.PrintWriter"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.BasicDBObject" %>
<%@ page import="com.ogasys.model.ServiceFault" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<% List<ServiceFault> faultPriceList= (List<ServiceFault>)session.getAttribute( "faultPriceList" );
	PrintWriter pw = response.getWriter();
	BasicDBObject garage = (BasicDBObject) session.getAttribute("garage");
	pw.println(" Garage Name: "+garage.get("Name").toString());
	pw.println(" Pick up price: "+garage.get("pickupprice").toString());
	for(int i=0;i<faultPriceList.size();i++)
	{
		pw.println(faultPriceList.get(i).getFaultName());
		pw.println(faultPriceList.get(i).getFaultPrice());
	}

%>
<div class="col-xs-6 col-md-3 border_result" style="margin-right:20px">
			
			
			
			</div>



</body>
</html>