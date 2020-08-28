package study.spring.withfivebird.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JoinController {
	@RequestMapping(value = "/info_join.do", method = RequestMethod.GET)
	public String main_productDetails(Model model) {
		
		
		//model.addAttribute("index", index);
		
		return "info_join";
	}
}
