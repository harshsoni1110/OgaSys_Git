package com.ogasys.dao;

import org.bson.Document;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.client.MongoDatabase;

public class ChangePasswordDAO {
	
	private final MongoClient con;
	private MongoDatabase db; 

	public ChangePasswordDAO()throws ClassNotFoundException,MongoException
	{
		con=DBConnection.getInstance().getMongoInstance();
	}
	
	public boolean change_password(String curr,String newpass,String uname,String pass)
	{
		MongoClient mongoClient = new MongoClient();
		MongoDatabase db1=mongoClient.getDatabase("ogasys");
		
		if(curr.equals(pass))
		{
			db1.getCollection("User").updateOne(new Document("UserEmailId",uname),new Document("$set", new Document("UserPassword",newpass)));
			return true;
		}
		else{
			return false;
		}
	}
}
