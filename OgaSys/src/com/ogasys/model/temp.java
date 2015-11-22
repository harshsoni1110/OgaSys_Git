package com.ogasys.model;

import java.util.Date;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Property;


@Entity (value="temp")
public class temp {
	@Override
	public String toString() {
		return "temp [objectId=" + objectId + ", myDate=" + myDate + "]";
	}

	public ObjectId getObjectId() {
		return objectId;
	}

	public void setObjectId(ObjectId objectId) {
		this.objectId = objectId;
	}

	public Date getMyDate() {
		return myDate;
	}

	public void setMyDate(Date myDate) {
		this.myDate = myDate;
	}

	@Id
	ObjectId objectId;

	@Property("date")
	Date myDate;
}
