package study.spring.ajax.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/api/search.do")
public class Search extends HttpServlet {
	private static final long serialVersionUID = -4359820221573553560L;

	@Override
		public void doPost(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			
			String userName = request.getParameter("name_search");
			String userEmail = request.getParameter("email_search");
			String userId = request.getParameter("id_search");
			String result = "Error";
			String value ="";
			String[][] idList= { // 이름, 이메일, 아이디, 비밀번호
					{"김종선", "kjsjs2627@gmail.com","bellline","123qwe!@#"},
					{"안이제", "fouryou504@gmail.com","notnow","jsp123!@#"},
					{"유한울","dbgksdnf05@gmail.com","hanul","mysql!@#"},
					{"윤수빈","s00been1313@gmail.com","subin","linux123!@#"},
					{"야옹이","j.purplerose@gmail.com","purplerose","EnaEoadl!@#"}
			};
			for(int i=0; i<idList.length; i++) {
				// 가입된 아이디와 일치하는게 있다면 실패처리 
				if(idList[i][0].equals(userName) && idList[i][1].equals(userEmail)&& idList[i][2].equals(userId)) {
					result="Ok";
					value=idList[i][3];
					break;
				}
				if(idList[i][0].equals(userName) && idList[i][1].equals(userEmail)) {
					result="Ok";
					value=idList[i][2];
					break;
				}  
			}
			
			JSONObject json = new JSONObject();
			json.put("result", result);
			json.put("value", value);
			response.getWriter().print(json);
			
		
	}
}