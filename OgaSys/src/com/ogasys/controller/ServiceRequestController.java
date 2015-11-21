package com.ogasys.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.ogasys.dao.DBConnection;
import com.ogasys.model.Service;
import com.ogasys.model.ServiceFault;

/**
 * Servlet implementation class ServiceRequest
 */
@WebServlet("/ServiceRequest")
public class ServiceRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceRequestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Service service = new Service();
		HttpSession session = request.getSession();
		BasicDBObject garage = (BasicDBObject) session.getAttribute("garage");
		List<ServiceFault> faultPriceList= (List<ServiceFault>)session.getAttribute( "faultPriceList");
		Double amount=0d;
		service.setGarageId(garage.get("_id").toString());
		service.setUserid("564f61d7e4b0e8634a4c6c99");
		if(request.getParameter("searchwithpick")!=null)
		{
			service.setPickUpRequest("True");
			amount+=Double.parseDouble(garage.get("PickUpPrice").toString());
		}
		else	service.setPickUpRequest("False");
		for(ServiceFault sf: faultPriceList)
			amount+=sf.getFaultPrice();
		service.setFinalAmount(amount.toString());
		service.setServiceStatus("SERVICE_REQUESTED");
		service.setStartDate(new Date());
		service.setVehicleType(session.getAttribute("VehicleType").toString());
		service.setFaults(faultPriceList);
		//System.out.println(service);
		//Datastore ds = DBConnection.getInstance().getConnection();
		//ds.map
		MongoClient m = DBConnection.getInstance().getMongoInstance();
		Morphia mor = new Morphia();
		mor.map(Service.class).map(ServiceFault.class);
		Datastore ds = mor.createDatastore(m, "ogasys");
		ds.save(service);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
