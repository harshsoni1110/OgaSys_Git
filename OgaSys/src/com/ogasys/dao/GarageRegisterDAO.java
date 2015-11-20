package com.ogasys.dao;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;
import com.mongodb.MongoException;
import com.ogasys.model.Garage;
/*
 *  @author Ogasys Team
 */
public class GarageRegisterDAO {
	
	/*
	 *  The below constructor has been used to get the object of Datastore
	 */
	public GarageRegisterDAO() throws ClassNotFoundException, MongoException
	   {
	       db=DBConnection.getInstance().getConnection();
	   }
	 
	/*  
	 *  doRegister(Garage garage) is used to register the garage
	 */
	   public boolean doRegister(Garage garage) throws ClassNotFoundException, MongoException
	   {
		   
		   try{
			    Morphia morphia = new Morphia ();
				morphia.map(Garage.class);
			    db.ensureIndexes();
			    db.save(garage);
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
