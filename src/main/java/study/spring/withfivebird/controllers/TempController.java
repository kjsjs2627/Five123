package study.spring.withfivebird.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TempController {
	@RequestMapping(value = "/mypage_orderProblem.do", method = RequestMethod.GET)
	public String orderProblem(Model model) {
		return "mypage_orderProblem";
	}
	
	@RequestMapping(value = "/mypage_orderReview.do", method = RequestMethod.GET)
	public String orderReview(Model model) {
		return "mypage_orderReview";
	}
	
	@RequestMapping(value = "/mypage_myWriteReview.do", method = RequestMethod.GET)
	public String writeReview(Model model) {
		return "mypage_myWriteReview";
	}
	
	@RequestMapping(value = "/mypage_myWriteProblem.do", method = RequestMethod.GET)
	public String writeProblem(Model model) {
		return "mypage_myWriteProblem";
	}
	
	@RequestMapping(value = "/mypage_myWriteReviewUpdate.do", method = RequestMethod.GET)
	public String writeReviewUpdate(Model model) {
		return "mypage_myWriteReviewUpdate";
	}
}
