package study.spring.withfivebird.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IdOkController {
	@RequestMapping(value = "/info_idOk.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main_productDetails(Model model) {
		
		
		//model.addAttribute("index", index);
		
		return "info_idOk.do";
	}
}
