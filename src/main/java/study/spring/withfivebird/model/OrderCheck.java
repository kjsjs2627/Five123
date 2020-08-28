package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class OrderCheck {
	private int order_check_no;
	private String order_check_delivery;
	private String order_check_name;
	private String order_check_postcode;
	private String order_check_add1;
	private String order_check_add2;
	private String order_check_tel;
	private String order_check__email;
	private int payment_no;
	private String order_check_number;
	private String order_check_color;
	private String order_check_size;
	private int order_check_amount;
	// private int user_no; --> 조인검사용
}
