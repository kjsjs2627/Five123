package study.spring.withfivebird.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {
	@RequestMapping(value = "/main_category.do", method = RequestMethod.GET)
	public String main_category(Model model,
			@RequestParam(value="ans", defaultValue="")String ans) {
		
		
		model.addAttribute("ans", ans);
			
		return "main_category";
	}
}
