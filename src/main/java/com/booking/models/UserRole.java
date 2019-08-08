package com.booking.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class UserRole {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int authorityId;
	
	private String username;
	
	private String authority;
	
	public UserRole() {}
	
	public UserRole(String username, String authority) {
		this.authority = authority;
		this.username = username;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}



	public int getAuthorityId() {
		return authorityId;
	}


	public void setAuthorityId(int authorityId) {
		this.authorityId = authorityId;
	}


	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}



	



	
}
