package study.spring.withfivebird.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ArticleController {
	@RequestMapping(value = "/main_article.do", method = RequestMethod.GET)
	public String main_article(Model model) {
				
		return "main_article";
	}
	
	@RequestMapping(value = "/main_noticeList.do", method = RequestMethod.GET)
	public String main_noticeList(Model model) {
		
		return "main_noticeList";
	}
	
	@RequestMapping(value = "/main_noticeDetails.do", method = RequestMethod.GET)
	public String main_noticeDetails(Model model) {
		
		return "main_noticeDetails";
	}
	
	@RequestMapping(value = "/main_qnaDetails.do", method = RequestMethod.GET)
	public String main_qnaDetails(Model model) {
		
		return "main_qnaDetails";
	}
	
	@RequestMapping(value = "/main_qnaList.do", method = RequestMethod.GET)
	public String main_qnaList(Model model) {
		
		return "main_qnaList";
	}
	
	@RequestMapping(value = "/main_myQna.do", method = RequestMethod.GET)
	public String main_myQna(Model model) {
		
		return "main_myQna";
	}
	
	@RequestMapping(value = "/main_myQnaUpdate.do", method = RequestMethod.GET)
	public String main_myQnaUpdate(Model model) {
		
		return "main_myQnaUpdate";
	}
	
	@RequestMapping(value = "/main_myQnaWrite.do", method = RequestMethod.GET)
	public String main_myQnaWrite(Model model) {
		
		return "main_myQnaWrite";
	}
	
	
}