package kr.co.jcinema.service.memmber;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MemberDAO;
import kr.co.jcinema.vo.MemberVO;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if (req.getMethod().equals("POST")) {

			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			MemberDAO dao = MemberDAO.getInstance();
			MemberVO mv = dao.selectMember(uid, pass);
			
			if(mv != null) {
				
				// 회원정보가 있다면 세션처리를 해준다
				HttpSession session =  req.getSession();
				session.setAttribute("member", mv);
				
				return "redirect:/jcinema/";
				
			} else {
				
				// 회원정보가 없을 경우
				return "redirect:/jcinema/member/login";
			}

		} else {
			
			// 회원이 아닐 경우 - 로그인 버튼을 누르지 않은 모든 상황
			return "/member/login.jsp";

		}
	}
}