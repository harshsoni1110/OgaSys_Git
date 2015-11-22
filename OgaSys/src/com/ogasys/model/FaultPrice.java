package com.ogasys.model;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Property;

public class FaultPrice {

	@Override
	public String toString() {
		return "FaultPrice [FaultPriceId=" + FaultPriceId + ", garageId=" + garageId + ", FaultId=" + FaultId
				+ ", price=" + price + ", FaultName=" + FaultName + "]";
	}
	@Id
	ObjectId FaultPriceId;
	//ObjectId garageId;
	@Property ("GarageId")
	String garageId;
	@Property ("FaultId")
	String FaultId;
	//ObjectId FaultId;
	@Property ("Price")
	String price;
	
	@Property ("FaultName")
	String FaultName;
	public String getGarageId() {
		return garageId;
	}
	public void setGarageId(String garageId) {
		this.garageId = garageId;
	}
	public String getFaultId() {
		return FaultId;
	}
	public void setFaultId(String faultId) {
		FaultId = faultId;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public ObjectId getFaultPriceId() {
		return FaultPriceId;
	}
	
	public String getFaultName() {
		return FaultName;
	}
	public void setFaultName(String faultName) {
		FaultName = faultName;
	}
	
	
	
}
