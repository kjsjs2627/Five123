package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class Payment {
	private int payment_no;
	private int payment_total;
	private String payment_reg_date;
	private int user_no;
	private int basket_no;
}
