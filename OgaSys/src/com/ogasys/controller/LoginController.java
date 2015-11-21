package com.ogasys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;
import org.mongodb.morphia.query.Query;

import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.ogasys.constant.Constants;
import com.ogasys.constant.JspFiles;
import com.ogasys.controller.action.UserRegister;
import com.ogasys.dao.DBConnection;
import com.ogasys.model.Service;
import com.ogasys.model.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
				PrintWriter out = response.getWriter();
				HttpSession session = request.getSession();
				if (session.getAttribute("user") == null) {
					String userName= request.getParameter("uname");
					String password= request.getParameter("pwd");
					 
					
					MongoClient mongo = DBConnection.getInstance().getMongoInstance();
					Morphia mor = DBConnection.getInstance().getMorphiaInstance();
					mor.map(User.class);
					Datastore ds = mor.createDatastore(mongo, Constants.DB_NAME);
					Query<User> q = ds.createQuery(User.class);
			           q.and( 
			          		 q.criteria("UserEmailId").equal(userName),  
			          		 q.criteria("UserPassword").equal(password)
			        	);
			         
			           if (q.asList().isEmpty()) {
			        	   //out.println(q.asList() + "null");
			        	   response.sendRedirect(JspFiles.INDEX_FILE);
			           }
			           else {
			        	   	out.println(q.asList() );
				        	User user = q.asList().get(0);
				        	session.setAttribute("user", user);
				        	response.sendRedirect(JspFiles.SEARCH_GARAGE_FILE);
			           }
				
				}
				else{
					response.sendRedirect(JspFiles.INDEX_FILE);
					//return;
				}
					
				//PrintWriter out = response.getWriter();
				
			}
			catch (MongoException ex) {
	            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
	        } catch (Exception e) {
	        	System.out.println(e);
			}
		
	}

	
}
