package com.booking.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.booking.models.Booking;

public interface BookingRepository extends CrudRepository<Booking, Integer> {

	public List<Booking> findBookingsByUserUserId(int userId);
}
