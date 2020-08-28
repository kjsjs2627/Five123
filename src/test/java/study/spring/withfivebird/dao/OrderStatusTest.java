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
import study.spring.withfivebird.model.OrderStatus;

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

public class OrderStatusTest {
	/**MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	/** 데이터 저장 테스트 */
	@Test
	public void testC() {
		OrderStatus input = new OrderStatus();
		input.setOrder_status_delivery('B');
		input.setUser_no(3);
		input.setOrder_check_no(3);
		sqlSession.insert("OrderStatusMapper.insertItem", input);
	}
	
	/** 데이터 삭제 테스트 */
	@Test
	public void testD() {
		OrderStatus input = new OrderStatus();
		input.setOrder_status_no(3);
		sqlSession.delete("OrderStatusMapper.deleteItem", input);
	}
	
	/** 데이터 수정 테스트 */
	@Test
	public void testE() {
		OrderStatus input = new OrderStatus();
		input.setOrder_status_no(1);
		input.setOrder_status_delivery('B');
		input.setUser_no(5);
		input.setOrder_check_no(5);
		sqlSession.update("OrderStatusMapper.updateItem", input);
	}
	
	/** 전체 데이터 수 조회 */
	@Test
	public void testF() {
		int count = sqlSession.selectOne("OrderStatusMapper.selectCountAll", null);
		log.debug("전체 데이터 수: " + count);
	}

	/** 조건에 따른 데이터 수 조회 */
	@Test
	public void testG() {
		OrderStatus input = new OrderStatus();
		input.setOrder_status_delivery('B');
		int count = sqlSession.selectOne("OrderStatusMapper.selectCountAll", input);
		log.debug("B를 포함하는 배송현황 데이터 수: " + count);
	}

}
