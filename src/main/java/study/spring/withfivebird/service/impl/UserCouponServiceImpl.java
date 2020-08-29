package study.spring.withfivebird.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.UserCoupon;
import study.spring.withfivebird.service.UserCouponService;


@Slf4j
@Service
public class UserCouponServiceImpl implements UserCouponService {
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * UserCoupon 데이터 상세 조회
	 * @param UserCoupon 조회할 UserCoupon의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public UserCoupon getUserCouponItem(UserCoupon input) throws Exception {
		UserCoupon result = null;
		
		try {
			result = sqlSession.selectOne("UserCouponMapper.selectItem", input);
			
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
	 * UserCoupon 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	@Override
	public List<UserCoupon> getUserCouponList(UserCoupon input) throws Exception {
		List<UserCoupon> result = null;
		
		try {
			result = sqlSession.selectList("UserCouponMapper.selectList", input);
			
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
	 * UserCoupon 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getUserCouponCount(UserCoupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("UserCouponMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	
	/**
	 * UserCoupon 데이터 등록하기
	 * @param UserCoupon 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addUserCoupon(UserCoupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("UserCouponMapper.insertItem", input);
			
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
	 * UserCoupon 데이터 수정하기
	 * @param UserCoupon 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editUserCoupon(UserCoupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("UserCouponMapper.updateItem", input);
			
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
	 * UserCoupon 데이터 삭제하기
	 * @param UserCoupon 삭제할 UserCoupon의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteUserCoupon(UserCoupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("UserCouponMapper.deleteItem", input);
			
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

