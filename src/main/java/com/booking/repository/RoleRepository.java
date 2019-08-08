package com.booking.repository;

import org.springframework.data.repository.CrudRepository;

import com.booking.models.UserRole;

public interface RoleRepository extends CrudRepository<UserRole, Integer> {

}
