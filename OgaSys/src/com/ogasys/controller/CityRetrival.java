package com.ogasys.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.ogasys.model.Garage;
import com.sun.xml.internal.ws.wsdl.writer.document.Service;

/**
 * Servlet implementation class CityRetrival
 */
@WebServlet("/CityRetrival")
public class CityRetrival extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityRetrival() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MongoClient mongo = new MongoClient("localhost",27017);
		Morphia mor = new Morphia();
		mor.map(Garage.class);
		Datastore ds = mor.createDatastore(mongo, "ogasys");
		List<Garage> ser = ds.find(Garage.class).asList();
		
		Iterator itr = ser.iterator();
		while (itr.hasNext()) {
			Garage one = (Garage) itr.next();
	//		System.out.print("Name " + one.getEmail());
		//	System.out.println(" Area " +one.getLocation());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
