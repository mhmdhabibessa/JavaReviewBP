package com.example.demo.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.demo.models.LoginUser;
import com.example.demo.models.User;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService {
		@Autowired
		private final UserRepository userRepo;
		
	
		
		public UserService(UserRepository userRepository) {
			this.userRepo = userRepository;
		}
		public User findUserById(Long id) {
	        Optional<User> optionalUser = userRepo.findById(id);
	        if(optionalUser.isPresent()) {
	            return optionalUser.get();
	        }
	        else {
	            return null;
	        }
	    }	
	 public User register(User newUser, BindingResult result) {
	        if (userRepo.findByEmail(newUser.getEmail()).isPresent()) {
	            result.rejectValue("email","Unique","This is a used email! Try another one.");
	        }
	        if (!newUser.getPassword().equals(newUser.getConfirm())) {
	            result.rejectValue("confirm","Matches","Confirm password must match password.");
	        }
	        if (result.hasErrors()) {
	            return null;
	        }else {
	            String hashedPW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
	            newUser.setPassword(hashedPW);
	            return userRepo.save(newUser);
	        }
	    }
	  public User login(LoginUser newLoginObject, BindingResult result) {
	        if(result.hasErrors()) {
	            return null;
	        }
	        Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
	        if (!potentialUser.isPresent()) {
	            result.rejectValue("email","Unique","No such email!");
	            return null;
	        }
	        User user = potentialUser.get();
	        if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
	            result.rejectValue("password","Matches","Wrong Password!");
	        }
	        if(result.hasErrors()) {
	            return null;
	        }else {
	            return user;
	        }
	    }
}
