package study.spring.withfivebird.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.withfivebird.model.User;
import study.spring.withfivebird.service.UserService;

@Controller
public class JoinOkController {
	/** Service 패턴 구현체 주입 */
	@Autowired
	UserService userService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/info_joinC.do", method = RequestMethod.GET)
	public String main_productDetails() {
		return "info_joinC";
	}
	
	@RequestMapping(value = "/info_joinOk.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void main_productDetails(Model model, HttpServletResponse response,
			@RequestParam(value="user_id") String user_id,
			@RequestParam(value="user_pw") String user_pw,
			@RequestParam(value="user_name") String user_name,
			@RequestParam(value="user_tel")String user_tel,
			@RequestParam(value="user_email")String user_email,
			@RequestParam(value="user_postcode")String user_postcode,
			@RequestParam(value="user_addr1")String user_addr1,
			@RequestParam(value="user_addr2")String user_addr2) {
		
		String user_out = "N";
		int level_no = 4;
		int user_point = 0;
		// 저장할 값들을 Beans에 담는다. 
		User input = new User();
		input.setUser_id(user_id);
		input.setUser_pw(user_pw);
		input.setUser_name(user_name);
		input.setUser_tel(user_tel);
		input.setUser_email(user_email);
		input.setUser_postcode(user_postcode);
		input.setUser_addr1(user_addr1);
		input.setUser_addr2(user_addr2);
		input.setUser_out(user_out);
		input.setLevel_no(level_no);
		input.setUser_point(user_point);
		
		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 pk값 저장된다.
			userService.addUser(input);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		//model.addAttribute("index", index);

	}
}