package com.booking.mappers;

import java.util.List;

import com.booking.dto.LocationDTO;
import com.booking.models.Location;

public interface LocationMapper {

	LocationDTO locationToLocationDTO(Location location);
	
	Location locationDTOToLocation(LocationDTO locationDTO);
	
	List<Location> locationDTOsToLocations(List<LocationDTO> locationDTOs);
}
