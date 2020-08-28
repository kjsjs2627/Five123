package study.spring.withfivebird.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Product_review {
	private int product_review_no;
	private String product_review_title;
	private String product_review_content;
	private int product_review_hit;
	private String product_review_reg_date;
	private int order_check_no; 
	private int user_no;
}
