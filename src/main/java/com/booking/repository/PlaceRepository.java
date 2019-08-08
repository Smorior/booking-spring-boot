package com.booking.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.booking.models.Place;

public interface PlaceRepository extends CrudRepository<Place, Integer> {
	
	List <Place> findPlacesByUserUserId(int userId);
}
