package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class OrderProblem {
	private int order_problem_no;
	private String order_problem_option;
	private String order_problem_content;
	private String Order_problem_reg_date;
	private int user_no;
	private int order_check_no;
}	
