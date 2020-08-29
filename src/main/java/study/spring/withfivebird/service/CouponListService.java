package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.CouponList;


public interface CouponListService {
	/**
	 * CouponList 데이터 상세 조회
	 * @param CouponList 조회할 CouponList의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public CouponList getCouponListItem(CouponList input) throws Exception;
	
	/**
	 * CouponList 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	public List<CouponList> getCouponListList(CouponList input) throws Exception;
	
	/**
	 * CouponList 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getCouponListCount(CouponList input) throws Exception;
	
	/**
	 * CouponList 데이터 등록하기
	 * @param CouponList 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addCouponList(CouponList input) throws Exception;
	
	/**
	 * CouponList 데이터 수정하기
	 * @param CouponList 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editCouponList(CouponList input) throws Exception;
	
	/**
	 * CouponList 데이터 삭제하기
	 * @param CouponList 삭제할 CouponList의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteCouponList(CouponList input) throws Exception;
}

