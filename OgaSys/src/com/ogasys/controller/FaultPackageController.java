package com.ogasys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;

import com.mongodb.MongoClient;
import com.ogasys.constant.JspFiles;
import com.ogasys.model.Fault;


/**
 * Servlet implementation class FaultPackageController : This servlet will categories faults. 
 * 
 */
@WebServlet("/FaultPackageController")
public class FaultPackageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaultPackageController() {
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
		mor.map(Fault.class);
		Datastore ds = mor.createDatastore(mongo, "ogasys");
		List<Fault> lsFaults = ds.find(Fault.class).asList();
		PrintWriter out = response.getWriter();
		//out.println (lsFaults.toString());
		ArrayList<Fault> lsBasic = new ArrayList <Fault> ();
		ArrayList<Fault> lsPremium = new ArrayList <Fault> ();
		ArrayList<Fault> lsAdvance = new ArrayList <Fault> ();
		
		// classifying faults in Basic , Premium & Advance Package
		
		for (Fault f : lsFaults){
			
			//out.println (f.toString());
			if (f.getPackagetype().equals("Basic")) {
				lsBasic.add(f);
			} 
			else if (f.getPackagetype().equals("Premium")){
				out.println(f.toString());
				lsPremium.add(f);
			}
			else if (f.getPackagetype().equals("Advance")){
				lsAdvance.add(f);
				
			}
		}
		
		
		
		request.setAttribute("BasicPackage", lsBasic);
		request.setAttribute("PremiumPackage", lsPremium);
		request.setAttribute("AdvancePackage", lsAdvance);
		
		RequestDispatcher rd = request.getRequestDispatcher(JspFiles.SEARCH_FILE);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
