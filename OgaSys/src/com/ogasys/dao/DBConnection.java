package com.ogasys.dao;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.Morphia;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;
import com.ogasys.constant.*;
/**
 * 
 * @author Ogasys Team
 *
 */
public class DBConnection {

	/**
	 * private constructor will establish connection to Mongo Database
	 */
    private DBConnection() 
    {
		// This property needs to be set for mongodb remote connection -- MUST REQUIRED! 
		System.setProperty("java.net.preferIPv4Stack" , "true");
		
		try {
			// create Mongo URL with provided credentials
			uri = new MongoClientURI(Constants.DB_URL);
			
			//connect to mongodb remotely
			mongo = new MongoClient(uri);
			
			//using Morphia java framework
			mor = new Morphia();
			
			//selecting "ogasys" database
		/*	ds = mor.createDatastore(mongo, "ogasys");*/
		} catch (MongoException e) {
			//detecting exceptions
			System.out.println(e.toString());
		}
    	
    }
     
    /**
     * 
     * @return instance of DBConnection
     */
    public static DBConnection getInstance(){
        if (instance == null )
            instance = new DBConnection();
        return instance;
    }
    /**
     * 
     * @return instance of MongoClient
     */
    public MongoClient getMongoInstance (){
    	return mongo;
    } 
    /**
     * 
     * @return instance of Datastore
     */
    public Datastore getConnection() {        
        return ds;
    }
    
    /**
     * close connection with
     */
    public Morphia getMorphiaInstance()
    {
    	return mor; 
    }

    public void close(){
        mongo.close();
        instance = null;
    }

    private MongoClient mongo  =  null;
    private MongoClientURI uri = null;
    private Morphia mor=null;
    private Datastore ds = null;
    private static DBConnection instance = null;
    
}