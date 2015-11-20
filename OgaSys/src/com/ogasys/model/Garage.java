package com.ogasys.model;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Embedded;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;

@Entity(value="Garage")
public class Garage {
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Garage [garageId=" + garageId + ", garageName=" + garageName + ", garageEmailId=" + garageEmailId
				+ ", garagePassword=" + garagePassword + ", ContactNumber=" + ContactNumber + ", address=" + address.toString()
				+ "]";
	}

	@Id
	private ObjectId garageId;
	private String garageName;
	private String garageEmailId;
	private String garagePassword;
	private long ContactNumber;
	
	@Embedded
	private Address address;

	/**
	 * @return the garageId
	 */
	public ObjectId getGarageId() {
		return garageId;
	}

	/**
	 * @param garageId the garageId to set
	 */
	public void setGarageId(ObjectId garageId) {
		this.garageId = garageId;
	}

	/**
	 * @return the garageName
	 */
	public String getGarageName() {
		return garageName;
	}

	/**
	 * @param garageName the garageName to set
	 */
	public void setGarageName(String garageName) {
		this.garageName = garageName;
	}

	/**
	 * @return the garageEmailId
	 */
	public String getGarageEmailId() {
		return garageEmailId;
	}

	/**
	 * @param garageEmailId the garageEmailId to set
	 */
	public void setGarageEmailId(String garageEmailId) {
		this.garageEmailId = garageEmailId;
	}

	/**
	 * @return the garagePassword
	 */
	public String getGaragePassword() {
		return garagePassword;
	}

	/**
	 * @param garagePassword the garagePassword to set
	 */
	public void setGaragePassword(String garagePassword) {
		this.garagePassword = garagePassword;
	}

	/**
	 * @return the contactNumber
	 */
	public long getContactNumber() {
		return ContactNumber;
	}

	/**
	 * @param contactNumber the contactNumber to set
	 */
	public void setContactNumber(long contactNumber) {
		ContactNumber = contactNumber;
	}

	/**
	 * @return the address
	 */
	public Address getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(Address address) {
		this.address = address;
	}
	
	
	
	
	
	
}
