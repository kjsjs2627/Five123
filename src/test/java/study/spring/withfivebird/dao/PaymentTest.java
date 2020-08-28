package study.spring.withfivebird.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.Payment;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
@WebAppConfiguration
@FixMethodOrder
public class PaymentTest {
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	/** 단일 행 조회 테스트 */
	public void testA() {
		Payment input = new Payment();
		input.setPayment_no(1);
		sqlSession.selectOne("PaymentMapper.selectItem", input);
		
	}
	/** 다중행 조회 테스트 */
//	@Test
//	public void testB() {
//		Payment input = new Payment();
//		input.setPayment_total(100000);
//		sqlSession.selectList("PaymentMapper.selectList", input);
//	}
	
	/** insert 테스트 */
//	@Test
//	public void testC() {
//		Payment input = new Payment();
//		input.setPayment_total(35000);
//		input.setPayment_reg_date("2020-08-26");
//		input.setUser_no(3);
//		input.setBasket_no(6);
//
//		sqlSession.selectList("PaymentMapper.insertItem", input);
//	}
	
	/** delete 테스트 */
//	@Test
//	public void testD() {
//		Payment input = new Payment();
//		input.setPayment_no(9);
//		sqlSession.selectList("PaymentMapper.deleteItem", input);
//	}
	
	/** update 테스트 */
//	@Test
//	public void testE() {
//		Payment input = new Payment();
//		input.setPayment_no(10);
//		input.setPayment_total(35000);
//		input.setPayment_reg_date("2020-08-26");
//		input.setUser_no(3);
//		input.setBasket_no(3);
//
//		sqlSession.selectList("PaymentMapper.insertItem", input);
//	}
	
	/** 전체 데이터 수 조회 */
//	@Test
//	public void testF() {
//		int count = sqlSession.selectOne("PaymentMapper.selectCountAll", null);
//		log.debug("전체데이터수 : " + count);
//	}
	
	/** 조건에 따른 데이터 수 조회*/
//	@Test
//	public void testG() {
//		Payment input = new Payment();
//		input.setPayment_total(100000);
//		int count=sqlSession.selectOne("PaymentMapper.selectCountAll", input);
//		log.debug("100000 포함하는 데이터수 : " + count);
//	}
	
	/** join */
//	@Test
//	public void testH() {
//		Payment input = new Payment();
//		input.setPayment_total(100000);
//		sqlSession.selectList("PaymentMapper.selectJoin", input);
//	}
}
