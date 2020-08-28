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
import study.spring.withfivebird.model.Level;
import study.spring.withfivebird.model.ProductQna;

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

public class ProductQnaTest {
	/** MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;

	/** 단일행 조회 테스트 */
	@Test
	public void testA() {
		ProductQna input = new ProductQna();
		input.setProduct_qna_no(5);
		sqlSession.selectOne("ProductQnaMapper.selectItem", input);
	}

	/** 다중행 조회 테스트 */
	@Test
	public void testB() {
		ProductQna input = new ProductQna();
		input.setProduct_qna_title("질문");
		sqlSession.selectList("ProductQnaMapper.selectList", input);
	}

	/** 데이터 저장 테스트 */
	@Test
	public void testC() {
		ProductQna input = new ProductQna();
		input.setProduct_qna_title("질문");
		input.setProduct_qna_content("내용");
		input.setProduct_qna_hit(20);
		input.setProduct_qna_reg_date("2020-08-20");
		input.setProduct_no(10);
		sqlSession.insert("ProductQnaMapper.insertItem", input);
	}

	/** 데이터 삭제 테스트 */
	@Test
	public void testD() {
		ProductQna input = new ProductQna();
		input.setProduct_qna_no(7);
		sqlSession.delete("ProductQnaMapper.deleteItem", input);
	}

	/** 데이터 수정 테스트 */
	@Test
	public void testE() {
		ProductQna input = new ProductQna();
		input.setProduct_qna_no(5);
		input.setProduct_qna_title("제목");
		input.setProduct_qna_content("질문 내용입니다.");
		input.setProduct_qna_hit(50);
		input.setProduct_qna_reg_date("2020-07-20");
		input.setProduct_no(4);
		sqlSession.update("ProductQnaMapper.updateItem", input);
	}

	/** 전체 데이터 수 조회 */
	@Test
	public void testF() {
		int count = sqlSession.selectOne("ProductQnaMapper.selectCountAll", null);
		log.debug("전체 데이터 수: " + count);
	}
	
	/** 조건에 따른 데이터 수 조회 */
	@Test
	public void testG() {
		ProductQna input = new ProductQna();
		input.setProduct_qna_title("질문");
		int count = sqlSession.selectOne("ProductQnaMapper.selectCountAll", input);
		log.debug("질문를 포함하는 제목이름을 갖는 데이터 수: " + count);
	}
}
