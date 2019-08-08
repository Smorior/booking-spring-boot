package com.booking.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.booking.dto.PlaceDTO;
import com.booking.mappers.PlaceMapper;
import com.booking.models.Place;
import com.booking.repository.LocationRepository;
import com.booking.repository.PlaceRepository;

@RestController
@RequestMapping("/place")
@CrossOrigin(origins="*", allowedHeaders = "*")
public class PlaceController {
	
	@Autowired
	PlaceRepository placeRepo;
	
	@Autowired
	LocationRepository locationRepo;
	
	@Autowired
	PlaceMapper placeMapper;
	
	@GetMapping
	public List<PlaceDTO> getPlaces(){
		List<Place> places = new ArrayList<Place>();
		placeRepo.findAll().forEach(places::add);
		return placeMapper.placesToPlaceDTOs(places);
	}
	
	@GetMapping("/{placeId}")
	public PlaceDTO getPlace(@PathVariable ("placeId") int placeId) {
		return placeMapper.placeToPlaceDTO(placeRepo.findById(placeId).get());
	}
	
	@GetMapping("/user/{userId}")
	public List<PlaceDTO> getPlaceByUserId(@PathVariable ("userId") int userId) {
		List<Place> places = placeRepo.findPlacesByUserUserId(userId);
		List<PlaceDTO> placeDTOs = placeMapper.placesToPlaceDTOs(places);
		return placeDTOs;
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public PlaceDTO savePlace(@RequestBody PlaceDTO placeDTO){
		Place place = placeMapper.placeDTOToPlace(placeDTO);
		Place savedPlace = placeRepo.save(place);
		return placeMapper.placeToPlaceDTO(savedPlace);
	}
	
	@DeleteMapping("/{placeId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deletePlace(@PathVariable("placeId") int placeId) {
		placeRepo.deleteById(placeId);
	}
	
	@PatchMapping("/{placeId}")
	public PlaceDTO updatePlace(@PathVariable("placeId") int placeId, @RequestBody PlaceDTO placeDTO) {
		Place place = placeRepo.findById(placeId).get();
		Place newPlace = placeMapper.placeDTOToPlace(placeDTO);
		
		if(newPlace.getTitle() != null) {
			place.setTitle(newPlace.getTitle());
		}
		if(newPlace.getDescription() != null) {
			place.setDescription(newPlace.getDescription());
		}
		if(newPlace.getPrice() > 0) {
			place.setPrice(newPlace.getPrice());
		}
		if(newPlace.getLocation()!=null) {
			place.setLocation(newPlace.getLocation());
		}
		
		Place updatedPlace = placeRepo.save(place);
		
		return placeMapper.placeToPlaceDTO(updatedPlace);
	}
	
	
	
	
	

}
