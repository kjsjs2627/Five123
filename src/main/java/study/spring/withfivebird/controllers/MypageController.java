package study.spring.withfivebird.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(Model model) {
		return "mypage";
	}

	@RequestMapping(value = "/mypage_orderCheck.do", method = RequestMethod.GET)
	public String orderCheck(Model model) {
		return "mypage_orderCheck";
	}

	@RequestMapping(value = "/mypage_myInfoUpdate.do", method = RequestMethod.GET)
	public String infoUpdate(Model model) {
		return "mypage_myInfoUpdate";
	}

	@RequestMapping(value = "/mypage_heart.do", method = RequestMethod.GET)
	public String heart(Model model) {
		return "mypage_heart";
	}
	
	@RequestMapping(value = "/mypage_myPoint.do", method = RequestMethod.GET)
	public String point(Model model) {
		return "mypage_myPoint";
	}

	@RequestMapping(value = "/mypage_myCoupon.do", method = RequestMethod.GET)
	public String coupon(Model model) {
		return "mypage_myCoupon";
	}

}
