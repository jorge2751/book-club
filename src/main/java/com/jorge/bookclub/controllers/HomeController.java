package com.jorge.bookclub.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jorge.bookclub.services.BookService;
import com.jorge.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	final UserService userServ;
	final BookService bookServ;
	public HomeController(UserService userServ, BookService bookServ) {
		this.userServ = userServ;
		this.bookServ = bookServ;
	}
	@GetMapping("/")
	public String home(HttpSession session, Model model) {
		if(session.getAttribute("user_id") ==null) {
			return "redirect:/users/login/reg";
		}
		model.addAttribute("allBook", bookServ.getAll());
		model.addAttribute("loggedInUser", userServ.getUser((Long)session.getAttribute("user_id")));
		return "main/dashboard.jsp";
	}
	
}
