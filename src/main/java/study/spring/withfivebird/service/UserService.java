package study.spring.withfivebird.service;

import java.util.List;

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
	
	/**
	 * 고객 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	public List<User> getUserList(User input) throws Exception;
	
	/**
	 * 고객 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getUserCount(User input) throws Exception;
	
	/**
	 * 고객 데이터 등록하기
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addUser(User input) throws Exception;
	
	/**
	 * 고객 데이터 수정하기
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editUser(User input) throws Exception;
	
	/**
	 * 고객 데이터 삭제하기? 필요한가?
	 * @param User 삭제할 고객의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteUser(User input) throws Exception;
}
