package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.Product;

/** 제품 데이터 관리 기능을 제공하기 위한 Service계층. */
public interface ProductService {
	/**
	 * 제품 데이터 상세 조회
	 * @param Product 조회할 제품의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beasn
	 * @throws Exception
	 */
	public Product getProductItem(Product input) throws Exception;
	public Product getProductJoin(Product input) throws Exception;
	/** 제품 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> getProductList(Product input) throws Exception;

	/**
	 * 제품 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getProductCount(Product input) throws Exception;

	/** 제품 데이터 등록하기
	 * @param Product 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addProduct(Product input) throws Exception;

	/**
	 * 학과 데이터 수정하기
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editProduct(Product input) throws Exception;
	
	/**
	 * 제품 데이터 삭제하기
	 * @param Product 삭제할 제품의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteProduct(Product input) throws Exception;
}
