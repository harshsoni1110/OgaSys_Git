package com.ogasys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.management.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;

import com.mongodb.MongoClient;
import com.ogasys.dao.DBConnection;
import com.ogasys.model.Service;

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
		PrintWriter out = response.getWriter();
		String userId = "564f61d7e4b0e8634a4c6c99"; //session.getAttribute("userId");
		MongoClient mongo = DBConnection.getInstance().getMongoInstance();
		Morphia mor = DBConnection.getInstance().getMorphiaInstance();
		mor.map(Service.class);
		Datastore ds = mor.createDatastore(mongo, "ogasys");
		Service objService = ds.createQuery(Service.class).field("UserId").equal(userId).get();
		out.print(objService);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
