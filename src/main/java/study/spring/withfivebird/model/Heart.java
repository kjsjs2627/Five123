package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class Heart {
	private int heart_no;
	private int user_no;
	private int product_no;
	// private String user_name; --> join 검사용
}
