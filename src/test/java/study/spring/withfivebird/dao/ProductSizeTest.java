package study.spring.withfivebird.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.ProductSize;

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
public class ProductSizeTest {

	/** MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;

	/** 단일행 조회 테스트 */
	@Test
	public void testA() {
		ProductSize input = new ProductSize();
		input.setProduct_size_no(1);
		sqlSession.selectOne("ProductSizeMapper.selectItem", input);
	}

	/** 다중행 조회 테스트 */
	@Test
	public void testB() {
		ProductSize input = new ProductSize();
		input.setProduct_size_name('S');
		sqlSession.selectList("ProductSizeMapper.selectList", input);
	}

	/** 데이터 저장 테스트 */
	@Test
	public void testC() {
		ProductSize input = new ProductSize();
		input.setProduct_size_name('S');
		sqlSession.insert("ProductSizeMapper.insertItem", input);
	}

	/** 데이터 삭제 테스트 */
	@Test
	public void testD() {
		ProductSize input = new ProductSize();
		input.setProduct_size_no(7);
		sqlSession.delete("ProductSizeMapper.deleteItem", input);
	}

	/** 데이터 수정 테스트 */
	@Test
	public void testE() {
		ProductSize input = new ProductSize();
		input.setProduct_size_no(2);
		input.setProduct_size_name('L');
		sqlSession.update("ProductSizeMapper.updateItem", input);
	}

	/** 전체 데이터 수 조회 */
	@Test
	public void testF() {
		int count = sqlSession.selectOne("ProductSizeMapper.selectCountAll", null);
		log.debug("전체 데이터 수: " + count);
	}

	/** 조건에 따른 데이터 수 조회 */
	@Test
	public void testG() {
		ProductSize input = new ProductSize();
		input.setProduct_size_name('S');
		int count = sqlSession.selectOne("ProductSizeMapper.selectCountAll", input);
		log.debug("로즈를 포함하는 등급이름을 갖는 데이터 수: " + count);
	}

}
