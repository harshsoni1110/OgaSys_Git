package com.ogasys.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mongodb.morphia.annotations.Embedded;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Property;
@Entity (value="Service",noClassnameStored=true)
public class Service {
	@Override
	public String toString() {
		return "Service [serviceId=" + serviceId + ", garageId=" + garageId + ", userid=" + userid + ", serviceStatus="
				+ serviceStatus + ", serviceType=" + serviceType + ", vehicleType=" + vehicleType + ", startDate="
				+ startDate + ", completeDate=" + completeDate + ", finalAmount=" + finalAmount + ", faults=" + Faults
				+ ", payment=" + payment + ", pickUpRequest=" + pickUpRequest + "]";
	}
	@Id
	String serviceId;
	@Property ("GarageId")
	String garageId;
	@Property ("UserId")
	String userid;
	@Property ("ServiceStatus")
	String serviceStatus;
	@Property ("ServiceType")
	String serviceType;
	@Property ("VechicleType")
	String vehicleType;
	@Property ("StartDateTime")
	Date startDate;
	@Property ("CompleteDateTime")
	Date completeDate;
	@Property ("FinalAmount")
	String finalAmount;
	@Embedded
	List <ServiceFault> Faults;
	@Property ("Payment")
	String payment;
	@Property ("PickUpRequest")
	String pickUpRequest;
	public String getPickUpRequest() {
		return pickUpRequest;
	}
	public void setPickUpRequest(String pickUpRequest) {
		this.pickUpRequest = pickUpRequest;
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
	public String getServiceStatus() {
		return serviceStatus;
	}
	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}
	public String getFinalAmount() {
		return finalAmount;
	}
	public void setFinalAmount(String finalAmount) {
		this.finalAmount = finalAmount;
	}
	public List<ServiceFault> getFaults() {
		return Faults;
	}
	public void setFaults(List<ServiceFault> faults) {
		this.Faults = faults;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getServiceId() {
		return serviceId;
	}
	
}
