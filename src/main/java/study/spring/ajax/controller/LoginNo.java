package study.spring.ajax.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;




@WebServlet("/api/login_no.do")
public class LoginNo extends HttpServlet {
	private static final long serialVersionUID = 3307391248015159402L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json"); 
		
		String userNum = request.getParameter("user_num");
		String userEmail = request.getParameter("user_email");
		
		if (userNum == null) { userNum = ""; }
		if (userEmail == null) { userEmail = ""; }

		String result = "FAIL";
		if (userNum.equals("A0000") && userEmail.equals("kjsjs2627@gmail.com")) {
			result = "OK";
		} else if (userNum.equals("A0001") && userEmail.equals("fouryou504@gmail.com")) {
			result = "OK";
		} else if (userNum.equals("A0002") && userEmail.equals("dbgksdnf05@gmail.com")) {
			result = "OK";
		} else if (userNum.equals("A0003") && userEmail.equals("s00been1313@gmail.com")) {
			result = "OK";
		} else if (userNum.equals("A0004") && userEmail.equals("j.purplerose@gmail.com")) {
			result = "OK";
		} 
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		response.getWriter().print(json);
	}
}
