package com.booking.mappers;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.booking.dto.UserDTO;
import com.booking.models.User;

@Component
public class UserMapperImpl implements UserMapper {

	@Autowired
	ModelMapper modelMapper;
	
	@Override
	public UserDTO userToUserDTO(User user) {
		UserDTO userDTO = modelMapper.map(user, UserDTO.class);
		return userDTO;
	}

	@Override
	public List<UserDTO> usersToUserDTOs(List<User> users) {
		List<UserDTO> userDTOs = new ArrayList<UserDTO>();
		for (User tempUser : users) {
			userDTOs.add(modelMapper.map(tempUser, UserDTO.class));
		}
		return userDTOs;
	}

	@Override
	public User userDTOToUser(UserDTO userDTO) {
		return modelMapper.map(userDTO, User.class);
	}

}
