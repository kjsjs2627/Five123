package study.spring.withfivebird.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.withfivebird.model.User;
import study.spring.withfivebird.service.UserService;

@Controller
public class IdSearchController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/info_idSearch.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main_productDetails(Model model) {
		
		
		//model.addAttribute("index", index);
		
		return "info_idSearch";
	}
	@RequestMapping(value="/search.do", method = RequestMethod.POST)
	private String test(Model model, HttpServletResponse response,
			@RequestParam(value="name_search") String user_name,
			@RequestParam(value="email_search") String user_email) {
		
		User input = new User();
		
		input.setUser_name(user_name);
		input.setUser_email(user_email);
		
		User output =null;
		
		try {
			output = userService.getUserId(input);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output", output);
		return "info_idOk";
	}
	
}
