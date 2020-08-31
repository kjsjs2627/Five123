package study.spring.withfivebird.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.Basket;
import study.spring.withfivebird.service.BasketService;

/** 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service // --> import org.springframework.stereotype.Service;
public class BasketServiceImpl implements BasketService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 장바구니 데이터 상세 조회
	 * 
	 * @param Basket 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beasn
	 * @throws Exception
	 */
	@Override
	public Basket getBasketItem(Basket input) throws Exception {
		Basket result = null;

		try {
			result = sqlSession.selectOne("BasketMapper.selectItem", input);

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
	 * 장바구니 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Basket> getBasketList(Basket input) throws Exception {
		List<Basket> result = null;

		try {
			result = sqlSession.selectList("BasketMapper.selectList", input);

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
	 * 장바구니 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */

	@Override
	public int getBasketCount(Basket input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("BasketMapper.selectCountAll", input);

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 장바구니 데이터 등록하기
	 * 
	 * @param Basket 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addBasket(Basket input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BasketMapper.insertItem", input);

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
	 * 학과 데이터 수정하기
	 * @param Basket 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editBasket(Basket input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("BasketMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=null");
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
	 * 장바구니 데이터 삭제하기
	 * @param Basket 삭제할 장바구니의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteBasket(Basket input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("BasketMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=null");
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
