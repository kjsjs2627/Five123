package study.spring.withfivebird.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.CouponList;
import study.spring.withfivebird.service.CouponListService;

@Slf4j
@Service
public class CouponListServiceImpl implements CouponListService{
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * CouponList 데이터 상세 조회
	 * @param CouponList 조회할 CouponList의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public CouponList getCouponListItem(CouponList input) throws Exception {
		CouponList result = null;
		
		try {
			result = sqlSession.selectOne("CouponListMapper.selectItem", input);
			
			if(result == null) {
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
	 * CouponList 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	@Override
	public List<CouponList> getCouponListList(CouponList input) throws Exception {
		List<CouponList> result = null;
		
		try {
			result = sqlSession.selectList("CouponListMapper.selectList", input);
			
			if(result == null) {
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
	 * CouponList 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCouponListCount(CouponList input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("CouponListMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	
	/**
	 * CouponList 데이터 등록하기
	 * @param CouponList 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addCouponList(CouponList input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CouponListMapper.insertItem", input);
			
			if(result == 0) {
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
	 * CouponList 데이터 수정하기
	 * @param CouponList 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editCouponList(CouponList input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CouponListMapper.updateItem", input);
			
			if(result == 0) {
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
	 * CouponList 데이터 삭제하기
	 * @param CouponList 삭제할CouponList의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteCouponList(CouponList input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("CouponListMapper.deleteItem", input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}
}

