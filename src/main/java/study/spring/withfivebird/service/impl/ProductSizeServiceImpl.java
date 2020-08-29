package study.spring.withfivebird.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.ProductSize;

/** 사이즈 데이터 관리 기능을 제공하기 위한 Service 계층 */
@Slf4j
@Service // --> import org.springframework.stereotype.Service
public class ProductSizeServiceImpl {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 사이즈 데이터 상세 조회
	 * @param OrderProblem 조회할 사이즈의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public ProductSize getProductSizeItem(ProductSize input) throws Exception {
		ProductSize result = null;
		
		try {
			result = sqlSession.selectOne("ProductSizeMapper.selectOne", input);
			
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
	 * 사이즈 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<ProductSize> getProductSizeList(ProductSize input) throws Exception {
		List<ProductSize> result = null;
		
		try {
			result = sqlSession.selectList("ProductSizeMapper.selectList", input);
			
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
	 * 사이즈 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getProductSizeCount(ProductSize input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ProductSizeMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 사이즈 데이터 등록하기
	 * @return int
	 * @throws Exception
	 */
	public int addProductSize(ProductSize input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("ProductSizeMapper.insertItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 사이즈 데이터 수정하기
	 * @return int
	 * @throws Exception
	 */
	public int editProductSize(ProductSize input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("ProductSizeMapper.updateItem", input);
			
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
	 * 사이즈 데이터 삭제하기
	 * @return int
	 * @throws Exception
	 */
	public int deleteProductSize(ProductSize input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("ProductSizeMapper.deleteItem", input);
			
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
