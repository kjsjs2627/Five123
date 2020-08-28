package study.spring.withfivebird.dao;

import org.apache.ibatis.session.SqlSession;
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

public class OrderCheckTest {

	/** MyBatis의 SQL세션 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private SqlSession sqlSession;

	/** 단일행 조회 테스트 */
//	  @Test 
//	  public void testA() { 
//		  // import study.spring.withfivebird.model.OrderCheck; 
//		  OrderCheck input = new OrderCheck(); 
//		  input.setOrder_check_no(2);
//		  sqlSession.selectOne("OrderCheckMapper.selectItem", input); 
//	  }
	 

	/** 다중행 조회 테스트 */ 
//	@Test
//	public void testB() { 
//		 // import study.spring.withfivebird.model.OrderCheck;
//		OrderCheck input = new OrderCheck();
//		input.setOrder_check_color("아이보리");
//		sqlSession.selectList("OrderCheckMapper.selectList", input);
//	}

	/** 데이터 저장 테스트 */ 
//	@Test
//	public void testC() { 
//		OrderCheck input = new OrderCheck();
//		input.setOrder_check_delivery("배송완료");
//		input.setOrder_check_name("이소라");
//		input.setOrder_check_postcode("12345");
//		input.setOrder_check_add1("서울시");
//		input.setOrder_check_add2("5층");
//		input.setOrder_check_tel("010-1234-5678");
//		input.setOrder_check_email("den@naver.com");
//		input.setPayment_no(1);
//		input.setOrder_check_number("123456789");
//		input.setOrder_check_color("아이보리");
//		input.setOrder_check_size("S");
//		input.setOrder_check_amount(1);
//	
//		sqlSession.insert("OrderCheckMapper.insertItem", input); 
//	}
	 

	/** 데이터 삭제 테스트 */
//	  @Test 
//	  public void testD() { 
//		  OrderCheck input = new OrderCheck();
//		  input.setOrder_check_no(6); 
//		  sqlSession.delete("OrderCheckMapper.deleteItem", input); 
//	  }
	 

	/** 데이터 수정 테스트 */
//	 @Test 
//	 public void testE() { 
//		 OrderCheck input = new OrderCheck();
//		 	input.setOrder_check_no(7);
//		 	input.setOrder_check_delivery("배송완료");
//			input.setOrder_check_name("이영자");
//			input.setOrder_check_postcode("12345");
//			input.setOrder_check_add1("서울시");
//			input.setOrder_check_add2("5층");
//			input.setOrder_check_tel("010-1234-5678");
//			input.setOrder_check_email("den@naver.com");
//			input.setPayment_no(1);
//			input.setOrder_check_number("123456789");
//			input.setOrder_check_color("아이보리");
//			input.setOrder_check_size("S");
//			input.setOrder_check_amount(1);
//		 sqlSession.update("OrderCheckMapper.updateItem", input); 
//	}

	/** 전체 데이터 수 조회 */
//	@Test
//	public void testF() {
//		int count = sqlSession.selectOne("OrderCheckMapper.selectCountAll", null);
//		log.debug("전체 데이터 수: " + count);
//	}

	/** 조건에 따른 데이터 수 조회 */
//	@Test
//	public void testG() {
//		 // import study.spring.withfivebird.model.OrderCheck;
//		OrderCheck input = new OrderCheck();
//		input.setOrder_check_color("아이보리");
//		int count = sqlSession.selectOne("OrderCheckMapper.selectCountAll", input);
//		log.debug("아이보리  데이터 수: " + count);
//	}
	
	/** Join을 활용한 데이터 수 조회 */
//	@Test
//	public void testH() {
//		 // import study.spring.withfivebird.model.OrderCheck;
//		OrderCheck input = new OrderCheck();
//		input.setOrder_check_name("안이제");
//		sqlSession.selectList("OrderCheckMapper.selectJoin", input);
//	}
}
