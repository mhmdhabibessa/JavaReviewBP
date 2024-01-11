package com.example.demo.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.models.Book;
import com.example.demo.services.BookService;

import jakarta.validation.Valid;

@Controller
public class BooksApi {
    private final BookService bookService;
    public BooksApi(BookService bookService){
        this.bookService = bookService;
    }
	@RequestMapping("/")
	public String index(@ModelAttribute("book") Book book, Model model) {
		List<Book> books =  bookService.allBooks();
		model.addAttribute("books",books);
		return "index.jsp";			
	}
	
    @RequestMapping("/api/books")
    public List<Book> index() {
        return bookService.allBooks();
    }
    
    @PostMapping("/api/books")
    public String create(@Valid @ModelAttribute("book") Book book, BindingResult result) {
    	 if (result.hasErrors()) {
             return "index.jsp";
         } else {
             bookService.createBook(book);
             return "redirect:/";
         }
    } 
    @RequestMapping("/api/books/{id}")
    public Book show(@PathVariable("id") Long id) {
        Book book = bookService.findBook(id);
        return book;
    }
    
    @RequestMapping("/books/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Book book = bookService.findBook(id);
        model.addAttribute("book", book);
        return "edit.jsp";
    }
    
    @RequestMapping(value="/books/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("book") Book book, BindingResult result, @PathVariable("id") Long id) {

    	if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            bookService.updateBook(book);
            return "redirect:/";
        }
    }
    
    @DeleteMapping("/books/{id}")
    public String destroy(@PathVariable("id") Long id) {
        bookService.deleteBook(id);
        return "redirect:/";
    }
    
    @PostMapping("/books/search")
    public String searchBooks(@RequestParam(name = "query", required = false) String query, 
    		@ModelAttribute("book") Book book,
    		Model model) {
    	
    	
        List<Book> searchResults;

        if (query != null && !query.isEmpty()) {
            // Perform a search based on the query
            searchResults = bookService.searchBooks(query);
        } else {
            // If the query is empty, return all books
            searchResults = bookService.allBooks();
        }
        model.addAttribute("books", searchResults);
        return "index.jsp"; // Replace with the actual name of your JSP view
    }
}
