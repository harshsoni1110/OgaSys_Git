package com.ogasys.model;

import java.util.ArrayList;

import org.mongodb.morphia.annotations.Embedded;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
@Entity (value="Service",noClassnameStored=true)
public class Service {
	@Id
	String ServiceId;
	String garageId;
	String userid;
	String serviceStatus;
	public String getServiceStatus() {
		return serviceStatus;
	}
	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
	}
	double pick;
	@Embedded
	ArrayList <ServiceFault> faults;
	public double getPick() {
		return pick;
	}
	public void setPick(double pick) {
		this.pick = pick;
	}
	public String getServiceId()
	{
		return ServiceId;
	}
	public String getGarageId() {
		return garageId;
	}
	public void setGarageId(String garageId) {
		this.garageId = garageId;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public ArrayList<ServiceFault> getFaults() {
		return faults;
	}
	public void setFaults(ArrayList<ServiceFault> faults) {
		this.faults = faults;
	}
}
