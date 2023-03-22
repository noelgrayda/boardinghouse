package com.grayda.projectthirdportfolio.service;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.grayda.projectthirdportfolio.models.LoginUserBoarder;
import com.grayda.projectthirdportfolio.models.Rooms;
import com.grayda.projectthirdportfolio.models.UserBoarder;
import com.grayda.projectthirdportfolio.repository.UserBoarderRepository;

@Service
public class UserBoarderService {
	@Autowired
	UserBoarderRepository userBoarderRepo;
	
	public UserBoarder register(UserBoarder newUser, BindingResult result) {
		Optional<UserBoarder> optionalUser = userBoarderRepo.findByEmail(newUser.getEmail());
		if(optionalUser.isPresent()) {
			result.rejectValue("email", "Matches", "Email already exists.");
		}
		
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The confirm password must match with the password");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		
		return userBoarderRepo.save(newUser);
	}
	
	public UserBoarder login(LoginUserBoarder newLogin, BindingResult result) {
		Optional<UserBoarder> optionalUser = userBoarderRepo.findByEmail(newLogin.getEmail());
		
		if(!optionalUser.isPresent()) {
			result.rejectValue("email", "Matches", "The account doesn't exists");
			return null;
		}
		
		UserBoarder user = optionalUser.get();
		
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Password not valid");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		return user;
	}
	
	public UserBoarder findEmail(String email) {
		Optional<UserBoarder> optionalUser = userBoarderRepo.findByEmail(email);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		return null;
	}
	
	public List<UserBoarder> s_findAllUserBoarder() {
		return userBoarderRepo.findAll();		
	}
	
	public UserBoarder s_findUserBoarderId(Long id) {
		Optional<UserBoarder> optionalUser = userBoarderRepo.findById(id);
		
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
		else {
			return null;
		}
	}
	
	public void s_deleteBoarder(Long id) {
		Optional<UserBoarder> optionalUser = userBoarderRepo.findById(id);
		if(optionalUser.isPresent()) {
			userBoarderRepo.deleteById(id);
		}
	}
	
	public UserBoarder s_addBoarderRoom(UserBoarder room) {
		return userBoarderRepo.save(room);
	}
}
