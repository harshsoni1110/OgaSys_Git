package com.ogasys.model;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Embedded;
//import org.mongodb.morphia.annotations.Embedded;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
//import org.mongodb.morphia.annotations.Reference;
import org.mongodb.morphia.annotations.Property;

@Entity(value="User")
public class User {
	@Override
	public String toString() {
		return "User [id=" + id + ", FirstName=" + FirstName + ", LastName=" + LastName + ", UserEmailId="
				+ UserEmailId + ", UserPassword=" + UserPassword + ", address=" + address + ", ContactNumber="
				+ ContactNumber + ", Gender=" + Gender + ", ProfilePictureLink=" + ProfilePictureLink + "]";
	}
	public ObjectId getId() {
		return id;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getUserEmailId() {
		return UserEmailId;
	}
	public void setUserEmailId(String userEmailId) {
		UserEmailId = userEmailId;
	}
	public String getUserPassword() {
		return UserPassword;
	}
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public long getContactNumber() {
		return ContactNumber;
	}
	public void setContactNumber(long contactNumber) {
		ContactNumber = contactNumber;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getProfilePictureLink() {
		return ProfilePictureLink;
	}
	public void setProfilePictureLink(String profilePictureLink) {
		ProfilePictureLink = profilePictureLink;
	}
	@Id
	private ObjectId id;
	@Property ("FirstName")
	private String FirstName;
	@Property ("LastName")
	private String LastName;
	@Property ("UserEmailId")
	private String UserEmailId;
	@Property ("UserPassword")
	private String UserPassword;
	@Embedded
	private Address address;
	@Property ("ContactNumber")
	private long ContactNumber;
	@Property ("Gender")
	private String Gender;
	@Property("UserProfilePicture")
	private String ProfilePictureLink;
	
	
	
	
}
