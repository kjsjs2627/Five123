package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.ProductReview;

/** 제품후기 데이터 관리 기능을 제공하기 위한 Service계층. */
public interface ProductReviewService {
	/**
	 * 제품후기 데이터 상세 조회
	 * @param ProductReview 조회할 제품후기의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beasn
	 * @throws Exception
	 */
	public ProductReview getProductReviewItem(ProductReview input) throws Exception;
	
	/** 제품후기 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<ProductReview> getProductReviewList(ProductReview input) throws Exception;

	/**
	 * 제품후기 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getProductReviewCount(ProductReview input) throws Exception;

	/** 제품후기 데이터 등록하기
	 * @param ProductReview 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addProductReview(ProductReview input) throws Exception;

	/**
	 * 학과 데이터 수정하기
	 * @param ProductReview 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editProductReview(ProductReview input) throws Exception;
	
	/**
	 * 제품후기 데이터 삭제하기
	 * @param ProductReview 삭제할 제품후기의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteProductReview(ProductReview input) throws Exception;
}
