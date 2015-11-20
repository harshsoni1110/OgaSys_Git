package com.ogasys.model;

public class SearchResult {
	String garageId;
	String garageName;
	String pickUp;
	double estimatedCost;
	int rating;
	String imagePath;
	public String getGarageId() {
		return garageId;
	}
	public void setGarageId(String garageId) {
		this.garageId = garageId;
	}
	public String getGarageName() {
		return garageName;
	}
	public void setGarageName(String garageName) {
		this.garageName = garageName;
	}
	public String getPickUp() {
		return pickUp;
	}
	public void setPickUp(String pickUp) {
		this.pickUp = pickUp;
	}
	public double getEstimatedCost() {
		return estimatedCost;
	}
	public void setEstimatedCost(double estimatedCost) {
		this.estimatedCost = estimatedCost;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
}
