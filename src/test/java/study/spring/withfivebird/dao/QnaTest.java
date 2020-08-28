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
import study.spring.withfivebird.model.Qna;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
@WebAppConfiguration
@FixMethodOrder
public class QnaTest {
	@Autowired
	private SqlSession sqlSession;
	
	/** 단일 행 조회 테스트 */
	@Test
	public void testA() {
		Qna input = new Qna();
		input.setQna_no(1);
		sqlSession.selectOne("QnaMapper.selectItem", input);
		
	}
	/** 다중행 조회 테스트 */
//	@Test
//	public void testB() {
//		Qna input = new Qna();
//		input.setQna_content("배송");
//		sqlSession.selectList("QnaMapper.selectList", input);
//	}
	
	/** insert 테스트 */
//	@Test
//	public void testC() {
//		Qna input = new Qna();
//		input.setQna_title("배송 문의");
//		input.setQna_content("언제옴?");
//		input.setQna_hit(10);
//		input.setQna_reg_date("2020-08-26");
//		input.setQna_edit_date("2020-08-26");
//			
//		sqlSession.selectList("QnaMapper.insertItem", input);
//	}
	
	/** delete 테스트 */
//	@Test
//	public void testD() {
//		Qna input = new Qna();
//		input.setQna_no(4);
//		sqlSession.selectList("QnaMapper.deleteItem", input);
//	}
	
	/** update 테스트 */
//	@Test
//	public void testE() {
//		Qna input = new Qna();
//		input.setQna_title("배송 문의");
//		input.setQna_content("언제옴?");
//		input.setQna_hit(10);
//		input.setQna_reg_date("2020-08-26");
//		input.setQna_edit_date("2020-08-27");
//		
//		sqlSession.selectList("QnaMapper.insertItem", input);
//	}
	
	/** 전체 데이터 수 조회 */
//	@Test
//	public void testF() {
//		int count = sqlSession.selectOne("QnaMapper.selectCountAll", null);
//		log.debug("전체데이터수 : " + count);
//	}
	
	/** 조건에 따른 데이터 수 조회*/
//	@Test
//	public void testG() {
//		Qna input = new Qna();
//		input.setQna_content("언제");
//		int count=sqlSession.selectOne("QnaMapper.selectCountAll", input);
//		log.debug("언제 포함하는 데이터수 : " + count);
//	}
	
	/** join */
//	@Test
//	public void testH() {
//		Qna input = new Qna();
//		input.setQna_content("언제");
//		sqlSession.selectList("QnaMapper.selectJoin", input);
//	}
	
}
