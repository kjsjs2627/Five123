package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.OrderProblem;

/** 문의 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface OrderProblemService {
	/**
	 * 문의 데이터 상세 조회
	 * @param OrderProblem 조회할 문의의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public OrderProblem getOrderProblemItem(OrderProblem input) throws Exception;
	
	/**
	 * 문의 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<OrderProblem> getOrderProblemList(OrderProblem input) throws Exception;
	
	/**
	 * 문의 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getOrderProblemCount(OrderProblem input) throws Exception;
	
	/**
	 * 문의 데이터 등록하기
	 * @return int
	 * @throws Exception
	 */
	public int addOrderProblem(OrderProblem input) throws Exception;
	
	/**
	 * 문의 데이터 수정하기
	 * @return int
	 * @throws Exception
	 */
	public int editOrderProblem(OrderProblem input) throws Exception;
	
	/**
	 * 문의 데이터 삭제하기
	 * @param OrderProblem 삭제할 학과의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteOrderProblem(OrderProblem input) throws Exception;
}
