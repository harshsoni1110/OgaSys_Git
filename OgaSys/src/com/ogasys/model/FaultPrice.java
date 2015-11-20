package com.ogasys.model;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Id;

public class FaultPrice {
	@Id
	String FaultPriceId;
	ObjectId garageId;
	ObjectId FaultId;
	String price;
	public String getFaultPriceId() {
		return FaultPriceId;
	}
	public ObjectId getGarageId() {
		return garageId;
	}
	public void setGarageId(ObjectId garageId) {
		this.garageId = garageId;
	}
	public ObjectId getFaultId() {
		return FaultId;
	}
	public void setFaultId(ObjectId faultId) {
		FaultId = faultId;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
}
