package study.spring.withfivebird.controllers;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MypageController {
	@RequestMapping(value = "/mypage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		return "mypage";
	}
}
