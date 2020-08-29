package study.spring.withfivebird.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.OrderStatus;
import study.spring.withfivebird.service.OrderStatusService;

/** 문의 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service // --> import org.springframework.stereotype.Service

public class OrderStatusServiceImpl implements OrderStatusService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 주문현황 데이터 상세 조회
	 * @param OrderProblem 조회할 주문현황의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public OrderStatus getOrderStatusItem(OrderStatus input) throws Exception {
		OrderStatus result = null;
		
		try {
			result = sqlSession.selectOne("OrderStatusMapper.selectItem", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 주문현황 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<OrderStatus> getOrderStatusList(OrderStatus input) throws Exception {
		List<OrderStatus> result = null;
		
		try {
			result = sqlSession.selectList("OrderStatusMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 주문현황 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int OrderStatusCount(OrderStatus input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("OrderStatusMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 주문현황 데이터 등록하기
	 * @return int
	 * @throws Exception
	 */
	public int addOrderStatus(OrderStatus input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("OrderStatusMapper.insertItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 주문현황 데이터 수정하기
	 * @return int
	 * @throws Exception
	 */
	public int editOrderStatus(OrderStatus input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("OrderStatusMapper.updateItem", input);
			
			if (result == 0) {
				throw new NullPointerException("수정된 데이터가 없습니다.");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 주문현황 데이터 삭제하기
	 * @return int
	 * @throws Exception
	 */
	public int deleteOrderStatus(OrderStatus input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("OrderStatusMapper.deleteItem", input);
			
			if (result == 0) {
				throw new NullPointerException("삭제된 데이터가 없습니다.");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;
	}
}
