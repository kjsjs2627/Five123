package study.spring.withfivebird.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Product {
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
	
}
