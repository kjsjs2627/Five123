package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.Basket;

/** 장바구니 데이터 관리 기능을 제공하기 위한 Service계층. */
public interface BasketService {
	/**
	 * 장바구니 데이터 상세 조회
	 * @param Basket 조회할 장바구니의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beasn
	 * @throws Exception
	 */
	public Basket getBasketItem(Basket input) throws Exception;
	
	/** 장바구니 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Basket> getBasketList(Basket input) throws Exception;

	/**
	 * 장바구니 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getBasketCount(Basket input) throws Exception;

	/** 장바구니 데이터 등록하기
	 * @param Basket 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addBasket(Basket input) throws Exception;

	/**
	 * 학과 데이터 수정하기
	 * @param Basket 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editBasket(Basket input) throws Exception;
	
	/**
	 * 장바구니 데이터 삭제하기
	 * @param Basket 삭제할 장바구니의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteBasket(Basket input) throws Exception;
}
