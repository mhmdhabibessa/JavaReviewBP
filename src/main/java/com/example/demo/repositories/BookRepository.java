package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.models.Book;

public interface BookRepository extends CrudRepository<Book, Long> {
	  	List<Book> findAll();
	    // this method finds books with descriptions containing the search string
	    List<Book> findByDescriptionContaining(String search);
	    List<Book> findByLanguageContaining(String search);
	    // this method counts '
	    // this method deletes a book that starts with a specific title
	    Long deleteByTitleStartingWith(String search);
	    
	    List<Book> searchBooksByTitle(String query);
	    
	    List<Book> searchBooksByTitleContaining(String query);
	    
//	    searchBooksByNameContaining
}
