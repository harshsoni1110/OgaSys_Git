package com.ogasys.dao;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;
import com.mongodb.MongoException;
import com.ogasys.model.User;

/*
 *  @author Ogasys Team
 */
public class UserRegisterDAO {
	

	/*
	 *  The below constructor has been used to get the object of Datastore
	 */
	public UserRegisterDAO() throws ClassNotFoundException, MongoException
	   {
	       db=DBConnection.getInstance().getConnection();
	   }
	  
	/*  
	 *  doRegister(User user) is used to register the user
	 */	
	   public boolean doRegister(User user) throws ClassNotFoundException, MongoException
	   {
		   
		   try{
			    Morphia morphia = new Morphia ();
				morphia.map(User.class);
			    db.ensureIndexes();
			    db.save(user);
			    return true;   
		   }
		   catch(Exception ex) {
			   System.err.println( ex.getClass().getName() + ": " + ex.getMessage() );
		   }
	      return false;
	      
	   }
	   
	   /*
	    *   db is the object of Datastore class 
	    */
	   private final Datastore db;
}
