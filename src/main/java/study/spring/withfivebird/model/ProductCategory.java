package study.spring.withfivebird.model;

import lombok.Data;
/** Join문 구조에 맞춘 Java Beans 생성 */
@Data
public class ProductCategory {
	private int product_no;
	private String product_name;
	private String product_content;
	private int product_price;
	private String product_best;
	private String product_new;
	private String product_img;
	private int product_sale;
	private int category_no;
	private int product_size_no1;
	private int product_size_no2;
	private int product_size_no3;
	private int product_color_no1;
	private int product_color_no2;
	private int product_color_no3;
	private String product_detail_img1;
	private String product_detail_img2;
	private String product_detail_img3;
	private String product_detail_img4;
	private String product_detail_content;
	private String category_name;
	
	/** 페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static) */
	private static int offset;     // LIMIT 절에서 사용할 검색 시작 위치
	private static int listCount;  // LIMIT 절에서 사용할 검색할 데이터 수
	
	public static int getOffset() {
		return offset;
	}
	
	public static void setOffset(int offset) {
		ProductCategory.offset = offset;
	}
	
	public static int getListCount() {
		return listCount;
	}
	
	public static void setListCount(int listCount) {
		ProductCategory.listCount = listCount;
	}
}
