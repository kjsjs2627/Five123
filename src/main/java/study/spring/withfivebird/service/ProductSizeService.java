package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.ProductSize;

/** 사이즈 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface ProductSizeService {

	/**
	 * 사이즈 데이터 상세 조회
	 * @param OrderProblem 조회할 사이즈의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public ProductSize getProductSizeItem(ProductSize input) throws Exception;
	
	/**
	 * 사이즈 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<ProductSize> getProductSizeList(ProductSize input) throws Exception;
	
	/**
	 * 사이즈 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getProductSizeCount(ProductSize input) throws Exception;
	
	/**
	 * 사이즈 데이터 등록하기
	 * @return int
	 * @throws Exception
	 */
	public int addProductSize(ProductSize input) throws Exception;
	
	/**
	 * 사이즈 데이터 수정하기
	 * @return int
	 * @throws Exception
	 */
	public int editProductSize(ProductSize input) throws Exception;
	
	/**
	 * 사이즈 데이터 삭제하기
	 * @return int
	 * @throws Exception
	 */
	public int deleteProductSize(ProductSize input) throws Exception;
}
