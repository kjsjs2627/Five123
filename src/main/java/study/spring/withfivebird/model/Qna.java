package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class Qna {
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private int qna_hit;
	private String qna_reg_date;
	private String qna_edit_date;
	private int user_no;
	private String qna_reply;
}
