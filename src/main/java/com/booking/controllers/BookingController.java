package com.booking.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.booking.dto.BookingDTO;
import com.booking.mappers.BookingMapper;
import com.booking.models.Booking;
import com.booking.repository.BookingRepository;

@RestController
@RequestMapping("/booking")
@CrossOrigin(origins="*")
public class BookingController {
	
	@Autowired
	BookingRepository bookingRepo;
	
	@Autowired
	BookingMapper bookingMapper;
	
	@GetMapping
	public List<BookingDTO> getBookings(){
		List<Booking> bookings = new ArrayList<Booking>();
		bookingRepo.findAll().forEach(bookings::add);
		return bookingMapper.bookingsToBookingDTOs(bookings);
	}
	
	@GetMapping("/{bookingId}")
	public BookingDTO getBooking(@PathVariable ("bookingId") int bookingId) {
		return bookingMapper.bookingToBookingDTO(bookingRepo.findById(bookingId).get());
	}
	
	@GetMapping("/user/{userId}")
	public List<BookingDTO> getBookingByUser(@PathVariable ("userId") int userId) {
		return bookingMapper.bookingsToBookingDTOs(bookingRepo.findBookingsByUserUserId(userId));
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public BookingDTO saveBooking(@RequestBody BookingDTO bookingDTO) {
		Booking booking = bookingMapper.bookingDTOToBooking(bookingDTO);
		Booking savedBooking = bookingRepo.save(booking);
		return bookingMapper.bookingToBookingDTO(savedBooking);
	}
	@DeleteMapping("/{bookingId}")
	@ResponseStatus(code=HttpStatus.NO_CONTENT)
	public void deleteBooking(@PathVariable ("bookingId") int bookingId) {
		bookingRepo.deleteById(bookingId);
	}

}
