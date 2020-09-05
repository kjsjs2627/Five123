package study.spring.withfivebird.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.ProductCategory;

/** Lombok의 log4j 객체 */
//import lombok.extern.slf4j.Slf4j;
@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 '모든'이라는 의미) */
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
/** 웹 어플리케이션임을 명시 */
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
@FixMethodOrder
public class CategoryServiceTest {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private ProductCategoryService productCategoryService;
	
	/** 단일행 조회 테스트 */
//	@Test
//	public void testA() {
//		// 검색조건으로 사용될 POJO 클래스 객체 
//		Category input = new Category();
//		input.setCategory_no(4);
//		
//		Category output = null;
//		
//		try {
//			output = categoryService.getCategoryItem(input);
//			log.debug(output.toString());
//		}catch(Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
	
	/** 다중행 조회 테스트 */
//	@Test
//	public void testB() {
//		// 검색조건으로 사용될 POJO 클래스 객체 
//		Category input = new Category();
//		input.setCategory_name("T");
//		
//		List<Category> output = null;
//		
//		try {
//			output = categoryService.getCategoryList(input);
//			
//			for(Category item : output) {
//				log.debug(item.toString());
//			}
//		}catch(Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
	
	/** 전체 데이터 수 조회 */
//	@Test
//	public void testC() {
//		int count = 0;
//		
//		try {
//			count = categoryService.getCategoryCount(null);
//			log.debug("전체 데이터 수 : " + count);
//		}catch(Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
	
	/** 조건에 따른 데이터 수 조회 */
//	@Test
//	public void testD() {
//		int count = 0;
//		
//		Category input = new Category();
//		input.setCategory_name("T");
//		
//		try {
//			count = categoryService.getCategoryCount(input);
//			log.debug("T 포함하는 데이터 수 : " + count);
//		}catch(Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
	
	/** 데이터 저장 테스트 */
//	@Test
//	public void testE() {
//		Category input = new Category();
//		
//		input.setCategory_name("test");
//
//		
//		int output = 0;
//		
//		try {
//			output = categoryService.addCategory(input);
//			log.debug("저장된 데이터 수 : " + output);
//			// [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에  셋팅된다.
//			log.debug("생성된 PK값 : "+ input.getCategory_no());
//		}catch(Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
	
	/** 데이터 수정 테스트 */
//	@Test
//	public void testF() {
//		Category input = new Category();
//		input.setCategory_no(6);
//		input.setCategory_name("Test");
//		
//		int output = 0;
//		
//		try {
//			output = categoryService.editCategory(input);
//			log.debug("수정된 데이터 수 : " + output);
//		}catch(Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
	
	/** 데이터 삭제 테스트 */
//	@Test
//	public void testG() {
//		Category input = new Category();
//		input.setCategory_no(7);
//		
//		int output = 0;
//		
//		try {
//			output = categoryService.deleteCategory(input);
//			log.debug("삭제된 데이터 수 : " + output);
//		}catch(Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
	@Test
	public void testH() {
		ProductCategory input = new ProductCategory();
		input.setCategory_name("Top");
		
		List<ProductCategory> output = null;
		
		try {
			output = productCategoryService.getProductCategoryList(input);
			
			for(ProductCategory item : output) {
				log.debug(item.toString());
			}
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	@Test
	public void testI() {
		int count = 0;
		
		try{
			count = productCategoryService.getProductCategoryCount(null);
			log.debug("전체데이터수 : " + count);
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
		
	}
	@Test
	public void testJ() {
		int count = 0;
		
		ProductCategory input = new ProductCategory();
		input.setCategory_name("Bottom");
		
		try{
			count = productCategoryService.getProductCategoryCount(input);
			log.debug("데이터수 : " + count);
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
		
	}
}
