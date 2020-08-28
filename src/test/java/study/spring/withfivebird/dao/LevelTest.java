package study.spring.withfivebird.dao;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.Level;

import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

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

public class LevelTest {
	/**MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	/** 단일행 조회 테스트 */
	@Test
	public void testA() {
		Level input = new Level();
		input.setLevel_no(1);
		sqlSession.selectOne("LevelMapper.selectItem", input);
	}
	
	/** 다중행 조회 테스트 */
	@Test
	public void testB() { 
		Level input = new Level();
		input.setLevel_img("purplerose");
		sqlSession.selectList("LevelMapper.selectList", input);
	}

	/** 데이터 저장 테스트 */
	@Test
	public void testC() {
		Level input = new Level();
		input.setLevel_name("퍼플로즈");
		input.setLevel_img("assets/img/my/purplerose.png");
		sqlSession.insert("LevelMapper.insertItem", input);
	}
	
	/** 데이터 삭제 테스트 */
	@Test
	public void testD() {
		Level input = new Level();
		input.setLevel_no(2);
		sqlSession.delete("LevelMapper.deleteItem", input);
	}
	
	/** 데이터 수정 테스트 */
	@Test
	public void testE() {
		Level input = new Level();
		input.setLevel_no(1);
		input.setLevel_name("뚬땜이");
		input.setLevel_img("assets/img/my/dia.png");
		sqlSession.update("LevelMapper.updateItem", input);
	}
	
	/** 전체 데이터 수 조회 */
	@Test
	public void testF() {
		int count = sqlSession.selectOne("LevelMapper.selectCountAll", null);
		log.debug("전체 데이터 수: " + count);
	}
	
	/** 조건에 따른 데이터 수 조회 */
	@Test
	public void testG() {
		Level input = new Level();
		input.setLevel_name("로즈");
		int count = sqlSession.selectOne("LevelMapper.selectCountAll", input);
		log.debug("로즈를 포함하는 등급이름을 갖는 데이터 수: " + count);
	}
}
