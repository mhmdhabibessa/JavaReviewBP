package com.example.demo.services;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.models.License;
import com.example.demo.models.Person;
import com.example.demo.repositories.LicenseRepository;
import com.example.demo.repositories.PersonRepository;
@Service
public class PersonService {
    private final PersonRepository personRepository;
    private final LicenseRepository licenseRepository;
    public PersonService(PersonRepository personRepository,LicenseRepository licenseRepository) {
        this.personRepository= personRepository;
        this.licenseRepository = licenseRepository;
    }
    public List<Person> allPerson() {
        return personRepository.findAll();
    }
    public Person createPerson(Person p) {
        return personRepository.save(p);
    }
    public Person findPerson(Long id) {
        Optional<Person> optionalPerson= personRepository.findById(id);
        if(optionalPerson.isPresent()) {
            return optionalPerson.get();
        } else {
            return null;
        }
    }
    
    public Person updatePerson(Person p) {
    
    	return personRepository.save(p);
    }
    public License craeteLicense(License license) {
    	return licenseRepository.save(license);
    }

    
    public void deletePerson(Long id) {
    	personRepository.deleteById(id);
    }
}

