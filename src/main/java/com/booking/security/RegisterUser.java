package com.booking.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.booking.models.User;

public class RegisterUser {
	
	private String email;
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private Boolean enabled;
	
	
	public User registerUser (PasswordEncoder passwordEncoder) {
		return new User (email, username, passwordEncoder.encode(password), firstName, lastName);
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


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public Boolean getEnabled() {
		return enabled;
	}


	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	
	
}
