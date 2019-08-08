package com.booking.mappers;

import java.util.List;

import com.booking.dto.PlaceDTO;
import com.booking.models.Place;

public interface PlaceMapper {

	PlaceDTO placeToPlaceDTO(Place place);
	
	List<PlaceDTO> placesToPlaceDTOs(List<Place> places);
	
	Place placeDTOToPlace(PlaceDTO placeDTO);
	
}
