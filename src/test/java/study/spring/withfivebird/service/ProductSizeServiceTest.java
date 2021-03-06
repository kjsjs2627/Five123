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
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class ProductSizeServiceTest {
	/** Service 객체 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private ProductSizeService productSizeService;
	
	/** 단일행 조회 테스트 */
//	@Test
//	public void testA() {
//		// 검색조건으로 사용된 POJO 클래스 객체
//		ProductSize input = new ProductSize();
//		input.setProduct_size_no(1);
//		
//		ProductSize output = null;
//		
//		try {
//			output = productSizeService.getProductSizeItem(input);
//			log.debug(output.toString());
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//	
//	/** 다중행 조회 테스트 */
//	@Test
//	public void testB() {
//		// 검색조건으로 사용될 POJO 클래스 객체
//		ProductSize input = new ProductSize();
//		input.setProduct_size_name('S');
//		
//		List<ProductSize> output = null;
//		
//		try {
//			output = productSizeService.getProductSizeList(input);
//			
//			for (ProductSize item : output) {
//				log.debug(item.toString());
//			}
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//
//	/** 전체 데이터 수 조회 */
//	@Test
//	public void testC() {
//		int count = 0;
//		
//		try {
//			count = productSizeService.getProductSizeCount(null);
//			log.debug("전체 데이터 수: " + count);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//	
//	/** 조건에 따른 데이터 수 조회 */
//	@Test
//	public void testD() {
//		int count = 0;
//		
//		ProductSize input = new ProductSize();
//		input.setProduct_size_name('S');
//		
//		try {
//			count = productSizeService.getProductSizeCount(input);
//			log.debug("S을 포함하는 사이즈이름을 갖는 데이터 수: " + count);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//	
//	/** 데이터 저장 테스트 */
//	@Test
//	public void testE() {
//		ProductSize input = new ProductSize();
//		input.setProduct_size_name('S');
//		
//		int output = 0;
//		
//		try {
//			output = productSizeService.addProductSize(input);
//			log.debug("저장된 데이터 수: " + output);
//			// [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 셋팅된다.
//			log.debug("생성된 PK값 : " + input.getProduct_size_no());
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//	
//	/** 데이터 수정 테스트 */
//	@Test
//	public void testF() {
//		ProductSize input = new ProductSize();
//		input.setProduct_size_no(2);
//		input.setProduct_size_name('L');
//		
//		int output = 0;
//		
//		try {
//			output = productSizeService.editProductSize(input);
//			log.debug("수정된 데이터 수: " + output);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//	
//	/** 데이터 삭제 테스트 */
//	@Test
//	public void testG() {
//		ProductSize input = new ProductSize();
//		input.setProduct_size_no(7);
//		
//		int output = 0;
//		
//		try {
//			output = productSizeService.deleteProductSize(input);
//			log.debug("삭제된 데이터 수: " + output);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}

}