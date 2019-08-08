package com.booking.repository;

import org.springframework.data.repository.CrudRepository;

import com.booking.models.Location;

public interface LocationRepository extends CrudRepository<Location, Integer> {

}
