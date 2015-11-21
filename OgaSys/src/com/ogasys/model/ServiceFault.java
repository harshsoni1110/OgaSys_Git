package com.ogasys.model;

import org.mongodb.morphia.annotations.Embedded;

@Embedded
public class ServiceFault {
	String faultId;
	String faultName;
	double faultPrice;
	
	@Override
	public String toString() {
		return "[faultId=" + faultId + ", faultName=" + faultName + ", faultPrice=" + faultPrice + "]";
	}
	public String getFaultId() {
		return faultId;
	}
	public void setFaultId(String faultId) {
		this.faultId = faultId;
	}
	public String getFaultName() {
		return faultName;
	}
	public void setFaultName(String faultName) {
		this.faultName = faultName;
	}
	public double getFaultPrice() {
		return faultPrice;
	}
	public void setFaultPrice(double faultPrice) {
		this.faultPrice = faultPrice;
	}
}
