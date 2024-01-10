package com.example.demo.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.models.License;
import com.example.demo.models.Person;
import com.example.demo.services.PersonService;

import jakarta.validation.Valid;

@Controller
public class PersonController {
	 private final PersonService personService;
	    public PersonController(PersonService  personService){
	        this.personService= personService;
	    }
	@RequestMapping("/persons")
	public String index(@ModelAttribute("person") Person person, Model model) {
		return "person/index.jsp";			
	}
	
	@PostMapping("/create/person")
	public String licenses(@Valid @ModelAttribute("person") Person person) {
	    // error handling with binding result omitted    
	    personService.createPerson(person); // Already has the person!
	        
	    return "redirect:/persons";
	}
	@RequestMapping("/licence")
	public String indexs(@ModelAttribute("licence") License licence, Model model) {
		List<Person> persons =  personService.allPerson();
		model.addAttribute("persons",persons);
		return "person/license.jsp";			
	}
	@PostMapping("/licenses")
	public String licenses(@Valid @ModelAttribute("license") License license) {
	    // error handling with binding result omitted    
	    personService.craeteLicense(license); // Already has the person!
	        
	    return "redirect:/persons";
	}

}
