package study.spring.withfivebird.controllers;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.withfivebird.helper.PageData;
import study.spring.withfivebird.model.Notice;
import study.spring.withfivebird.model.Qna;
import study.spring.withfivebird.service.NoticeService;
import study.spring.withfivebird.service.QnaService;

@Controller
public class ArticleController {
	
    /** Service 패턴 구현체 주입 */
    @Autowired QnaService qnaService;
    
    /** Service 패턴 구현체 주입 */
    @Autowired NoticeService noticeService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
	
	@RequestMapping(value = "/main_article.do", method = RequestMethod.GET)
	public String main_article(Model model) {
				
		return "main_article";
	}
	
	/** 목록 페이지 */
    @RequestMapping(value = "/main_noticeList.do", method = RequestMethod.GET)
    public String list(Model model, HttpServletResponse response,
            // 검색어
            @RequestParam(value="keyword", required=false) String keyword,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) {
        
        int totalCount = 0;         // 전체 게시글 수
        int listCount  = 5;         // 한 페이지당 표시할 목록 수
        int pageCount  = 5;         // 한 그룹당 표시할 페이지 번호 수
        
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Notice input = new Notice();
        input.setNotice_title(keyword);
        input.setNotice_content(keyword);
 
        
        List<Notice> output = null;        // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = noticeService.getNoticeCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Notice.setOffset(pageData.getOffset());
            Notice.setListCount(pageData.getListCount());
            
            // 데이터 조회하기
            output = noticeService.getNoticeList(input);
        } catch (Exception e) { e.printStackTrace(); }

