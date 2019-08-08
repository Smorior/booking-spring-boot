package com.booking.mappers;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.booking.dto.BookingDTO;
import com.booking.models.Booking;

@Component
public class BookingMapperImpl implements BookingMapper {

	@Autowired
	ModelMapper modelMapper;
	
	@Override
	public BookingDTO bookingToBookingDTO(Booking booking) {
		BookingDTO bookingDTO = modelMapper.map(booking, BookingDTO.class);
		return bookingDTO;
	}

	@Override
	public List<BookingDTO> bookingsToBookingDTOs(List<Booking> bookings) {
		List<BookingDTO> bookingDTOs = new ArrayList<BookingDTO>();
		for (Booking tempBooking : bookings) {
			bookingDTOs.add(modelMapper.map(tempBooking, BookingDTO.class));
		}
		return bookingDTOs;
	}

	@Override
	public Booking bookingDTOToBooking(BookingDTO bookingDTO) {
		Booking booking = modelMapper.map(bookingDTO, Booking.class);
		return booking;
	}

}
