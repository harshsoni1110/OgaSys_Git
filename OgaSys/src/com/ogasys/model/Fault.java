package com.ogasys.model;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Property;
@Entity(value="Fault")
public class Fault {

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Fault [faultId=" + faultId + ", faultType=" + faultType + ", faultName=" + faultName
				+ ", faultDescription=" + faultDescription + ", packageType=" + packageType + "]";
	}
	@Id
	ObjectId faultId;
	@Property("FaultType")
	String faultType;
	@Property("FaultName")
	String faultName;
	@Property("FaultDescription")
	String faultDescription;
	@Property("Package")
	String packageType;
	/**
	 * @return the faultId
	 */
	public ObjectId getFaultId() {
		return faultId;
	}
	/**
	 * @param faultId the faultId to set
	 */
	public void setFaultId(ObjectId faultId) {
		this.faultId = faultId;
	}
	/**
	 * @return the faultType
	 */
	public String getFaultType() {
		return faultType;
	}
	/**
	 * @param faultType the faultType to set
	 */
	public void setFaultType(String faultType) {
		this.faultType = faultType;
	}
	/**
	 * @return the faultName
	 */
	public String getFaultName() {
		return faultName;
	}
	/**
	 * @param faultName the faultName to set
	 */
	public void setFaultName(String faultName) {
		this.faultName = faultName;
	}
	/**
	 * @return the faultDescription
	 */
	public String getFaultDescription() {
		return faultDescription;
	}
	/**
	 * @param faultDescription the faultDescription to set
	 */
	public void setFaultDescription(String faultDescription) {
		this.faultDescription = faultDescription;
	}
	/**
	 * @return the packageType
	 */
	public String getPackageType() {
		return packageType;
	}
	/**
	 * @param packageType the packageType to set
	 */
	public void setPackageType(String packageType) {
		this.packageType = packageType;
	}
	
	
	

}
