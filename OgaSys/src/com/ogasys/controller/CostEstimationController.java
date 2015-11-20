package com.ogasys.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import com.mongodb.BasicDBObject;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.ogasys.model.FaultPrice;
import com.ogasys.model.Service;
import com.ogasys.model.ServiceFault;

/**
 * Servlet implementation class CostEstimationController
 */
@WebServlet("/CostEstimationController")
public class CostEstimationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CostEstimationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String garageId = request.getParameter("id");
		HttpSession session = request.getSession();
		List<ObjectId> lsFault = (List<ObjectId>) session.getAttribute("lsFault");
		List<ServiceFault> faultPriceList = new ArrayList <ServiceFault>();
		MongoClient mongoClient = new MongoClient();
		DB db = mongoClient.getDB("ogasys");
		DBCollection fpricecollection = db.getCollection("faultPrice");
		DBCollection fcollection = db.getCollection("fault");
		BasicDBObject query = new BasicDBObject();
		query.put("garageId.$id", garageId);
		for(int i=0;i<lsFault.size();i++)
		{
			//System.out.println(lsFault.get(i));
			query.append("FaultId.$id", lsFault.get(i).toString());
			BasicDBObject query1 = new BasicDBObject().append("_id", lsFault.get(i));
			DBCursor cursor = fpricecollection.find(query);
			DBCursor cursor1 = fcollection.find(query1);
			BasicDBObject priceobj = (BasicDBObject) cursor.next();
			BasicDBObject fltname = (BasicDBObject) cursor1.next();
			ServiceFault serviceFault = new ServiceFault();
			//System.out.println(fltname.get("FaultName").toString());
			//System.out.println(Double.parseDouble(priceobj.get("price").toString()));
			serviceFault.setFaultName(fltname.get("FaultName").toString());
			serviceFault.setFaultPrice(Double.parseDouble(priceobj.get("price").toString()));
			//System.out.println(serviceFault.getFaultName() + "   " + serviceFault.getFaultPrice());
			faultPriceList.add(serviceFault);
		}
		DBCollection gcollection = db.getCollection("garage");
		Cursor cur = gcollection.find(new BasicDBObject().append("_id", new ObjectId(garageId)));
		BasicDBObject garage = (BasicDBObject)cur.next();
		session.setAttribute("garage", garage);
		session.setAttribute("faultPriceList", faultPriceList);
		response.sendRedirect("garageEstimation.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
