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
import study.spring.withfivebird.model.ProductReview;
import study.spring.withfivebird.service.OrderProblemService;
import study.spring.withfivebird.service.ProductReviewService;

@Controller
public class MyWriteController {

	@Autowired
	OrderProblemService orderProblemService;
	
	@Autowired
	ProductReviewService productReviewService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/mypage_myWriteList.do", method = RequestMethod.GET)
	public String writeList(Model model, HttpServletResponse response) {
		
		OrderProblem input = new OrderProblem();
		input.setUser_no(5);
		ProductReview input2 = new ProductReview();
		input2.setUser_no(5);
		
		List<OrderProblem> output = null;
		List<ProductReview> output2 = null;
		
		try {
			output = orderProblemService.getOrderProblemList(input);
			output2 = productReviewService.getProductReviewList(input2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		
		return "mypage_myWriteList";
	}
	
	@RequestMapping(value = "/mypage_orderProblem.do", method = RequestMethod.GET)
	public String orderProblem(Model model, HttpServletResponse response) {
		return "mypage_orderProblem";
	}
	
	@RequestMapping(value = "/mypage_orderReview.do", method = RequestMethod.GET)
	public String orderReview(Model model, HttpServletResponse response) {
		return "mypage_orderReview";
	}
	
	@RequestMapping(value = "/mypage_orderProblem_ok.do", method = RequestMethod.POST)
	public void orderProblemAddOk(Model model, HttpServletResponse response,
			@RequestParam(value="selectBox") String title,
			@RequestParam(value="textbox") String content){
		// 저장할 값들을 Beans에 담는다.
		OrderProblem input = new OrderProblem();
		Calendar cal = Calendar.getInstance();	
		String date = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
		
		input.setOrder_problem_option(title);
		input.setOrder_problem_content(content);
		input.setOrder_problem_reg_date(date);
		input.setUser_no(5);
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
	
	@RequestMapping(value = "/mypage_orderReview_ok.do", method = RequestMethod.POST)
	public void orderReviewAddOk(Model model, HttpServletResponse response,
			@RequestParam(value="title") String title,
			@RequestParam(value="textbox") String content) {
		
		ProductReview input = new ProductReview();
		Calendar cal = Calendar.getInstance();	
		String date = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
		
		input.setProduct_review_title(title);
		input.setProduct_review_content(content);
		input.setProduct_review_reg_date(date);
		input.setProduct_review_hit(4);
		input.setOrder_check_no(2);
		input.setUser_no(5);
		
		try {
			productReviewService.addProductReview(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String redirectUrl = contextPath + "/mypage_myWriteReview.do?product_review_no=" + input.getProduct_review_no();
		
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/mypage_myWriteProblem.do", method = RequestMethod.GET)
	public String writeProblem(Model model, HttpServletResponse response,
			@RequestParam(value="problemNo") int problemNo) {
		
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_no(problemNo);
		
		OrderProblem output = null;
		
		try {
			output = orderProblemService.getOrderProblemItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output", output);
		
		return "mypage_myWriteProblem";
	}
	
	@RequestMapping(value = "/mypage_myWriteReview.do", method = RequestMethod.GET)
	public String writeReview(Model model, HttpServletResponse response,
			@RequestParam(value="reviewNo") int reviewNo) {
		
		ProductReview input = new ProductReview();
		input.setProduct_review_no(reviewNo);
		
		ProductReview output = null;
		
		try {
			output = productReviewService.getProductReviewItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output", output);
		
		return "mypage_myWriteReview";
	}
	
	@RequestMapping(value = "/mypage_myWriteReviewUpdate.do", method = RequestMethod.GET)
	public String writeReviewUpdate(Model model) {
		return "mypage_myWriteReviewUpdate";
	}
}
