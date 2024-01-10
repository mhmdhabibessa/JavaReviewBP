package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.models.Book;
import com.example.demo.models.Person;

public interface PersonRepository extends CrudRepository<Person, Long> {
  	List<Person> findAll();

}
