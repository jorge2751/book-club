package com.jorge.bookclub.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jorge.bookclub.models.Book;
import com.jorge.bookclub.services.BookService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/")
public class BookController {
	public final BookService bookServ;
		
	public BookController(BookService bookServ) {
		this.bookServ = bookServ;
	}
// Create method	
	@GetMapping("/create")
	public String createbook(@ModelAttribute("book") Book book, HttpSession session, Model model) {
		if(session.getAttribute ("user_id")== null) {
			return "redirect:/users/login/reg";
		}
		model.addAttribute("allBook", bookServ.getAll());
		return "book/create.jsp";
	}
	@PostMapping("process/create")
	public String bookProcessCreate(@Valid @ModelAttribute("book") Book book, BindingResult result,Model model) {
		if(result.hasErrors()) {
			model.addAttribute("allBook", bookServ.getAll());
			return "book/create.jsp";
		}
		bookServ.create(book);
		return "redirect:/";
	}
	
// findOne /edit method
	@GetMapping("/display/{id}")
	public String onebook(@PathVariable("id") Long id, Model model) {
		model.addAttribute("book", bookServ.findOne(id));
		return "book/display.jsp";
	}
	
// edit method
	@GetMapping("/edit/{id}")
	public String editbook(Model model, @PathVariable("id") Long id) {
		model.addAttribute("book", bookServ.findOne(id));
		return "/book/edit.jsp";
	}
	@PutMapping("/process/edit/{id}")
	public String processEditbook(@Valid @ModelAttribute("book") Book book, 
			BindingResult result, @PathVariable("id") Long id) {
				
				if(result.hasErrors()) {
					return "book/edit.jsp";
				}
				bookServ.edit(book);
				return "redirect:/display/" + id;
			}
	
	@DeleteMapping("/delete/{id}")
	public String deletebook(@PathVariable("id") Long id) {
		bookServ.delete(id);
		return "redirect:/";
	}
}
