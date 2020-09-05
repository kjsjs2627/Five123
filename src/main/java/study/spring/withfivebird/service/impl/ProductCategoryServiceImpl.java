package study.spring.withfivebird.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.ProductCategory;
import study.spring.withfivebird.service.ProductCategoryService;

@Slf4j
@Service
public class ProductCategoryServiceImpl implements ProductCategoryService{
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ProductCategory> getProductCategoryJoinList(ProductCategory input) throws Exception {
		List<ProductCategory> result = null;
		try {
			result = sqlSession.selectList("ProductCategoryMapper.selectJoin", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<ProductCategory> getProductCategorySale(ProductCategory input) throws Exception {
		List<ProductCategory> result = null;
		try {
			result = sqlSession.selectList("ProductCategoryMapper.selectSale", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<ProductCategory> getProductCategoryNew(ProductCategory input) throws Exception {
		List<ProductCategory> result = null;
		try {
			result = sqlSession.selectList("ProductCategoryMapper.selectNew", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<ProductCategory> getProductCategoryBest(ProductCategory input) throws Exception {
		List<ProductCategory> result = null;
		try {
			result = sqlSession.selectList("ProductCategoryMapper.selectBest", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	

	@Override
	public List<ProductCategory> getProductCategoryList(ProductCategory input) throws Exception {
		List<ProductCategory> result = null;
		try {
			result = sqlSession.selectList("ProductCategoryMapper.selectList", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int getProductCategoryCount(ProductCategory input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ProductCategoryMapper.selectCountAll", input);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getProductCategoryCountNew(ProductCategory input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ProductCategoryMapper.selectCountNew", input);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getProductCategoryCountBest(ProductCategory input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ProductCategoryMapper.selectCountBest", input);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getProductCategoryCountSale(ProductCategory input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ProductCategoryMapper.selectCountSale", input);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

}
