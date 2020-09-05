package study.spring.withfivebird.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.ProductColor;

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
public class ProductColorTest {

	/** MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	/** 단일행 조회 테스트 */
//	@Test
//	public void testA() {
//		ProductColor input = new ProductColor();
//		input.setProduct_color_no(2);
//		sqlSession.selectOne("ProductColorMapper.selectItem", input);
//	}
//	
//	/** 다중행 조회 테스트 */
//	@Test
//	public void testB() {
//		ProductColor input = new ProductColor();
//		input.setProduct_color_name("이");
//		sqlSession.selectList("ProductColorMapper.selectList", input);
//	}
//	
//	/** 데이터 저장 테스트 */
//	@Test
//	public void testC() {
//		ProductColor input = new ProductColor();
//		input.setProduct_color_name("블랙");
//		sqlSession.insert("ProductColorMapper.insertItem", input);
//	}
//	
//	/** 데이터 삭제 테스트 */
//	@Test
//	public void testD() {
//		ProductColor input = new ProductColor();
//		input.setProduct_color_no(17);
//		sqlSession.delete("ProductColorMapper.deleteItem", input);
//	}
//	
//	/** 데이터 수정 테스트 */
//	@Test
//	public void testE() {
//		ProductColor input = new ProductColor();
//		input.setProduct_color_no(12);
//		input.setProduct_color_name("화이트");
//		sqlSession.update("ProductColorMapper.updateItem", input);
//	}
//	
//	/** 전체 데이터 수 조회 */
//	@Test
//	public void testF() {
//		int count = sqlSession.selectOne("ProductColorMapper.selectCountAll", null);
//		log.debug("전체 데이터 수: " + count);
//	}
//	
//	/** 조건에 따른 데이터 수 조회 */
//	@Test
//	public void testG() {
//		ProductColor input = new ProductColor();
//		input.setProduct_color_name("이");
//		int count = sqlSession.selectOne("ProductColorMapper.selectCountAll", input);
//		log.debug("이를 포함하는 색상이름을 갖는 데이터 수: " + count);
//	}
}
