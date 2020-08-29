package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.Heart;



public interface HeartService {
	/**
	 * 찜목록 데이터 상세 조회
	 * @param Heart 조회할 찜목록의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Heart getHeartItem(Heart input) throws Exception;
	
	/**
	 * 찜목록 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	public List<Heart> getHeartList(Heart input) throws Exception;
	
	/**
	 * 찜목록 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getHeartCount(Heart input) throws Exception;
	
	/**
	 * 찜목록 데이터 등록하기
	 * @param Heart 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addHeart(Heart input) throws Exception;
	
	/**
	 * 찜목록 데이터 수정하기
	 * @param Heart 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editHeart(Heart input) throws Exception;
	
	/**
	 * 찜목록 데이터 삭제하기
	 * @param Heart 삭제할 찜목록의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteHeart(Heart input) throws Exception;
}
