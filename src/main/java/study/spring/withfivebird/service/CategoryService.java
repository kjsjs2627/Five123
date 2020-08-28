package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.Category;

public interface CategoryService {
	/**
	 * 카테고리 데이터 상세 조회
	 * @param Category 조회할 카테고리의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Category getCategoryItem(Category input) throws Exception;
	
	/**
	 * 카테고리 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	public List<Category> getCategoryList(Category input) throws Exception;
	
	/**
	 * 카테고리 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getCategoryCount(Category input) throws Exception;
	
	/**
	 * 카테고리 데이터 등록하기
	 * @param Category 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addCategory(Category input) throws Exception;
	
	/**
	 * 카테고리 데이터 수정하기
	 * @param Category 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editCategory(Category input) throws Exception;
	
	/**
	 * 카테고리 데이터 삭제하기? 필요한가?
	 * @param Category 삭제할 카테고리의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteCategory(Category input) throws Exception;
}	
