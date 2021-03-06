package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.OrderStatus;

/** 주문현황 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface OrderStatusService {

	/**
	 * 주문현황 데이터 상세 조회
	 * @param OrderProblem 조회할 주문현황의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public OrderStatus getOrderStatusItem(OrderStatus input) throws Exception;
	
	/**
	 * 주문현황 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<OrderStatus> getOrderStatusList(OrderStatus input) throws Exception;
	
	/**
	 * 주문현황 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getOrderStatusCount(OrderStatus input) throws Exception;
	
	/**
	 * 주문현황 데이터 등록하기
	 * @return int
	 * @throws Exception
	 */
	public int addOrderStatus(OrderStatus input) throws Exception;
	
	/**
	 * 주문현황 데이터 수정하기
	 * @return int
	 * @throws Exception
	 */
	public int editOrderStatus(OrderStatus input) throws Exception;
	
	/**
	 * 주문현황 데이터 삭제하기
	 * @return int
	 * @throws Exception
	 */
	public int deleteOrderStatus(OrderStatus input) throws Exception;
}
