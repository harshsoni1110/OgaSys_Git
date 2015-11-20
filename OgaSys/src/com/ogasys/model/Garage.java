package com.ogasys.model;

import java.util.List;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Embedded;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Property;

@Entity(value="Garage")
public class Garage {
	@Id
	private ObjectId garageId;

	@Property ("GarageName")
	private String garageName;
	
	@Property ("GarageEmailId")
	private String garageEmailId;
	
	@Property ("GaragePassword")
	private String garagePassword;
	
	@Property("ContactNumber")
	private long contactNumber;
	
	@Property("PickUpAvailability")
	private String pickUpAvailability;
	
	@Property("PickUpAPrice")
	private String pickUpPrice;
	
	@Property("TypeOfVehicle")
	private String typeOfVehicle;
	
	@Property("GarageLogo")
	private String garageLogo;
	
	@Property("GaragePhotos")
	private List <String> garagePhotos;
	
	@Property("IsActive")
	private String isActive;
	
	@Property("Rating")
	private String rating;
	
	@Embedded("Address")
	private Address address;

	public String getGarageName() {
		return garageName;
	}

	public void setGarageName(String garageName) {
		this.garageName = garageName;
	}

	public String getGarageEmailId() {
		return garageEmailId;
	}

	public void setGarageEmailId(String garageEmailId) {
		this.garageEmailId = garageEmailId;
	}

	public String getGaragePassword() {
		return garagePassword;
	}

	public void setGaragePassword(String garagePassword) {
		this.garagePassword = garagePassword;
	}

	public long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getPickUpAvailability() {
		return pickUpAvailability;
	}

	public void setPickUpAvailability(String pickUpAvailability) {
		this.pickUpAvailability = pickUpAvailability;
	}

	public String getPickUpPrice() {
		return pickUpPrice;
	}

	public void setPickUpPrice(String pickUpPrice) {
		this.pickUpPrice = pickUpPrice;
	}

	public String getTypeOfVehicle() {
		return typeOfVehicle;
	}

	public void setTypeOfVehicle(String typeOfVehicle) {
		this.typeOfVehicle = typeOfVehicle;
	}

	public String getGarageLogo() {
		return garageLogo;
	}

	public void setGarageLogo(String garageLogo) {
		this.garageLogo = garageLogo;
	}

	public List<String> getGaragePhotos() {
		return garagePhotos;
	}

	public void setGaragePhotos(List<String> garagePhotos) {
		this.garagePhotos = garagePhotos;
	}

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public ObjectId getGarageId() {
		return garageId;
	}

	@Override
	public String toString() {
		return "Garage [garageId=" + garageId + ", garageName=" + garageName + ", garageEmailId=" + garageEmailId
				+ ", garagePassword=" + garagePassword + ", contactNumber=" + contactNumber + ", pickUpAvailability="
				+ pickUpAvailability + ", pickUpPrice=" + pickUpPrice + ", typeOfVehicle=" + typeOfVehicle
				+ ", garageLogo=" + garageLogo + ", garagePhotos=" + garagePhotos + ", isActive=" + isActive
				+ ", rating=" + rating + ", address=" + address + "]";
	}

	
	
	
	
	
}
