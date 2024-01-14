package com.example.demo.controllers;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.models.LoginUser;
import com.example.demo.models.User;
import com.example.demo.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
@Controller
public class UserController {
    private final UserService userService;
    
    public UserController(UserService userServ) {
    	this.userService = userServ;
    }
		
	@RequestMapping("/login_register")
	public String index(@ModelAttribute("user") User user, Model model) {
		String password = "123123213123213";
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        System.out.println("Original Password: " + password);
        System.out.println("Hashed Password: " + hashedPassword);
		model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
		return "user/login.jsp";			
	}
	
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
    		BindingResult result, 
    		Model model, 
    		HttpSession session) {
        User regUser = userService.register(newUser, result);
        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "user/login.jsp";
        }
        session.setAttribute("user_id", regUser.getId());
        return "redirect:/login_register";
    }
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
    		BindingResult result, 
    		Model model, 
    		HttpSession session) {
        User logUser = userService.login(newLogin, result);
        if (result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "user/login.jsp";
        }
        session.setAttribute("user_id", logUser.getId());
        return "redirect:/welcome";
    }
    
	@RequestMapping("/welcome")
	public String welcome(HttpSession session ,Model model) {
		
		 if (session.getAttribute("user_id") != null) {
	            Long userId = (Long) session.getAttribute("user_id");
	            User currentUser = userService.findUserById(userId);
	            model.addAttribute("user", currentUser);
	            return "user/welcome.jsp";
	        }
		 else {			 
			 return "redirect:/";
		 }

	}

}
