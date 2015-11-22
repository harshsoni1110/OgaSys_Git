<%@page import="com.ogasys.constant.JspFiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ogasys.model.Service"%>
<%@page import="com.ogasys.model.ServiceFault"%>
<%@page import="com.ogasys.model.FaultPrice"%>
<%@page import="com.ogasys.model.Fault"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	ArrayList <ServiceFault> lsServiceFaults = new ArrayList <ServiceFault>();
	ArrayList <FaultPrice> lsGarageFaultsPrice = new ArrayList <FaultPrice>();
	ArrayList <Fault> lsFaults = new ArrayList <Fault>();
	String s1 = "";
%>
<%
		s = (Service)request.getAttribute("RequestedServiceObj");
		if (s != null) {
			lsServiceFaults = s.getFaults();
			lsGarageFaultsPrice = (ArrayList <FaultPrice>) request.getAttribute("GarageFaultPrice");
			lsFaults = (ArrayList <Fault>)request.getAttribute("AllFaults");
		//	out.println(lsGarageFaultsPrice);
		//	out.println("Service Faults " + lsServiceFaults);
			
%>
<script type="text/javascript" src="assets/js/jquery.js" ></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
Update Service Page.
<form name="faultForm">
<%
	out.println("Fault Price");
	s1 += "<table>";
	boolean flag = false;
	for (Fault fault : lsFaults) {
		s1+= "<tr>";
		for (FaultPrice faultPrice : lsGarageFaultsPrice) {
			flag = false;
			if (fault.getFaultId().toString().equals(faultPrice.getFaultId())) {
				s1 += "<td><Input type = \"checkbox\" value = \""+ fault.getFaultId().toString() + "\" checked/>" + fault.getFaultName()+ "</td>" ;
				flag = true;
				break;	
			}
			
		//out.println(f);
		}
		if (!flag)
			s1 += "<td><Input type = \"checkbox\" value = \""+ fault.getFaultId().toString() + "\"/>" + fault.getFaultName()+ "</td>" ;

		s1+="</tr>";
	}
	s1 += "</table>";
	out.println(s1);
	
		
	
%>

</form>
</body>
<%}
		else out.println("not a service");
%>
</html>