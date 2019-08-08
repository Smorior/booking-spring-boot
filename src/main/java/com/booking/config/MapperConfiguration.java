package com.booking.config;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.booking.dto.BookingDTO;
import com.booking.dto.PlaceDTO;
import com.booking.models.Booking;
import com.booking.models.Place;
import com.booking.repository.PlaceRepository;


@Configuration
public class MapperConfiguration {
	
	@Autowired
	PlaceRepository placeRepo;

	@Bean
	public ModelMapper modelMapper() {
		
		PropertyMap<Booking, BookingDTO> bookingMap = new PropertyMap<Booking, BookingDTO>(){
			protected void configure() {
				map().setPlaceId(source.getPlace().getPlaceId());
				map().setPlaceTitle(source.getPlace().getTitle());
				map().setPlaceImage(source.getPlace().getImageUrl());
				map().setUserId(source.getUser().getUserId());
			}
		};
		
		PropertyMap<BookingDTO, Booking> bookingDTOToBookingMap = new PropertyMap<BookingDTO, Booking>(){
			protected void configure() {
				map().getPlace().setImageUrl(source.getPlaceImage());
			}

		};
		
		PropertyMap<Place, PlaceDTO> placeMap = new PropertyMap<Place, PlaceDTO>() {
			protected void configure() {
				map().setUserId(source.getUser().getUserId());
			}
		};
		

		
		ModelMapper modelMapper = new ModelMapper();
		modelMapper.addMappings(bookingMap);
		modelMapper.addMappings(bookingDTOToBookingMap);
		modelMapper.addMappings(placeMap);
		return modelMapper;
	}
	
}
