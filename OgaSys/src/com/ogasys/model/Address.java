package com.ogasys.model;

public class Address {
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Address [FlatNumber=" + FlatNumber + ", Street=" + Street + ", Landmark=" + Landmark + ", City=" + City
				+ ", State=" + State + ", PinCode=" + PinCode + ", Country=" + Country + ", Latitude=" + Latitude
				+ ", Longitude=" + Longitude + "]";
	}
	private String FlatNumber;
	private String Street;
	private String Landmark;
    private String City;
    private String State;
    private Integer PinCode;
    private String Country;
    private Double Latitude;
    private Double Longitude;

    /**
	 * @return the flatNumber
	 */
	public String getFlatNumber() {
		return FlatNumber;
	}
	/**
	 * @param flatNumber the flatNumber to set
	 */
	public void setFlatNumber(String flatNumber) {
		FlatNumber = flatNumber;
	}
	/**
	 * @return the street
	 */
	public String getStreet() {
		return Street;
	}
	/**
	 * @param street the street to set
	 */
	public void setStreet(String street) {
		Street = street;
	}
	/**
	 * @return the landmark
	 */
	public String getLandmark() {
		return Landmark;
	}
	/**
	 * @param landmark the landmark to set
	 */
	public void setLandmark(String landmark) {
		Landmark = landmark;
	}
	/**
	 * @return the city
	 */
	public String getCity() {
		return City;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		City = city;
	}
	/**
	 * @return the state
	 */
	public String getState() {
		return State;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		State = state;
	}
	/**
	 * @return the pinCode
	 */
	public Integer getPinCode() {
		return PinCode;
	}
	/**
	 * @param pinCode the pinCode to set
	 */
	public void setPinCode(Integer pinCode) {
		PinCode = pinCode;
	}
	/**
	 * @return the country
	 */
	public String getCountry() {
		return Country;
	}
	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		Country = country;
	}
	/**
	 * @return the latitude
	 */
	public Double getLatitude() {
		return Latitude;
	}
	/**
	 * @param latitude the latitude to set
	 */
	public void setLatitude(Double latitude) {
		Latitude = latitude;
	}
	/**
	 * @return the longitude
	 */
	public Double getLongitude() {
		return Longitude;
	}
	/**
	 * @param longitude the longitude to set
	 */
	public void setLongitude(Double longitude) {
		Longitude = longitude;
	}
   
}
