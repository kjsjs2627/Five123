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
import study.spring.withfivebird.model.ProductReview;

/** Lombok의 Log4j 객체 */
// import lombok.extern.slf4j.Slf4j;
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
public class ProductReviewTest {

	/** MyBatis의 SQL세션 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private SqlSession sqlSession;

	/** 단일행 조회 테스트 */

	/*
	 * @Test public void testA() {
	 * 
	 * Product_review input = new Product_review(); input.setProduct_review_no(1);
	 * sqlSession.selectOne("Product_reviewMapper.selectItem", input); }
	 * 
	 *//** 다중행 조회 테스트 */
	/*
	 * 
	 * @Test public void testB() { //
	 * importstudy.spring.withfivebird.model.Product_review; Product_review input =
	 * new Product_review(); input.setProduct_review_title("말");
	 * sqlSession.selectList("Product_reviewMapper.selectList", input); }
	 * 
	 *//** 데이터 저장 테스트 */
	/*
	 * 
	 * @Test public void testC() { Product_review input = new Product_review();
	 * input.setProduct_review_title("옷이 너무 작아요.");
	 * input.setProduct_review_content("옷이 생각보다 너무 작아요 그래서 뚱땡이 같아요.");
	 * input.setProduct_review_hit(100);
	 * input.setProduct_review_reg_date("2020-08-28"); input.setOrder_check_no(1);
	 * 
	 * sqlSession.insert("Product_reviewMapper.insertItem", input); }
	 * 
	 *//** 데이터 삭제 테스트 */
	/*
	 * 
	 * @Test public void testD() { Product_review input = new Product_review();
	 * input.setProduct_review_no(4);
	 * sqlSession.delete("Product_reviewMapper.deleteItem", input); }
	 * 
	 *//** 데이터 수정 테스트 */
	/*
	 * @Test public void testE() { Product_review input = new Product_review();
	 * input.setProduct_review_no(5); input.setProduct_review_title("진짜진짜작아요");
	 * sqlSession.update("Product_reviewMapper.updateItem", input); }
	 * 
	 *//** 전체 데이터 수 조회 */
	/*
	 * 
	 * @Test public void testF() { int count =
	 * sqlSession.selectOne("Product_reviewMapper.selectCountAll", null);
	 * log.debug("전체 데이터 수 : " + count); }
	 * 
	 *//** 조건에 따른 데이터 수 조회 *//*
								 * @Test public void testG() { //
								 * importstudy.spring.withfivebird.model.Product_review; Product_review input =
								 * new Product_review(); input.setProduct_review_title("말"); int count =
								 * sqlSession.selectOne("Product_reviewMapper.selectCountAll", input);
								 * log.debug("말을 포함하는 리뷰 타이틀을 갖는 데이터 수 : " + count); }
								 */

}
