package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.vo.UserVO;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if (req.getMethod().equals("POST")) {

			// 파라미터 수신
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			// UserDAO에 존재하는 메소드를 불러온다
			UserDAO dao = UserDAO.getInstance();
			UserVO uv = dao.selectUser(uid, pass);
			
			if(uv != null) {
				
				// 회원정보가 있다면 세션처리를 해준다
				HttpSession session =  req.getSession();
				session.setAttribute("user", uv);
				
				// 리스트로 이동
				return "redirect:/farmstory2/index.do";
				
			} else {
				
				// 회원정보가 없을 경우
				return "redirect:/farmstory2/user/login.do";

			}

		} else {

			// 로그인 버튼을 누르지 않은 모든 상황
			return "/user/login.jsp";

		}
	}
}