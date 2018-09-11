package com.example.productapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@SpringBootApplication
public class MutualTlSDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(MutualTlSDemoApplication.class, args);
	}
}

@Controller
class MessagesController {

	@GetMapping(path = "/public")
	public String publicPage(Model model){
		model.addAttribute("messages", Arrays.asList("public"));
		return "messages";
	}

	@GetMapping(path = "/secured")
	public String securedPage(Model model){
		model.addAttribute("messages", Arrays.asList("secured"));
		return "messages";
	}

	@GetMapping(path = "/admin")
	public String adminPage(Model model){
		model.addAttribute("messages", Arrays.asList("admin"));
		return "messages";
	}

	@GetMapping(path = "/logout")
	public String logout(HttpServletRequest request) throws ServletException {
		request.logout();
		return "/";
	}
}
