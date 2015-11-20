package com.ogasys.dao;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.ogasys.controller.action.UserRegister;
import com.ogasys.model.Address;
import com.ogasys.model.SignInModel;
import com.ogasys.model.User;
import org.bson.types.ObjectId;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.query.Query;

import java.awt.image.RescaleOp;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.bson.types.ObjectId;

public class OgaSysDAOImpl implements OgaSysDAO {

    private final Datastore ds;
    public OgaSysDAOImpl() throws MongoException {
       ds = DBConnection.getInstance().getConnection();
    }
    

    public SignInModel SignInValidate(SignInModel model) throws SQLException 
    {
        return null;
    }


	@Override
	public void getUser() {
     		
		
	}


	@Override
	public void insertUser(User u) {
		
		
	}


	@Override
	public List<User> getUserDetailsById(Object userId) {		
		List<User> userList=null;
		try{
			userList=ds.find(User.class).asList();
			Query<User> q=ds.createQuery(User.class);
			System.out.println("Here");
	        q.and( 
	        		 q.criteria("_id").equal(userId)  
	        		 );		   
			   userList=q.asList();
		}
		catch (MongoException ex) {
            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception e) {
        	System.out.println("Error: while getting user data "+ e);
		}
		/*try
		{ 
		//Mongo m=new Mongo();
		DB db=con.getDB("ogasys");
		DBCollection collection=db.getCollection("User");
		BasicDBObject searchQuery=new BasicDBObject();
		searchQuery.put("_id",new ObjectId(userId));
		DBCursor cursor =collection.find(searchQuery);
		
		while(cursor.hasNext()) {
			BasicDBObject obj=(BasicDBObject)cursor.next();
		    String firstName=obj.getString("FirstName");
		    String lastName=obj.getString("LastName");
		    String emailId=obj.getString("UserEmailId");
		    String password=obj.getString("UserPassword");
		    long contactNumber=obj.getLong("ContactNumber");
		    int gender=obj.getInt("Gender");
		    String userDpLink=obj.getString("UserProfilePictureLink");
		   
		    BasicDBObject aDB=(BasicDBObject)obj.get("address");
		    
		    Address address=new Address();
		    address.setFlatNumber(aDB.getString("FlatNumber"));
		    address.setStreet(aDB.getString("Street"));
		    address.setLandmark(aDB.getString("Landmark"));
		    address.setCity(aDB.getString("City"));
		    address.setState(aDB.getString("State"));
		    address.setPinCode(Integer.parseInt(aDB.getString("PinCode")));
		   
		    user=new User();
		    user.setId(new ObjectId(userId));
		    user.setFirstName(firstName);
		    user.setLastName(lastName);
		    user.setUserEmailId(emailId);
		    user.setGender(gender);
		    user.setUserProfilePictureLink(userDpLink);
		    user.setAddress(address);
		    user.setContactNumber(contactNumber);
		    user.setUserPassword(password);
		    return user;   
		}
		}
		catch(MongoException ex){
			System.out.println("Error while getting user details "+ex);
		}*/
		return userList;
	}
    
}