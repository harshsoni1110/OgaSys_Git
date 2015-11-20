package com.ogasys.model;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Embedded;
//import org.mongodb.morphia.annotations.Embedded;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
//import org.mongodb.morphia.annotations.Reference;

@Entity(value="User")
public class User {
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User [id=" + id + ", FirstName=" + FirstName + ", LastName=" + LastName + ", UserEmailId=" + UserEmailId
				+ ", UserPassword=" + UserPassword + ", address=" + address + ", ContactNumber=" + ContactNumber
				+ ", Gender=" + Gender + ", UserProfilePictureLink=" + UserProfilePictureLink + "]";
	}
	@Id
	private ObjectId id;
	private String FirstName;
	private String LastName;
	private String UserEmailId;
	private String UserPassword;
	@Embedded
	private Address address;
	private long ContactNumber;
	private int Gender;
	private String UserProfilePictureLink;
	
	/**
	 * @return the id
	 */
	public ObjectId getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(ObjectId id) {
		this.id = id;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return FirstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	
	/**
	 * @return the userProfilePictureLink
	 */
	public String getUserProfilePictureLink() {
		return UserProfilePictureLink;
	}
	/**
	 * @param userProfilePictureLink the userProfilePictureLink to set
	 */
	public void setUserProfilePictureLink(String userProfilePictureLink) {
		UserProfilePictureLink = userProfilePictureLink;
	}
	
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return LastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	/**
	 * @return the userEmailId
	 */
	public String getUserEmailId() {
		return UserEmailId;
	}
	/**
	 * @param userEmailId the userEmailId to set
	 */
	public void setUserEmailId(String userEmailId) {
		UserEmailId = userEmailId;
	}
	/**
	 * @return the userPassword
	 */
	public String getUserPassword() {
		return UserPassword;
	}
	/**
	 * @param userPassword the userPassword to set
	 */
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
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
	 * @return the gender
	 */
	public int getGender() {
		return Gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(int gender) {
		Gender = gender;
	}
}

