package com.booking.mappers;

import java.util.List;

import com.booking.dto.UserDTO;
import com.booking.models.User;

public interface UserMapper {

	UserDTO userToUserDTO(User user);
	
	List<UserDTO> usersToUserDTOs(List<User> users);
	
	User userDTOToUser(UserDTO userDTO);
	
}
