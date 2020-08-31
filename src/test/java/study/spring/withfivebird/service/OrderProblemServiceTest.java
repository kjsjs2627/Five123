package study.spring.withfivebird.service;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.OrderProblem;

/** Lombok의 Log4j 객체 */
@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
// import org.junit.runner.RunWith;
// import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
// import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
// import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
// import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class OrderProblemServiceTest {
	/** Service 객체 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private OrderProblemService orderProblemService;
	
	/** 단일행 조회 테스트 */
	@Test
	public void testA() {
		// 검색조건으로 사용된 POJO 클래스 객체
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_no(1);
		
		OrderProblem output = null;
		
		try {
			output = orderProblemService.getOrderProblemItem(input);
			log.debug(output.toString());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 다중행 조회 테스트 */
	@Test
	public void testB() {
		// 검색조건으로 사용될 POJO 클래스 객체
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_option("문의");
		
		List<OrderProblem> output = null;
		
		try {
			output = orderProblemService.getOrderProblemList(input);
			
			for (OrderProblem item : output) {
				log.debug(item.toString());
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

	/** 전체 데이터 수 조회 */
	@Test
	public void testC() {
		int count = 0;
		
		try {
			count = orderProblemService.getOrderProblemCount(null);
			log.debug("전체 데이터 수: " + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 조건에 따른 데이터 수 조회 */
	@Test
	public void testD() {
		int count = 0;
		
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_option("송");
		
		try {
			count = orderProblemService.getOrderProblemCount(input);
			log.debug("공학을 포함하는 학과이름을 갖는 데이터 수: " + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 데이터 저장 테스트 */
	@Test
	public void testE() {
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_option("문의종류");
		input.setOrder_problem_content("안 이쁘네 사기치지 마세요.");
		input.setOrder_check_problem_reg_date("2020-08-26");
		input.setUser_no(3);
		input.setOrder_check_no(3);
		
		int output = 0;
		
		try {
			output = orderProblemService.addOrderProblem(input);
			log.debug("저장된 데이터 수: " + output);
			// [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 셋팅된다.
			log.debug("생성된 PK값 : " + input.getOrder_check_no());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 데이터 수정 테스트 */
	@Test
	public void testF() {
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_no(6);
		input.setOrder_problem_option("문의문의");
		input.setOrder_problem_content("안 이쁘네 사기치지 마세요!");
		input.setOrder_check_problem_reg_date("2020-08-26");
		input.setUser_no(3);
		input.setOrder_check_no(3);
		
		int output = 0;
		
		try {
			output = orderProblemService.editOrderProblem(input);
			log.debug("수정된 데이터 수: " + output);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 데이터 삭제 테스트 */
	@Test
	public void testG() {
		OrderProblem input = new OrderProblem();
		input.setOrder_problem_no(2);
		
		int output = 0;
		
		try {
			output = orderProblemService.deleteOrderProblem(input);
			log.debug("삭제된 데이터 수: " + output);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

}
