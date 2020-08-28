package study.spring.withfivebird.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoOut {
	@RequestMapping(value = "/mypage_myInfoOut", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Model model) {
		
		
		return "mypage_myInfoOut";
	}
}
