package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommonService;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		// 요청이 post일 경우(submit을 누르는 상황) - get 일 경우(그 외 전부-가 뭐지??)
		if(req.getMethod().equals("POST")) {
			
			// UTF 변환을 하지 않으면 한글을 받지 못한다 - setCharacterEncoding("UTF-8")를 필터링하기
			
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");

			req.setAttribute("uid", uid);
			req.setAttribute("pass", pass);
			
			return "/loginResult.jsp";
			
		} else {
			return "/login.jsp";		
		}
		
	}

}
