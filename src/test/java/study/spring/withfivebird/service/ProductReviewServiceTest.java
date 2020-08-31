package study.spring.withfivebird.service;

import java.util.List;

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
public class ProductReviewServiceTest {

	/** Service 객체 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private ProductReviewService productReviewService;
	
	/** 단일행 조회 테스트 */
	@Test
	public void testA() {
		// 검색조건으로 사용된 POJO 클래스 객체
		ProductReview input = new ProductReview();
		input.setProduct_review_no(1);
		
		ProductReview output = null;
		
		try {
			output = productReviewService.getProductReviewItem(input);
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
		ProductReview input = new ProductReview();
		input.setProduct_review_title("말");
		
		List<ProductReview> output = null;
		
		try {
			output = productReviewService.getProductReviewList(input);
			
			for (ProductReview item : output) {
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
			count = productReviewService.getProductReviewCount(null);
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
		
		ProductReview input = new ProductReview();
		input.setProduct_review_title("말");
		
		try {
			count = productReviewService.getProductReviewCount(input);
			log.debug("말을 포함하는 후기제목을 갖는 데이터 수: " + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 데이터 저장 테스트 */
	@Test
	public void testE() {
		ProductReview input = new ProductReview();
		input.setProduct_review_title("옷이 너무 작아요.");
		input.setProduct_review_content("옷이 생각보다 너무 작아요 그래서 뚱땡이 같아요.");
		input.setProduct_review_hit(100);
		input.setProduct_review_reg_date("2020-08-28"); 
		input.setOrder_check_no(1);
		
		int output = 0;
		
		try {
			output = productReviewService.addProductReview(input);
			log.debug("저장된 데이터 수: " + output);
			// [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 셋팅된다.
			log.debug("생성된 PK값: " + input.getProduct_review_no());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 데이터 수정 테스트 */
	@Test
	public void testF() {
		ProductReview input = new ProductReview();
		input.setProduct_review_no(5); 
		input.setProduct_review_title("진짜진짜작아요");
		
		int output = 0;
		
		try {
			output = productReviewService.editProductReview(input);
			log.debug("수정된 데이터 수: " + output);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
	}
	
	/** 데이터 삭제 테스트 */
	@Test
	public void testG() {
		ProductReview input = new ProductReview();
		input.setProduct_review_no(1);
		
		int output = 0;
		
		try {
			output = productReviewService.deleteProductReview(input);
			log.debug("삭제된 데이터 수: " + output); 
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
}
