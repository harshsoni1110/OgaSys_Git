package com.ogasys.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.management.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;

import com.mongodb.MongoClient;
import com.ogasys.constant.Constants;
import com.ogasys.dao.DBConnection;
import com.ogasys.model.User;
import com.ogasys.model.temp;

/**
 * Servlet implementation class temporary_remove_it
 */
@WebServlet("/temporary_remove_it")
public class temporary_remove_it extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public temporary_remove_it() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MongoClient mongo = DBConnection.getInstance().getMongoInstance();
		Morphia mor = DBConnection.getInstance().getMorphiaInstance();
		mor.map(temp.class);
		Datastore ds = mor.createDatastore(mongo, Constants.DB_NAME);
		org.mongodb.morphia.query.Query<temp> q = ds.createQuery(temp.class).disableValidation();
		List <temp> ls = q.asList();
		for (temp t : ls){
			System.out.println(t.toString());
		}
			temp t = new temp ();
			t.setMyDate(new Date());
			ds.save(t);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
