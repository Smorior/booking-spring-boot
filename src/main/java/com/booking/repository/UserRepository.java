package com.booking.repository;

import org.springframework.data.repository.CrudRepository;

import com.booking.models.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	
	User findByUsername(String username);

}
