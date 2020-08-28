package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class Notice {
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private int notice_hit;
	private String notice_reg_date;
	private int user_no;
	// private String user_name; --> join 검사용
}
