package study.spring.withfivebird.model;

import lombok.Data;

@Data
public class ProductQna {
	private int product_qna_no;
	private String product_qna_title;
	private String product_qna_content;
	private int product_qna_hit;
	private String product_qna_reg_date;
	private int product_no;
}
