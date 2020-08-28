package study.spring.withfivebird.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.Category;
import study.spring.withfivebird.service.CategoryService;

@Slf4j
@Service
public class CategoryServiceImpl implements CategoryService{
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	/**
	 * 카테고리 데이터 상세 조회
	 * @param Category 조회할 카테고리의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Category getCategoryItem(Category input) throws Exception {
		Category result = null;
		
		try {
			result = sqlSession.selectOne("CategoryMapper.selectItem", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 카테고리 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	@Override
	public List<Category> getCategoryList(Category input) throws Exception {
		List<Category> result = null;
		
		try {
			result = sqlSession.selectList("CategoryMapper.selectList", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 카테고리 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCategoryCount(Category input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("CategoryMapper.selectCountAll", input);
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 카테고리 데이터 등록하기
	 * @param User 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addCategory(Category input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CategoryMapper.insertItem", input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}
	/**
	 * 카테고리 데이터 수정하기
	 * @param User 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editCategory(Category input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CategoryMapper.updateItem", input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
			
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}
	/**
	 * 카테고리 데이터 삭제하기? 필요한가?
	 * @param User 삭제할 유저의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteCategory(Category input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("CategoryMapper.deleteItem", input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		}catch(Exception e) {
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}
}
