package com.booking.mappers;

import java.util.List;

import com.booking.dto.BookingDTO;
import com.booking.models.Booking;

public interface BookingMapper {

	BookingDTO bookingToBookingDTO(Booking booking);
	
	List<BookingDTO> bookingsToBookingDTOs(List<Booking> bookings);
	
	Booking bookingDTOToBooking (BookingDTO bookingDTO);
	
	
}
