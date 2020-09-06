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

/** 내가 쓴 글 관리 컨트롤러 */
@Controller
public class MyWriteController {

	/** Service 패턴 구현체 주입 */
	@Autowired
	OrderProblemService orderProblemService;

	@Autowired
	ProductReviewService productReviewService;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 목록 페이지 */
	@RequestMapping(value = "/mypage_myWriteList.do", method = RequestMethod.GET)
	public String writeList(Model model, HttpServletResponse response) {

		// 조회에 필요한 조건값을 Beans에 담는다.
		// 테스트용 임시 회원번호 = 5번
		OrderProblem input = new OrderProblem();
		input.setUser_no(5);
		ProductReview input2 = new ProductReview();
		input2.setUser_no(5);

		List<OrderProblem> output = null; // 조회결과
		List<ProductReview> output2 = null; //조회결과

		try {
			// 데이터 조회하기
			output = orderProblemService.getOrderProblemList(input);
			output2 = productReviewService.getProductReviewList(input2);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);

		return "mypage_myWriteList";
	}

	/** 문의 작성 페이지 */
	@RequestMapping(value = "/mypage_orderProblem.do", method = RequestMethod.GET)
	public String orderProblem(Model model, HttpServletResponse response) {
		return "mypage_orderProblem";
	}

	/** 후기 작성 페이지 */
	@RequestMapping(value = "/mypage_orderReview.do", method = RequestMethod.GET)
	public String orderReview(Model model, HttpServletResponse response) {
		return "mypage_orderReview";
	}

	/** 문의 작성에 대한 action 페이지 */
	@RequestMapping(value = "/mypage_orderProblem_add.do", method = RequestMethod.POST)
	public void orderProblemAdd(Model model, HttpServletResponse response,
			@RequestParam(value = "selectBox") String title, @RequestParam(value = "textbox") String content) {

		// 오늘 날짜를 가져오기 위한 Calendar 객체
		Calendar cal = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1,
				cal.get(Calendar.DAY_OF_MONTH));

		// 저장할 값들을 Beans에 담는다.
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_option(title);
		input.setOrder_problem_content(content);
		input.setOrder_problem_reg_date(date);
		input.setUser_no(5); // 테스트용 임시 회원번호 5번으로 저장된다.
		input.setOrder_check_no(3);

		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			orderProblemService.addOrderProblem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 대상이 저장된 상태이므로 주문내역 페이지로 이동
		try {
			response.sendRedirect(contextPath + "/mypage_orderCheck.do");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/** 후기 작성에 대한 action 페이지 */
	@RequestMapping(value = "/mypage_orderReview_add.do", method = RequestMethod.POST)
	public void orderReviewAdd(Model model, HttpServletResponse response, @RequestParam(value = "title") String title,
			@RequestParam(value = "textbox") String content) {

		// 오늘 날짜를 가져오기 위한 Calendar 객체
		Calendar cal = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1,
				cal.get(Calendar.DAY_OF_MONTH));

		// 저장할 값들을 Beans에 담는다.
		ProductReview input = new ProductReview();
		input.setProduct_review_title(title);
		input.setProduct_review_content(content);
		input.setProduct_review_reg_date(date);
		input.setProduct_review_hit(4);
		input.setOrder_check_no(2);
		input.setUser_no(5); // 테스트용 임시 회원번호 5번으로 저장된다.

		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			productReviewService.addProductReview(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 대상이 저장된 상태이므로 주문내역 페이지로 이동
		try {
			response.sendRedirect(contextPath + "/mypage_orderCheck.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/** 문의 상세 페이지 */
	@RequestMapping(value = "/mypage_myWriteProblem.do", method = RequestMethod.GET)
	public String writeProblem(Model model, HttpServletResponse response,
			@RequestParam(value = "problemNo") int problemNo) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_no(problemNo);

		// 조회결과를 저장할 객체 선언
		OrderProblem output = null;

		try {
			// 데이터 조회
			output = orderProblemService.getOrderProblemItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);

		return "mypage_myWriteProblem";
	}

	/** 후기 상세 페이지 */
	@RequestMapping(value = "/mypage_myWriteReview.do", method = RequestMethod.GET)
	public String writeReview(Model model, HttpServletResponse response,
			@RequestParam(value = "reviewNo") int reviewNo) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		ProductReview input = new ProductReview();
		input.setProduct_review_no(reviewNo);

		// 조회결과를 저장할 객체 선언
		ProductReview output = null;

		try {
			// 데이터 조회
			output = productReviewService.getProductReviewItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);

		return "mypage_myWriteReview";
	}

	/** 후기 삭제 처리 구현 */
	@RequestMapping(value = "/mypage_myWriteReviewUpdate_delete.do", method = RequestMethod.GET)
	public void writeReviewUpdateDelete(Model model, HttpServletResponse response,
			@RequestParam(value = "reviewNo") int reviewNo) {

		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		ProductReview input = new ProductReview();
		input.setProduct_review_no(reviewNo);

		try {
			// 데이터 삭제
			productReviewService.deleteProductReview(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 대상이 삭제된 상태이므로 목록 페이지로 이동
		try {
			response.sendRedirect(contextPath + "/mypage_myWriteList.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/** 후기 수정 폼 페이지 */
	@RequestMapping(value = "/mypage_myWriteReviewUpdate.do", method = RequestMethod.GET)
	public String writeReviewUpdate(Model model, HttpServletResponse response,
			@RequestParam(value = "reviewNo") int reviewNo) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		ProductReview input = new ProductReview();
		input.setProduct_review_no(reviewNo);

		// 수정할 데이터의 원본 조회하기
		ProductReview output = null;

		try {
			output = productReviewService.getProductReviewItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);

		return "mypage_myWriteReviewUpdate";
	}

	/** 후기 수정 폼에 대한 action 페이지 */
	@RequestMapping(value = "/mypage_myWriteReviewUpdate_edit.do", method = RequestMethod.POST)
	public void writeReviewUpdateEdit(Model model, HttpServletResponse response,
			@RequestParam(value = "reviewNo") int reviewNo, @RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content) {

		// 수정할 값들을 Beans에 담는다.
		ProductReview input = new ProductReview();
		input.setProduct_review_no(reviewNo);
		input.setProduct_review_title(title);
		input.setProduct_review_content(content);

		try {
			// 데이터 수정
			productReviewService.editProductReview(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 수정할 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
		String redirectUrl = contextPath + "/mypage_myWriteReview.do?reviewNo=" + input.getProduct_review_no();
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
