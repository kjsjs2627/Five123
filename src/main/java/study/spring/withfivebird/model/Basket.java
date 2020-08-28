package study.spring.withfivebird.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Basket {
	private int basket_no;
	private int product_no;
	private int user_no;
	private String basket_color;
	private int basket_num;
	private String basket_size;
}
