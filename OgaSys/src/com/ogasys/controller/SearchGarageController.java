package com.ogasys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.ogasys.constant.Constants;
import com.ogasys.dao.DBConnection;
import com.ogasys.model.Fault;
import com.ogasys.model.Garage;
import com.ogasys.model.SearchResult;
import com.sun.corba.se.impl.orbutil.closure.Constant;

/**
 * Servlet implementation class SearchGarageController
 */
@WebServlet("/SearchGarageController")
public class SearchGarageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchGarageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
	/*	PrintWriter out = response.getWriter();
		MongoClient mongo = new MongoClient("localhost",27017);
		Morphia mor = new Morphia ();
		mor.map(Garage.class);*/
		PrintWriter pw= response.getWriter();
		String location=request.getParameter("location");
		String vehicleType=request.getParameter("vtype");
		String packageType=request.getParameter("package");
		System.out.println(location);
		System.out.println(packageType);
		try {
			MongoClient m = null;//new MongoClient("localhost", 27017);
			m=DBConnection.getInstance().getMongoInstance();  
			DB db = m.getDB("ogasys");
		      // Retrieving Garage Collection
		      
		      DBCollection gcollection = db.getCollection("Garage");
		      // Searching Garage by Location
		      
		      BasicDBObject obj = new BasicDBObject();
		      BasicDBObject address = new BasicDBObject();
		      address.put("City", "Ahmedabad");
		      obj.put("Address.City", location);
		      List <ObjectId> glist = (ArrayList <ObjectId>)gcollection.distinct("_id",obj);
		      //System.out.println("GLIST SIZE " +glist.size());
		      // Setting iterator over Garage list
		      //System.out.println(glist.get(0));
		      Iterator  <ObjectId> gitr = glist.iterator();
		      
		      // Retrieving Fault Collection
		      DBCollection fcollection = db.getCollection("Fault");
		      BasicDBObject obj1 = new BasicDBObject();
		      
		      //Searching Faults as per PackageType selected
		      obj1.put("Package",packageType);
		      
		      // Retrieving FaultPrice Collection
		      DBCollection price = db.getCollection("FaultPrice");
		      List <SearchResult> resultList = new <SearchResult>ArrayList();
		      List <ObjectId> lsFault = new <ObjectId> ArrayList();
		      List <ObjectId> flist = fcollection.distinct("_id",obj1);
		      System.out.println("FLIST SIZE " +flist.size());
	    	  lsFault = flist;
		      int gncnt=1,fcnt=1;
		      while(gitr.hasNext())
		      {
		    	  SearchResult searchResult = new SearchResult();
		    	  ObjectId gstring= gitr.next();
		    	  
		    	  searchResult.setGarageId(gstring.toString());
		    	  BasicDBObject gar=new BasicDBObject("_id",gstring);
		    	  DBCursor garage =  gcollection.find(gar);
		    	  DBObject o=garage.next();
		    	  searchResult.setGarageName(o.get("GarageName").toString());
		    	  if(o.get("PickUpAvailability").toString().equals("1"))
		    	  {
		    		  searchResult.setPickUp(o.get("PickUpPrice").toString());
		    	  }
		    	  pw.println("<html><body><form id=sform action=Service_Controller method=get>");
		    	  pw.println("<fieldset border=10px color=black><legend>Garage Details</legend>");
		    	  pw.println("name=gar"+gncnt);
		    	  pw.println("<input type=hidden name=gstring value="+gstring+">");
		    	  pw.print("Garage Name: <input form=sform  type=text name=gar"+gncnt+" value=" + o.get("GarageName")+" >");
		    	  pw.print("Pick-up Rate:<input type=text name=pick"+gncnt+" value=" +o.get("PickUpPrice")+" ><br>");
			      Iterator fitr = flist.iterator();
		    	  BasicDBObject andQuery = new BasicDBObject("GarageId",gstring.toString());
		    	  //pw.println("<fieldset><legend>Fault Details</legend>");
		    	  // Setting TotalAmount 
		    	  double amount = Double.parseDouble(o.get("PickUpPrice").toString());
		    	  while(fitr.hasNext())
		    	  {
		    		  ObjectId fstring= (ObjectId) fitr.next();
		    		  System.out.println("fstring "+fstring);
		    		  //lsFault.add(new ObjectId(fstring.toString()));
			    	  BasicDBObject fat=new BasicDBObject("_id",fstring);
			    	  DBCursor fault =  fcollection.find(fat);
			    	  DBObject f=fault.next();
			    	  System.out.println(f.get("FaultName"));
		    		  andQuery.append("FaultId", fstring.toString());
		    		  DBCursor cursor = price.find(andQuery);
				      while (cursor.hasNext()) {
				    	  DBObject oct = cursor.next();
				    	  amount += Double.parseDouble(oct.get("Price").toString());
				    	  pw.println("Fault Name: <input type=text name=faultname"+fcnt +" value="+f.get("FaultName")+" >");
				    	  pw.println("Price: <input type=text name=price"+fcnt+" id=price"+fcnt+ " value="+oct.get("Price")+" ><br>");
				          System.out.println();
				      }
				      fcnt++;
		    	  }
		    	  pw.println("<input type=hidden name=gncnt value="+gncnt+">");
		    	  gncnt++;
		    	  pw.println("Total Amount: "+amount);
		    	  searchResult.setEstimatedCost(amount);
		    	  pw.println("<input type=submit name=request value=Request>");
		    	  pw.println("</form></body><html>");
		    	  //pw.println("</fieldset>");
		    	  //pw.println("</fieldset>");
		    	  resultList.add(searchResult);
		    	  System.out.println();
		      }
		      HttpSession session = request.getSession();
		      session.setAttribute("resultList", resultList);
		      session.setAttribute("lsFault", lsFault);
		      session.setAttribute("VehicleType", vehicleType);
		      System.out.println(lsFault.size());
		      response.sendRedirect("searchResults.jsp");
		}
		catch (Exception ex) {
			
		}
		pw.println ("<h1> DONE</h1>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
