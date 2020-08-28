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
import study.spring.withfivebird.model.Order_problem;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
@WebAppConfiguration
@FixMethodOrder
public class Order_problemTest {
	@Autowired
	private SqlSession sqlSession;

	@Test
	/** 단일 행 조회 테스트 */
	public void testA() {
		Order_problem input = new Order_problem();
		input.setOrder_problem_no(1);
		sqlSession.selectOne("Order_problemMapper.selectItem", input);

	}

	/** 다중행 조회 테스트 */
//	@Test
//	public void testB() {
//		Order_problem input = new Order_problem();
//		input.setOrder_problem_option("문의");
//		sqlSession.selectList("Order_problemMapper.selectList", input);
//	}

	/** insert 테스트 */
//	@Test
//	public void testC() {
//		Order_problem input = new Order_problem();
//		input.setOrder_problem_option("문의종류");
//		input.setOrder_problem_content("안 이쁘네 사기치지 마세요.");
//		input.setOrder_check_problem_reg_date("2020-08-26");
//		input.setUser_no(3);
//		input.setOrder_check_no(3);
//
//		sqlSession.selectList("Order_problemMapper.insertItem", input);
//	}

	/** delete 테스트 */
//	@Test
//	public void testD() {
//		Order_problem input = new Order_problem();
//		input.setOrder_problem_no(7);
//		sqlSession.selectList("Order_problemMapper.deleteItem", input);
//	}

	/** update 테스트 */
//	@Test
//	public void testE() {
//		Order_problem input = new Order_problem();
//		input.setOrder_problem_no(6);
//		input.setOrder_problem_option("문의문의");
//		input.setOrder_problem_content("안 이쁘네 사기치지 마세요!");
//		input.setOrder_check_problem_reg_date("2020-08-26");
//		input.setUser_no(3);
//		input.setOrder_check_no(3);
//
//		sqlSession.update("Order_problemMapper.updateItem", input);
//	}

	/** 전체 데이터 수 조회 */
//	@Test
//	public void testF() {
//		int count = sqlSession.selectOne("Order_problemMapper.selectCountAll", null);
//		log.debug("전체데이터수 : " + count);
//	}

	/** 조건에 따른 데이터 수 조회 */
//	@Test
//	public void testG() {
//		Order_problem input = new Order_problem();
//		input.setOrder_problem_option("송");
//		int count=sqlSession.selectOne("Order_problemMapper.selectCountAll", input);
//		log.debug("포함하는 데이터수 : " + count);
//	}

	/** join */
	@Test
	public void testH() {
		Order_problem input = new Order_problem();
		input.setOrder_problem_option("문의");
		sqlSession.selectList("Order_problemMapper.selectJoin", input);
	}
}
