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
import study.spring.withfivebird.model.Category;
import study.spring.withfivebird.model.ProductCategory;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
@WebAppConfiguration
@FixMethodOrder
public class CategoryTest {
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	/** 단일 행 조회 테스트 */
	public void testA() {
		Category input = new Category();
		input.setCategory_no(1); // catagory라고 컬럼 적혀있음
		sqlSession.selectOne("CategoryMapper.selectItem", input);
		
	}
	/** 다중행 조회 테스트 */
//	@Test
//	public void testB() {
//		Category input = new Category();
//		input.setCategory_name("Outer");
//		sqlSession.selectList("CategoryMapper.selectList", input);
//	}
	
	/** insert 테스트 */
//	@Test
//	public void testC() {
//		Category input = new Category();
//		input.setCategory_name("Test");
//		
//
//		sqlSession.selectList("CategoryMapper.insertItem", input);
//	}
	
	/** delete 테스트 */
//	@Test
//	public void testD() {
//		Category input = new Category();
//		input.setCatagory_no(7);
//		sqlSession.selectList("CategoryMapper.deleteItem", input);
//	}
	
	/** update 테스트 */
//	@Test
//	public void testE() {
//		Category input = new Category();
//		input.setCatagory_no(8);
//		input.setCategory_name("Test");
//		
//
//		sqlSession.selectList("CategoryMapper.insertItem", input);
//	}
	
	/** 전체 데이터 수 조회 */
//	@Test
//	public void testF() {
//		int count = sqlSession.selectOne("CategoryMapper.selectCountAll", null);
//		log.debug("전체데이터수 : " + count);
//	}
	
	/** 조건에 따른 데이터 수 조회*/
//	@Test
//	public void testG() {
//		Category input = new Category();
//		input.setCategory_name("test");
//		int count=sqlSession.selectOne("CategoryMapper.selectCountAll", input);
//		log.debug("포함하는 데이터수 : " + count);
//	}
	
	/** Join을 활용한 데이터 수  조회 */
//	@Test
//	public void testH() {
//		ProductCategory input = new ProductCategory();
//		input.setCategory_name("Top");
//		sqlSession.selectList("ProductCategoryMapper.selectJoin", input);
//	}
	
	@Test
	public void testI() {
		ProductCategory input = new ProductCategory();
		input.setCategory_name("Top");
		sqlSession.selectList("ProductCategoryMapper.selectCountAll", input);
	}
	
}
