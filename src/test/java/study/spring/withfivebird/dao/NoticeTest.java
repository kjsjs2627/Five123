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
import study.spring.withfivebird.model.Notice;

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

public class NoticeTest {

	/** MyBatis의 SQL세션 주입 설정 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private SqlSession sqlSession;

	/** 단일행 조회 테스트 */
//	  @Test 
//	  public void testA() { 
//		  // import study.spring.withfivebird.model.Notice; 
//		  Notice input = new Notice(); 
//		  input.setNotice_no(1);
//		  sqlSession.selectOne("NoticeMapper.selectItem", input); 
//	  }
	 

	/** 다중행 조회 테스트 */ 
//	@Test
//	public void testB() { 
//		// import study.spring.withfivebird.model.Notice;
//		Notice input = new Notice();
//		input.setNotice_title("안내");
//		sqlSession.selectList("NoticeMapper.selectList", input);
//	}

	/** 데이터 저장 테스트 */ 
//	@Test
//	public void testC() { 
//		Notice input = new Notice();
//		input.setNotice_title("배송안내");
//		input.setNotice_content("배송비는 무료");
//		input.setNotice_hit(23);
//		input.setNotice_reg_date("2020-08-26");
//		input.setUser_no(3);
//		sqlSession.insert("NoticeMapper.insertItem", input); 
//	}
	 

	/** 데이터 삭제 테스트 */
//	  @Test 
//	  public void testD() { 
//		  Notice input = new Notice();
//		  input.setNotice_no(4); 
//		  sqlSession.delete("NoticeMapper.deleteItem", input); 
//	  }
	 

	/** 데이터 수정 테스트 */
//	 @Test 
//	 public void testE() { 
//		 Notice input = new Notice();
//		 input.setNotice_no(3);
//		 input.setNotice_title("배송안내");
//		 input.setNotice_content("배송비는 무료");
//		 input.setNotice_hit(23);
//		 input.setNotice_reg_date("2020-08-26");
//		 input.setUser_no(3);
//		 sqlSession.update("NoticeMapper.updateItem", input); 
//	}

	/** 전체 데이터 수 조회 */
//	@Test
//	public void testF() {
//		int count = sqlSession.selectOne("NoticeMapper.selectCountAll", null);
//		log.debug("전체 데이터 수: " + count);
//	}

	/** 조건에 따른 데이터 수 조회 */
//	@Test
//	public void testG() {
//		// import study.spring.withfivebird.model.Notice;
//		Notice input = new Notice();
//		input.setUser_no(3);
//		int count = sqlSession.selectOne("NoticeMapper.selectCountAll", input);
//		log.debug("'3'을  갖는 데이터 수: " + count);
//	}
	
	/** Join을 활용한 데이터 수 조회 */
//	@Test
//	public void testH() {
//		// import study.spring.withfivebird.model.Notice;
//		Notice input = new Notice();
//		input.setUser_name("안이제");
//		sqlSession.selectList("NoticeMapper.selectJoin", input);
//	}
}
