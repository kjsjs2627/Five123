package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class OrderStatus {
	private int order_status_no;
	private char order_status_delivery;
	private char order_status_problem;
	private int user_no;
	private int order_check_no;
}
