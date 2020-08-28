package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class UserCoupon {
	private int user_coupon_no;
	private String user_coupon_userd;
	private int user_no;
	private int coupon_list_no;
	// private String user_name;  JOIN 검사용
}