        // View 처리
        model.addAttribute("output", output);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageData", pageData);
        return "main_noticeList";
    }

	
    /** 상세 페이지 */
    @RequestMapping(value = "/main_noticeDetails.do", method = RequestMethod.GET)
    public String Noticedetail(Model model, HttpServletResponse response,
            @RequestParam(value="notice_no") int notice_no) {
        
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
    	Notice input = new Notice();
        input.setNotice_no(notice_no);

        // 조회결과를 저장할 객체 선언
        Notice output = null;

        try {
            // 데이터 조회
            output = noticeService.getNoticeItem(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // View 처리
        model.addAttribute("output", output);
        return "main_noticeDetails";
    }
	
	 /** 상세 페이지 */
    @RequestMapping(value = "/main_qnaDetails.do", method = RequestMethod.GET)
    public ModelAndView detail(Model model, 
            @RequestParam(value="qna_no", defaultValue="0") int qna_no) {
        
    	/** 1) 유효성 검사 */
        // 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (qna_no == 0) {
            //return null;
        }
    	
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Qna input = new Qna();
        input.setQna_no(qna_no);

        // 조회결과를 저장할 객체 선언
        Qna output = null;

        try {
            // 데이터 조회
            output = qnaService.getQnaItem(input);
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        // View 처리
        model.addAttribute("output", output);
        return new ModelAndView("main_qnaDetails");
    }
	
	 /** 목록 페이지 */
    @RequestMapping(value = "/main_qnaList.do", method = RequestMethod.GET)
    public String Noticelist(Model model, HttpServletResponse response,
            // 검색어
            @RequestParam(value="keyword", required=false) String keyword,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) {
        
        int totalCount = 0;         // 전체 게시글 수
        int listCount  = 5;         // 한 페이지당 표시할 목록 수
        int pageCount  = 5;         // 한 그룹당 표시할 페이지 번호 수
        
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Qna input = new Qna();
        input.setQna_title(keyword);
        input.setQna_content(keyword);
 
        
        List<Qna> output = null;        // 조회결과가 저장될 객체
        PageData pageData = null;       // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = qnaService.getQnaCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Qna.setOffset(pageData.getOffset());
            Qna.setListCount(pageData.getListCount());
            
            // 데이터 조회하기
            output = qnaService.getQnaList(input);
        } catch (Exception e) { e.printStackTrace(); }

        // View 처리
        model.addAttribute("output", output);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageData", pageData);
        return "main_qnaList";
    }	
	
    /** 수정 폼 페이지 */
	@RequestMapping(value="/main_myQnaUpdate.do", method=RequestMethod.GET)
	public ModelAndView edit(Model model,
			@RequestParam(value="qna_no", defaultValue="0") int qna_no) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (qna_no == 0) {
			//return webHelper.redirect(null, "번호가 없습니다.");
		}
		
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Qna input = new Qna();
		input.setQna_no(qna_no);
		
		// qna 조회결과를 저장할 객체 선언
		Qna output = null;
		
		
		try {
			// qna 기본 정보 조회
			output = qnaService.getQnaItem(input);

		} catch (Exception e) {
			e.printStackTrace();
        }
		
 		/** 3) View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("main_myQnaUpdate");
	}

    /** 수정 폼에 대한 action 페이지 */
    @RequestMapping(value = "/main_myQnaUpdate_ok.do", method = RequestMethod.POST)
    public ModelAndView editOk(Model model,
    		@RequestParam(value="qna_no", defaultValue="0") int qna_no,
    		@RequestParam(value="qna_title", required=false) String qna_title,
			@RequestParam(value="qna_content", required=false) String qna_content,
			@RequestParam(value="qna_reg_date", required=false) String date,
			@RequestParam(value="qna_hit", defaultValue="0") int qna_hit,
			@RequestParam(value="qna_edit_date", defaultValue="0") String qna_edit_date ) {
        
        // 수정할 값들을 Beans에 담는다.
        Qna input = new Qna();
        input.setQna_no(qna_no);
        input.setQna_title(qna_title);
        input.setQna_content(qna_content);
        input.setQna_reg_date(date);
        input.setQna_edit_date(qna_edit_date);
        input.setQna_hit(qna_hit);

        try {
			// 데이터 수정
			qnaService.editQna(input);
		} catch (Exception e) {
			e.printStackTrace();
        }
		
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 수정 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/main_qnaDetails.do?qna_no=" + input.getQna_no();
		return new ModelAndView("main_myQnaUpdate");
	}
	
	/** 작성 폼 페이지 */	
    @RequestMapping(value = "/main_myQnaWrite.do", method = RequestMethod.GET)
    public ModelAndView add(Model model) {	
    	
    	/** 학과 목록 조회하기 */
        // 조회결과를 저장할 객체 선언
        List<Qna> output = null;

        try {
            // 데이터 조회 --> 검색조건 없이 모든 학과 조회
            output = qnaService.getQnaList(null);
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        // View에 추가
        model.addAttribute("output", output);
        
        return new ModelAndView("main_myQnaWrite");
    }
    
    /** 작성 폼에 대한 action 페이지 */
    @RequestMapping(value="/main_myQnaWrite_ok.do", method=RequestMethod.POST)
	public ModelAndView add_ok(Model model,
			@RequestParam(value="qna_title", required=false) String qna_title,
			@RequestParam(value="user_name", required=false) String user_name,
			@RequestParam(value="qna_content", required=false) String qna_content,
			@RequestParam(value="qna_hit", defaultValue="0") int qna_hit,
			@RequestParam(value="qna_reg_date", required=false) String date,
			@RequestParam(value="qna_edit_date", defaultValue="0") String qna_edit_date ) {
        
        // 저장할 값들을 Beans에 담는다.
        Qna input = new Qna();
        if (date == null) {
        	Calendar c = Calendar.getInstance();
        	c.add(Calendar.DAY_OF_MONTH, -1);
        	
        	date = String.format("%04d-%02d-%02d", 
        			c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1, c.get(Calendar.DAY_OF_MONTH));
        }
        
        if (qna_edit_date == null) {
        	Calendar c = Calendar.getInstance();
        	c.add(Calendar.DAY_OF_MONTH, -1);
        	
        	qna_edit_date = String.format("%04d-%02d-%02d", 
        			c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1, c.get(Calendar.DAY_OF_MONTH));
        }
        
        input.setQna_title(qna_title);
        input.setQna_content(qna_content);
        input.setQna_reg_date(date);
        input.setQna_edit_date(qna_edit_date);
        input.setQna_hit(qna_hit);
        input.setUser_name(user_name);
        
        try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			qnaService.addQna(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/main_qnaDetails.do?qna_no=" + input.getQna_no();
		return new ModelAndView("main_qnaDetails");
	}
    
    /** 삭제 처리 구현 */
    @RequestMapping(value = "/delete_ok.do", method = RequestMethod.GET)
    public ModelAndView deleteOk(Model model,
            @RequestParam(value="qna_no", defaultValue="0") int qna_no) {
        // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
        Qna input = new Qna();
        input.setQna_no(qna_no);

        try {
            // 데이터 삭제
            qnaService.deleteQna(input);
        } catch (Exception e) { 
        	e.printStackTrace();
        }
        
        /** 3) 페이지 이동 */
        // 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
        return new ModelAndView("main_qnaList");
    }
    

}