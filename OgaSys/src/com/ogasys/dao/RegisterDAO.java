package com.ogasys.dao;

import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;
import com.ogasys.constant.Constants;
import com.ogasys.model.User;

public class RegisterDAO {
	 public RegisterDAO() throws ClassNotFoundException, MongoException
	   {
	       con=DBConnection.getInstance().getConnection();
	   }
	    private Datastore db;
		public static final String DB_NAME="ogasys";
	   public boolean doRegister(User user) throws ClassNotFoundException, MongoException
	   {
		   
		   try{
			    Morphia morphia = new Morphia ();
				MongoClientURI uri = new MongoClientURI(Constants.DB_URL);	
				MongoClient m = new MongoClient(uri);//"localhost", 27017);
				morphia.map(User.class);
			    db = morphia.createDatastore(m, DB_NAME);
			    db.ensureIndexes();
			    db.save(user);
			    return true;   
		   }
		   catch(Exception ex) {
			   System.err.println( ex.getClass().getName() + ": " + ex.getMessage() );
		   }
	      return false;
	      
	      /*try{
		   DB db=con.getDB("mydb");
		   System.out.println("Connect to database successfully");
	       //boolean auth = db.authenticate(myUserName, myPassword);
		   //System.out.println("Authentication: "+auth);         
		   boolean collectionExists = db.collectionExists("user");  
		   System.out.println("collection exists is "+collectionExists);
		   if (collectionExists == false) {  
			    db.createCollection("users",null);  
			 }  
		   DBCollection collection=db.getCollection("user");
		   System.out.println("Collection user selected successfully");
		   
		   BasicDBObject doc = new BasicDBObject("username",reg.getUsername()).
		            append("password",reg.getPassword());
		   collection.insert(doc); 
		   System.out.println("Document inserted successfully");
		   return true;
	   }
	   catch(Exception ex){
		   System.err.println( ex.getClass().getName() + ": " + ex.getMessage() );   
	   }*/
	   }
	   private final MongoClient con;
}
