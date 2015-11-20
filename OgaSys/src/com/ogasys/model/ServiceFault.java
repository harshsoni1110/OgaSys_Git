package com.ogasys.model;

import org.mongodb.morphia.annotations.Embedded;

@Embedded
public class ServiceFault {
	String faultName;
	double faultPrice;
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
