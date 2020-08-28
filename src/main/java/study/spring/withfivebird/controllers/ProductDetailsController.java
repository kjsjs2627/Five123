package study.spring.withfivebird.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductDetailsController {
	@RequestMapping(value = "/main_productDetails.do", method = RequestMethod.GET)
	public String main_productDetails(Model model,
			@RequestParam(value="ans", defaultValue="")String ans,
			@RequestParam(value="index", defaultValue="")String index) {
		
		
		model.addAttribute("ans", ans);
		model.addAttribute("index", index);
		
		return "main_productDetails";
	}
}
