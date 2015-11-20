package com.ogasys.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.mongodb.morphia.Datastore;
import com.mongodb.MongoException;
import com.ogasys.controller.action.UserRegister;
import com.ogasys.model.Login;
import com.ogasys.model.User;
import org.mongodb.morphia.mapping.Mapper;
import org.mongodb.morphia.query.Query;
import org.mongodb.morphia.query.UpdateOperations;


public class UserLoginDAO {

	public UserLoginDAO() throws ClassNotFoundException,MongoException{
		ds=DBConnection.getInstance().getConnection();
	} 
	
	public User authenticate(Login login)
	{
		User user=null;
		
		try{
		   List<User> userList=null;
		   userList=ds.find(User.class).asList();
		   Query<User> q=ds.createQuery(User.class);
           q.and( 
        		 q.criteria("UserEmailId").equal(login.getUserName())  
        		 );		   
		   userList=q.asList();
		   user=userList.get(0);
		   for (User u : userList){
			   System.out.println(u);
		   }
		}
		catch (MongoException ex) {
            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
        	System.out.println("Password Encryption failed"+ e);
		}
	    return user;	
	}
	private final Datastore ds;
}
