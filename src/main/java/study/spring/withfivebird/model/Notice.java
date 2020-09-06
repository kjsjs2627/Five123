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
	private String user_name; 
	
	// 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;
    private static int listCount;

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
        Notice.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
    	Notice.listCount = listCount;
    }
}
