package com.booking.mappers;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.booking.dto.LocationDTO;
import com.booking.models.Location;

public class LocationMapperImpl implements LocationMapper {
	
	@Autowired
	ModelMapper modelMapper;

	@Override
	public LocationDTO locationToLocationDTO(Location location) {
		return modelMapper.map(location, LocationDTO.class);
	}

	@Override
	public Location locationDTOToLocation(LocationDTO locationDTO) {
		return modelMapper.map(locationDTO, Location.class);
	}

	@Override
	public List<Location> locationDTOsToLocations(List<LocationDTO> locationDTOs) {
		List<Location> locations = new ArrayList<Location>();
		for (LocationDTO tempLocationDTO : locationDTOs) {
			locations.add(modelMapper.map(tempLocationDTO, Location.class));
		}
		return locations;
	}

}
