package study.spring.withfivebird.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.OrderProblem;
import study.spring.withfivebird.service.OrderProblemService;

/** 문의 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service // --> import org.springframework.stereotype.Service
public class OrderProblemServiceImpl implements OrderProblemService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 문의 데이터 상세 조회
	 * 
	 * @param OrderProblem 조회할 문의의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public OrderProblem getOrderProblemItem(OrderProblem input) throws Exception {
		OrderProblem result = null;

		try {
			result = sqlSession.selectOne("OrderProblemMapper.selectItem", input);

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
	 * 문의 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<OrderProblem> getOrderProblemList(OrderProblem input) throws Exception {
		List<OrderProblem> result = null;

		try {
			result = sqlSession.selectList("OrderProblemMapper.selectList", input);

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
	 * 문의 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getOrderProblemCount(OrderProblem input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("OrderProblemMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 문의 데이터 등록하기
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addOrderProblem(OrderProblem input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("OrderProblemMapper.insertItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
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
	 * 문의 데이터 수정하기
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editOrderProblem(OrderProblem input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("OrderProblem.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
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
	 * 문의 데이터 삭제하기
	 * 
	 * @param OrderProblem 삭제할 학과의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteOrderProblem(OrderProblem input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("OrderProblemMapper.deleteItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
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
