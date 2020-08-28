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
import study.spring.withfivebird.model.User;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
@WebAppConfiguration
@FixMethodOrder
public class UserTest {
	@Autowired
	private SqlSession sqlSession;
	
	/** 단일 행 조회 테스트 */
	@Test
	public void testA() {
		User input = new User();
		input.setUser_no(1);
		sqlSession.selectOne("UserMapper.selectItem", input);
		
	}
	/** 다중행 조회 테스트 */
//	@Test
//	public void testB() {
//		User input = new User();
//		input.setUser_addr1("서초");
//		sqlSession.selectList("UserMapper.selectList", input);
//	}
	
	/** insert 테스트 */
//	@Test
//	public void testC() {
//		User input = new User();
//		input.setUser_id("roaksgsp");
//		input.setUser_pw("WKwmdsk");
//		input.setUser_name("노가다");
//		input.setUser_tel("01012345678");
//		input.setUser_email("anjfksmsrjdi@gmail.com");
//		input.setUser_postcode("06611");
//		input.setUser_addr1("서울특별시 서초구 서초4 서초대로77길 55동");
//		input.setUser_addr2("3층 EZEN IT");
//		input.setUser_out("N");
//		input.setLevel_no(2);
//		
//		sqlSession.selectList("UserMapper.insertItem", input);
//	}
	
	/** delete 테스트 */
//	@Test
//	public void testD() {
//		User input = new User();
//		input.setUser_no(7);
//		sqlSession.selectList("UserMapper.deleteItem", input);
//	}
	
	/** update 테스트 */
//	@Test
//	public void testE() {
//		User input = new User();
//		input.setUser_no(8);
//		input.setUser_id("roaksgsp");
//		input.setUser_pw("WKwmdsk");
//		input.setUser_name("노가다수정");
//		input.setUser_tel("01012345678");
//		input.setUser_email("anjfksmsrjdi@gmail.com");
//		input.setUser_postcode("06611");
//		input.setUser_addr1("서울특별시 서초구 서초4 서초대로77길 55동");
//		input.setUser_addr2("3층 EZEN IT");
//		input.setUser_out("N");
//		input.setLevel_no(2);
//		
//		sqlSession.update("UserMapper.updateItem", input);
//	}
	
	/** 전체 데이터 수 조회 */
//	@Test
//	public void testF() {
//		int count = sqlSession.selectOne("UserMapper.selectCountAll", null);
//		log.debug("전체데이터수 : " + count);
//	}
	
	/** 조건에 따른 데이터 수 조회*/
//	@Test
//	public void testG() {
//		User input = new User();
//		input.setUser_addr1("서초");
//		int count=sqlSession.selectOne("UserMapper.selectCountAll", input);
//		log.debug("서초 포함하는 데이터수 : " + count);
//	}
	
	/** join */
//	@Test
//	public void testH() {
//		User input = new User();
//		input.setUser_addr1("서초");
//		sqlSession.selectList("UserMapper.selectJoin", input);
//	}
}
