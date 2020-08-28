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
import study.spring.withfivebird.model.Product;
import study.spring.withfivebird.model.Product_review;

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
public class ProductTest {
	/** MyBatis의 SQL세션 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private SqlSession sqlSession;

	/** 단일행 조회 테스트 */

	/*
	 * @Test public void testA() {
	 * 
	 * Product input = new Product(); input.setProduct_no(1);
	 * sqlSession.selectOne("ProductMapper.selectItem", input); }
	 * 
	 *//** 다중행 조회 테스트 */
	/*
	 * 
	 * @Test public void testB() { // importstudy.spring.withfivebird.model.Product;
	 * Product input = new Product(); input.setProduct_name("eee");
	 * sqlSession.selectList("ProductMapper.selectList", input); }
	 * 
	 *//** 데이터 저장 테스트 */
	/*
	 * 
	 * @Test public void testC() { Product input = new Product();
	 * input.setProduct_name("코지파자마2");
	 * input.setProduct_content("여러분의 성원에 힘입어 코지파자마2가 나왔습니다.");
	 * input.setProduct_price(33500); input.setProduct_best("Y");
	 * input.setProduct_new("Y");
	 * input.setProduct_img("assets/img/bottom/bottom3454");
	 * input.setProduct_sale(10); input.setCategory_no(5);
	 * input.setProduct_size_no1(1); input.setProduct_size_no2(2);
	 * input.setProduct_size_no3(3); input.setProduct_color_no1(1);
	 * input.setProduct_color_no2(12); input.setProduct_color_no3(13);
	 * input.setProduct_detail_img1("assets/img/bottom/bottom344");
	 * input.setProduct_detail_img2("assets/img/bottom/bottom34");
	 * input.setProduct_detail_img3("assets/img/bottom/bottom3434");
	 * input.setProduct_detail_img4("assets/img/bottom/bottom3444");
	 * input.setProduct_detail_content("정말 시원하고 이쁜 옷");
	 * 
	 * 
	 * sqlSession.insert("ProductMapper.insertItem", input); }
	 * 
	 *//** 데이터 삭제 테스트 */
	/*
	 * 
	 * @Test public void testD() { Product input = new Product();
	 * input.setProduct_no(71); sqlSession.delete("ProductMapper.deleteItem",
	 * input); }
	 * 
	 *//** 데이터 수정 테스트 */
	/*
	 * @Test public void testE() { Product input = new Product();
	 * input.setProduct_no(70); input.setProduct_detail_content("주름이 있는듯 없는듯");
	 * sqlSession.update("ProductMapper.updateItem", input); }
	 * 
	 *//** 전체 데이터 수 조회 */
	/*
	 * 
	 * @Test public void testF() { int count =
	 * sqlSession.selectOne("ProductMapper.selectCountAll", null);
	 * log.debug("전체 데이터 수 : " + count); }
	 * 
	 *//** 조건에 따른 데이터 수 조회 *//*
								 * @Test public void testG() { //
								 * importstudy.spring.withfivebird.model.Product_review; Product input = new
								 * Product(); input.setProduct_name("eee"); int count =
								 * sqlSession.selectOne("ProductMapper.selectCountAll", input);
								 * log.debug("eee을 포함하는 제품명을 갖는 데이터 수 : " + count); }
								 */

}
