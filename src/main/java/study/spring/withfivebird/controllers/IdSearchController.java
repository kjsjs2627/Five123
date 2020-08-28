package study.spring.withfivebird.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IdSearchController {
	@RequestMapping(value = "/info_idSearch.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main_productDetails(Model model) {
		
		
		//model.addAttribute("index", index);
		
		return "info_idSearch";
	}
	@RequestMapping(value="/api/search.do", method = RequestMethod.POST)
	private void test(Model model, HttpServletResponse response,
			@RequestParam(value="user_name") String user_name) {
		
	}
}
