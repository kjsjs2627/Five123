package study.spring.withfivebird.model;

import lombok.Data;

/** user table Java Beans 생성 */
@Data
public class User {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_tel;
	private String user_email;
	private String user_postcode;
	private String user_addr1;
	private String user_addr2;
	private String user_out;
	private int level_no;
	private int user_point;
}
