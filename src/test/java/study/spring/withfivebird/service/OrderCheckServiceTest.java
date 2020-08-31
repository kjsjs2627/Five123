package study.spring.withfivebird.service;

import java.util.List;

import javax.xml.bind.Marshaller.Listener;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.OrderCheck;

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

public class OrderCheckServiceTest {
	/** Service 객체 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private OrderCheckService orderCheckService;
	
	/** 단일행 조회 테스트 */
	@Test
	public void testA() {
		// 검색조건으로 사용된 POJO 클래스 객체
		OrderCheck input = new OrderCheck();
		input.setOrder_check_no(2);
		
		OrderCheck output = null;
		
		try {
			output = orderCheckService.getOrderCheckItem(input);
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
		OrderCheck input = new OrderCheck();
		input.setOrder_check_color("아이보리");
		
		List<OrderCheck> output = null;
		
		try {
			output = orderCheckService.getOrderCheckList(input);
			
			for (OrderCheck item : output) {
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
			count = orderCheckService.getOrderCheckCount(null);
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
		
		OrderCheck input = new OrderCheck();
		input.setOrder_check_color("아이보리");
		
		try {
			count = orderCheckService.getOrderCheckCount(input);
			log.debug("공학을 포함하는 학과이름을 갖는 데이터 수: " + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 데이터 저장 테스트 */
	@Test
	public void testE() {
		OrderCheck input = new OrderCheck();
		input.setOrder_check_delivery("배송완료");
		input.setOrder_check_name("이소라");
		input.setOrder_check_postcode("12345");
		input.setOrder_check_add1("서울시");
		input.setOrder_check_add2("5층");
		input.setOrder_check_tel("010-1234-5678");
		input.setOrder_check_email("den@naver.com");
		input.setPayment_no(1);
		input.setOrder_check_number("123456789");
		input.setOrder_check_color("아이보리");
		input.setOrder_check_size("S");
		input.setOrder_check_amount(1);
		
		int output = 0;
		
		try {
			output = orderCheckService.addOrderCheck(input);
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
		OrderCheck input = new OrderCheck();
	 	input.setOrder_check_no(7);
	 	input.setOrder_check_delivery("배송완료");
		input.setOrder_check_name("이영자");
		input.setOrder_check_postcode("12345");
		input.setOrder_check_add1("서울시");
		input.setOrder_check_add2("5층");
		input.setOrder_check_tel("010-1234-5678");
		input.setOrder_check_email("den@naver.com");
		input.setPayment_no(1);
		input.setOrder_check_number("123456789");
		input.setOrder_check_color("아이보리");
		input.setOrder_check_size("S");
		input.setOrder_check_amount(1);
		
		int output = 0;
		
		try {
			output = orderCheckService.editOrderCheck(input);
			log.debug("수정된 데이터 수: " + output);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 데이터 삭제 테스트 */
	@Test
	public void testG() {
		OrderCheck input = new OrderCheck();
		input.setOrder_check_no(6);
		
		int output = 0;
		
		try {
			output = orderCheckService.deleteOrderCheck(input);
			log.debug("삭제된 데이터 수: " + output);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

}
