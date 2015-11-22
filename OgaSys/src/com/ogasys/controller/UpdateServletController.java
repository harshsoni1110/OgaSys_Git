package com.ogasys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.types.ObjectId;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;
import org.mongodb.morphia.query.Query;

import com.mongodb.MongoClient;
import com.ogasys.constant.Constants;
import com.ogasys.constant.JspFiles;
import com.ogasys.dao.DBConnection;
import com.ogasys.model.Fault;
import com.ogasys.model.FaultPrice;
import com.ogasys.model.Garage;
import com.ogasys.model.Service;
import com.ogasys.model.User;

/**
 * Servlet implementation class UpdateServletController
 */
@WebServlet("/UpdateServletController")
public class UpdateServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServletController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		/*if (session.getAttribute("userGarage") == null) {
			response.sendRedirect(JspFiles.INDEX_FILE);
			return;
		}*/
		PrintWriter out = response.getWriter();
		String serviceId = "5650d6d74b75880a2415786e"; //session.getAttribute("uId");
		
		try {
/*			User user = (User)session.getAttribute("user");
			if (user == null)
				response.sendRedirect(JspFiles.INDEX_FILE);*/
			//else {
				MongoClient mongo = DBConnection.getInstance().getMongoInstance();
				Morphia mor = DBConnection.getInstance().getMorphiaInstance();
				mor.map(Service.class);
				Datastore ds = mor.createDatastore(mongo, Constants.DB_NAME);
				
				//retrieving logged in user services
				
				//Service s = ds.get(Service.class, serviceId);
				Query<Service> qService = ds.createQuery(Service.class);
				qService.and(
						qService.criteria("_id").equal(new ObjectId(serviceId)),
						qService.criteria("ServiceStatus").equal("SERVICE_REQUESTED") // JOBSHEET_APPROVAL_REQUESTED
					);
				
				//if not found then --> remained
				List <Service> lsRServices = qService.asList();
				Service s;
				if (lsRServices.isEmpty())
					s = null;
				else
				{
					s = qService.asList().get(0);
			
					mor.map(Garage.class);
					ds = mor.createDatastore(mongo, Constants.DB_NAME);
					//out.println(s);
					//Garage gUser = (Garage)session.getAttribute("userGarage");
					
					/** needs to comment below two line when added sessions and uncomment above one */
					
					Query <Garage> qGarage = ds.createQuery(Garage.class).field("_id").equal(new ObjectId("564f6b21e4b05a8e53859324"));
					Garage gUser = qGarage.asList().get(0);
					//out.println(gUser);
					
					//Loading Faults and prices of Garage
					
					mor.map(FaultPrice.class);
					ds = mor.createDatastore(mongo, Constants.DB_NAME);
					//out.println(gUser.getGarageId());
					Query <FaultPrice> qFaultPrice = ds.createQuery(FaultPrice.class).field("GarageId").equal(gUser.getGarageId().toString());
					List <FaultPrice> lsFaultPrice = qFaultPrice.asList();

					out.println(lsFaultPrice);
					/*for (FaultPrice f : lsFaultPrice) {
						out.print(f.toString());
					}*/
					//

					mor.map(Fault.class);
					ds = mor.createDatastore(mongo, Constants.DB_NAME);
					//out.println(gUser.getGarageId());
					Query <Fault> qFault = ds.createQuery(Fault.class);
					List <Fault> lsFaults = qFault.asList();
					
					//qFault.field("")
					
					mor.map(User.class);
					ds = mor.createDatastore(mongo, Constants.DB_NAME);
					Query <User> qUser = ds.createQuery(User.class).field("_id").equal(new ObjectId(s.getUserid()) );
					
					

					request.setAttribute("ServiceRequester", qUser.asList().get(0));
					request.setAttribute("RequestedServiceObj", s);
					request.setAttribute("GarageFaultPrice", lsFaultPrice);
					request.setAttribute("AllFaults", lsFaults);
					RequestDispatcher rd = request.getRequestDispatcher(JspFiles.UPDATE_SERVICE_FAULTS_FILE);
					rd.forward(request, response);
					return;

					
					
				}
				
				
			//}


			
		}
		catch (Exception ex){
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
