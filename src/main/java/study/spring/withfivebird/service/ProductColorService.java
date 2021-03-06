package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.ProductColor;

public interface ProductColorService {
	/**
	 * 상품색상 데이터 상세 조회
	 * @param ProductColor 조회할 상품색상의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public ProductColor getProductColorItem(ProductColor input) throws Exception;
	
	/**
	 * 상품색상 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션 
	 * @throws Exception
	 */
	public List<ProductColor> getProductColorList(ProductColor input) throws Exception;
	
	/**
	 * 상품색상 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getProductColorCount(ProductColor input) throws Exception;
	
	/**
	 * 상품색상 데이터 등록하기
	 * @param ProductColor 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addProductColor(ProductColor input) throws Exception;
	
	/**
	 * 상품색상 데이터 수정하기
	 * @param ProductColor 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editProductColor(ProductColor input) throws Exception;
	
	/**
	 * 상품색상 데이터 삭제하기? 필요한가?
	 * @param ProductColor 삭제할 상품색상의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteProductColor(ProductColor input) throws Exception;
}
