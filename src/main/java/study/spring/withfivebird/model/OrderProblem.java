package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class Order_problem {
	private int order_problem_no;
	private String order_problem_option;
	private String order_problem_content;
	private String order_check_problem_reg_date;
	private int user_no;
	private int order_check_no;
}	
