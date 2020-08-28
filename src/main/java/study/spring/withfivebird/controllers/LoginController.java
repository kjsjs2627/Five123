package study.spring.withfivebird.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {
	@RequestMapping(value = "/info_login.do", method = RequestMethod.GET)
	public String info_login(Model model) {
		
		return "info_login";
	}
	
	@RequestMapping(value = "/info_loginNo.do", method = RequestMethod.GET)
	public String info_loginNo(Model model) {
		
		return "info_loginNo";
	}
}
