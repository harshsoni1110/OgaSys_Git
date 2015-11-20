package com.ogasys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.mapping.Mapper;
import org.mongodb.morphia.query.Query;
import org.mongodb.morphia.query.UpdateOperations;

import com.ogasys.dao.DBConnection;
import com.ogasys.model.Notification;


/**
 * Servlet implementation class NotificationRetrieval : will retrieve all notifications
 */
@WebServlet("/NotificationRetrieval")
public class NotificationRetrieval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationRetrieval() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
/*		MongoClient mongo = new MongoClient ("localhost" , 27017);
		Morphia mor = new Morphia ();
		mor.map(Notification.class);
		Datastore ds = mor.createDatastore(mongo, "ogasys");

*/
		// getting database connection object
		Datastore ds = DBConnection.getInstance().getConnection();
		List <Notification> notificationList = ds.find(Notification.class).asList();
		
		
		HttpSession session=request.getSession();
		Query<Notification> q = ds.createQuery(Notification.class);
		q.and(
		    q.criteria("MsgToId").equal("564c27316b334ec6665a28fe"), //session.getAttribute("ObjectId").toString()),
		    q.criteria("NotificationStatus").equal("1")
		);
		notificationList = q.asList();
		session.setAttribute("NotificationList", notificationList);
		String jsonString = "";
		
		for(int in=0;in<notificationList.size();in++)
		{
			notificationList.get(in).notificationContentGenerator();
		}
		
		/**
		 * iCount: Count number of notification objects and concate jsonString
		 */
		int iCount = 1;
		jsonString = "{\"Notification\":[";
		for (Notification n : notificationList){
			
			// Creating JSON String of Notification Object
			
			jsonString += "{\"ObjectId\":\""+n.getId() + "\"" +
							",\"MsgFromId\":\"" +n.getMsgFromId()+ "\"" +
							",\"MsgToId\":\"" + n.getMsgToId()+"\"" +
							",\"ServiceId\":\"" + n.getServiceId()+"\"" +
							",\"NotificationType\":\"" + n.getNotificationType() +"\"" +
							",\"NotificationStatus\":\"" + n.getNotificationStatus() +"\""+
							",\"MsgGenerator\":\"" + n.getMsgGenerator() +"\""+
							",\"NotificationContent\":\"" + n.getNotificationContent() + "\"";
			if (iCount == notificationList.size())
					jsonString += "}";
			else
				jsonString += "},";
			iCount++;
			
		}
		
		
		// Adding end of JSON String

		jsonString += "]}"; 
			
		out.println(jsonString);
		
		
		
		for (Notification n : notificationList)
		{
			// Updating notification status means shown by users and delivered to users
			UpdateOperations<Notification> ops = ds.createUpdateOperations(Notification.class).set("NotificationStatus","0");
			ds.update(ds.createQuery(Notification.class).field(Mapper.ID_KEY).equal(n.getId()), ops);
		}
		//System.out.println("Notifications Generated" + notificationList.get(0).getNotificationContent());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

}
