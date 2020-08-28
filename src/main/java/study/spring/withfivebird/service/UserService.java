package study.spring.withfivebird.service;

import study.spring.withfivebird.model.User;

/** 고객 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface UserService {
	/**
	 * 고객 데이터 상세 조회
	 * @param User 조회할 고객의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public User getUserItem(User input) throws Exception;
}
