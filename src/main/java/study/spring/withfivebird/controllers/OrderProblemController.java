package study.spring.withfivebird.controllers;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.withfivebird.model.OrderProblem;
import study.spring.withfivebird.service.OrderProblemService;

@Controller
public class OrderProblemController {

	@Autowired
	OrderProblemService orderProblemService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/mypage_myWriteList.do", method = RequestMethod.GET)
	public String writeList(Model model, HttpServletResponse response) {
		
		OrderProblem input = new OrderProblem();
		input.setUser_no(5);
		
		List<OrderProblem> output = null;
		
		try {
			output = orderProblemService.getOrderProblemList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output", output);
		
		return "mypage_myWriteList";
	}
	
	@RequestMapping(value = "/mypage_orderProblem.do", method = RequestMethod.GET)
	public String orderProblem(Model model, HttpServletResponse response) {
		return "mypage_orderProblem";
	}
	
	@RequestMapping(value = "/mypage_orderProblem_ok.do", method = RequestMethod.POST)
	public void orderProblemAddOk(Model model, HttpServletResponse response,
			@RequestParam(value="selectBox") String title,
			@RequestParam(value="textbox") String content){
		// 저장할 값들을 Beans에 담는다.
		OrderProblem input = new OrderProblem();
		Calendar cal = Calendar.getInstance();	
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		input.setOrder_problem_option(title);
		input.setOrder_problem_content(content);
		input.setOrder_problem_reg_date(year + "-" + month + "-" + day);
		input.setUser_no(3);
		input.setOrder_check_no(3);
		
		try {
			orderProblemService.addOrderProblem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String redirectUrl = contextPath + "/mypage_myWriteProblem.do?order_problem_no=" + input.getOrder_problem_no();
		
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/mypage_myWriteProblem.do", method = RequestMethod.GET)
	public String writeProblem(Model model, HttpServletResponse response,
			@RequestParam(value="order_problem_no") int pNo) {
		
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_no(pNo);
		
		OrderProblem output = null;
		
		try {
			output = orderProblemService.getOrderProblemItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output", output);
		
		return "mypage_myWriteProblem";
	}
	
}
