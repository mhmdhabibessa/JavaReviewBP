package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.models.Book;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	

	@RequestMapping("/login")
	public String login(
		Model model , 
		HttpSession session , 
		@RequestParam(value="email") String email,
	    @RequestParam(value="password") String password) {
			session.setAttribute("email", email);
	    	return "redirect:/result"; // <-- we'll change this when we learn redirecting
	}
	
	@RequestMapping("/result")
	public String indexresult(HttpSession session , RedirectAttributes redirectAttributes) {
		if(session.getAttribute("email") == null) {
			redirectAttributes.addFlashAttribute("error", "Email is not exist!");

			return "redirect:/";
		}
		else {
			String email = (String) session.getAttribute("email");
			if (email.length() == 0 ) {
				redirectAttributes.addFlashAttribute("error", "Email should be more than 1 ");
				return "redirect:/";
			}
		}
		
		return "results.jsp";
	}
	
	
	
	


	

	
	
}
