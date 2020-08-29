package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.OrderCheck;

/** 주문내역 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface OrderCheckService {

	/**
	 * 주문내역 데이터 상세 조회
	 * @param OrderProblem 조회할 주문내역의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public OrderCheck getOrderCheckItem(OrderCheck input) throws Exception;
	
	/**
	 * 주문내역 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<OrderCheck> getOrderCheckList(OrderCheck input) throws Exception;
	
	/**
	 * 주문내역 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getOrderCheckCount(OrderCheck input) throws Exception;
	
	/**
	 * 주문내역 데이터 등록하기
	 * @return int
	 * @throws Exception
	 */
	public int addOrderCheck(OrderCheck input) throws Exception;
	
	/**
	 * 주문내역 데이터 수정하기
	 * @return int
	 * @throws Exception
	 */
	public int editOrderCheck(OrderCheck input) throws Exception;
	
	/**
	 * 주문내역 데이터 수정하기
	 * @return int
	 * @throws Exception
	 */
	public int deleteOrderCheck(OrderCheck input) throws Exception;
}
