package com.booking.mappers;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.booking.dto.PlaceDTO;
import com.booking.models.Place;

@Component
public class PlaceMapperImpl implements PlaceMapper {
	
	@Autowired
	ModelMapper modelMapper;

	@Override
	public PlaceDTO placeToPlaceDTO(Place place) {
		PlaceDTO placeDTO = modelMapper.map(place, PlaceDTO.class);
		return placeDTO;
	}

	@Override
	public List<PlaceDTO> placesToPlaceDTOs(List<Place> places) {
		List<PlaceDTO> placeDTOs = new ArrayList<PlaceDTO>();
		for (Place tempPlace : places) {
			placeDTOs.add(modelMapper.map(tempPlace, PlaceDTO.class));
		}
		return placeDTOs;
	}

	@Override
	public Place placeDTOToPlace(PlaceDTO placeDTO) {
		Place place = modelMapper.map(placeDTO, Place.class);
		return place;
	}

}
