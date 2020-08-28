package study.spring.withfivebird.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.User;
import study.spring.withfivebird.service.UserService;

/** 고객 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service // --> import org.springframework.stereotype.Service;
public class UserServiceImpl implements UserService{
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 고객 데이터 상세 조회
	 * @param User 조회할 고객의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public User getUserItem(User input) throws Exception {
		User result = null;
		
		try {
			result = sqlSession.selectOne("UserMapper.selectItem", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
