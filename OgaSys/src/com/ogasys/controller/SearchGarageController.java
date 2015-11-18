package com.ogasys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.ogasys.model.Fault;
import com.ogasys.model.Garage;

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
		PrintWriter pw= response.getWriter();
		String location=request.getParameter("location");
		String vehicleType;
		String packageType=request.getParameter("package");
		System.out.println(location);
		System.out.println(packageType);
		try {
			MongoClient m = new MongoClient("localhost", 27017);
		      DB db = m.getDB("ogasys");
		      DBCollection gcollection = db.getCollection("garage");
		      BasicDBObject obj = new BasicDBObject();
		      obj.put("location", location);
		      List <String> glist = gcollection.distinct("_id",obj);
		      Iterator gitr = glist.iterator();
		      DBCollection fcollection = db.getCollection("fault");
		      BasicDBObject obj1 = new BasicDBObject();
		      obj1.put("package",packageType);
		      DBCollection price = db.getCollection("faultPrice");
		      int gncnt=1,fcnt=1;
		      while(gitr.hasNext())
		      {
		    	  String gstring= gitr.next().toString();
		    	  BasicDBObject gar=new BasicDBObject("_id",new ObjectId(gstring));
		    	  DBCursor garage =  gcollection.find(gar);
		    	  DBObject o=garage.next();
		    	  pw.println("<html><body><form id=sform action=Service_Controller method=get>");
		    	  pw.println("<fieldset border=10px color=black><legend>Garage Details</legend>");
		    	  pw.println("name=gar"+gncnt);
		    	  pw.println("<input type=hidden name=gstring value="+gstring+">");
		    	  pw.print("Garage Name: <input form=sform  type=text name=gar"+gncnt+" value=" + o.get("Name")+" >");
		    	  pw.print("Pick-up Rate:<input type=text name=pick"+gncnt+" value=" +o.get("pickupprice")+" ><br>");
		    	  List<String> flist = fcollection.distinct("_id",obj1);
			      Iterator fitr = flist.iterator();
		    	  BasicDBObject andQuery = new BasicDBObject("garageId.$id",gstring);
		    	  //pw.println("<fieldset><legend>Fault Details</legend>");
		    	  double amount=Double.parseDouble(o.get("pickupprice").toString());
		    	  while(fitr.hasNext())
		    	  {
		    		  String fstring= fitr.next().toString();
			    	  BasicDBObject fat=new BasicDBObject("_id",new ObjectId(fstring));
			    	  DBCursor fault =  fcollection.find(fat);
			    	  DBObject f=fault.next();
		    		  andQuery.append("FaultId.$id", fstring);
		    		  DBCursor cursor = price.find(andQuery);
				      while (cursor.hasNext()) {
				    	  DBObject oct = cursor.next();
				    	  amount+=Double.parseDouble(oct.get("price").toString());
				    	  pw.println("Fault Name: <input type=text name=faultname"+fcnt +" value="+f.get("FaultName")+" >");
				    	  pw.println("Price: <input type=text name=price"+fcnt+" id=price"+fcnt+ " value="+oct.get("price")+" ><br>");
				          System.out.println();
				      }
				      fcnt++;
		    	  }
		    	  pw.println("<input type=hidden name=gncnt value="+gncnt+">");
		    	  gncnt++;
		    	  pw.println("Total Amount: "+amount);
		    	  pw.println("<input type=submit name=request value=Request>");
		    	  pw.println("</form></body><html>");
		    	  //pw.println("</fieldset>");
		    	  //pw.println("</fieldset>");
		    	  System.out.println();
		      }
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
