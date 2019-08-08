package com.booking.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.booking.dto.UserDTO;
import com.booking.mappers.UserMapper;
import com.booking.models.User;
import com.booking.models.UserRole;
import com.booking.repository.RoleRepository;
import com.booking.repository.UserRepository;
import com.booking.security.RegisterUser;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins="*")
public class UserController {
	
	@Autowired
	private UserRepository userRepo;
		
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	RoleRepository roleRepo;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@GetMapping
	public List<UserDTO> getUsers(){
		List<User> users = new ArrayList<User>();
		List<UserDTO> userDTOs = new ArrayList<UserDTO>();
		userRepo.findAll().forEach(users::add);
		userDTOs = userMapper.usersToUserDTOs(users);
		return userDTOs;
	}
	
	@GetMapping("/{userId}")
	public UserDTO getUser(@PathVariable ("userId") int userId) {
		return userMapper.userToUserDTO(userRepo.findById(userId).get());
	}
	
//	@PostMapping
//	@ResponseStatus(HttpStatus.CREATED)
//	public UserDTO saveUser(@RequestBody RegisterUser registerUser) {
//		User user = registerUser.registerUser(passwordEncoder);
//		UserDTO newUser = userMapper.userToUserDTO(userRepo.save(user));
//		roleRepo.save(new UserRole(user.getUsername(),"ROLE_USER"));
//		return newUser; 
//	}
	
	@PostMapping
	public ResponseEntity<Object> saveUser(@RequestBody RegisterUser registerUser) {
		User user = registerUser.registerUser(passwordEncoder);
		UserDTO newUser;
		try {
		newUser = userMapper.userToUserDTO(userRepo.save(user));
		roleRepo.save(new UserRole(user.getUsername(),"ROLE_USER"));
		} catch (Exception ex) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("User already exists");
		}
		return ResponseEntity.status(HttpStatus.CREATED).body(newUser); 
	}
	
	

}
