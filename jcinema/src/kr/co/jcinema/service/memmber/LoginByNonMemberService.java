package kr.co.jcinema.service.memmber;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MemberDAO;
import kr.co.jcinema.vo.MemberVO;

public class LoginByNonMemberService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String name  = req.getParameter("name");
		String hp    = req.getParameter("hp");
		String birth = req.getParameter("birth");
		String pass  = req.getParameter("pass1");
		String regip = req.getRemoteAddr();
		
		MemberVO mv = new MemberVO();
		mv.setUser_id(hp);
		mv.setUser_pass(pass);
		mv.setUser_name(name);
		mv.setUser_tel(birth);
		mv.setUser_hp(hp);
		mv.setUser_grade(1);
		mv.setUser_regip(regip);		
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.selectCheckUid(hp);
		
		if(result == 1) {
			dao.updateMember(mv);
			
		} else {
			dao.insertMember(mv);
		}
		
		// 세션저장
		
		HttpSession session = req.getSession();
		session.setAttribute("member", mv);
		
		return "redirect:/jcinema/";

	}
}
