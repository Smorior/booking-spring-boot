package com.booking.dto;

import java.util.List;


public class UserDTO {

	private int userId;
	private String email;
	private String username;
	private List<BookingDTO> bookings;
	private List<PlaceDTO> places;

	
	public UserDTO() {}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public List<BookingDTO> getBookings() {
		return bookings;
	}


	public void setBookings(List<BookingDTO> bookings) {
		this.bookings = bookings;
	}


	public List<PlaceDTO> getPlaces() {
		return places;
	}


	public void setPlaces(List<PlaceDTO> places) {
		this.places = places;
	}


	


	
	
	
	
}
