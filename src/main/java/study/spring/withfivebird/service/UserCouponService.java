package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.UserCoupon;


public interface UserCouponService {
	/**
	 * UserCoupon 데이터 상세 조회
	 * @param UserCoupon 조회할 찜목록의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public UserCoupon getUserCouponItem(UserCoupon input) throws Exception;
	
	/**
	 * UserCoupon 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	public List<UserCoupon> getUserCouponList(UserCoupon input) throws Exception;
	
	/**
	 * UserCoupon 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getUserCouponCount(UserCoupon input) throws Exception;
	
	/**
	 * UserCoupon 데이터 등록하기
	 * @param UserCoupon 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addUserCoupon(UserCoupon input) throws Exception;
	
	/**
	 * UserCoupon 데이터 수정하기
	 * @param UserCoupon 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editUserCoupon(UserCoupon input) throws Exception;
	
	/**
	 * UserCoupon 데이터 삭제하기
	 * @param UserCoupon 삭제할 UserCoupon의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteUserCoupon(UserCoupon input) throws Exception;
}
