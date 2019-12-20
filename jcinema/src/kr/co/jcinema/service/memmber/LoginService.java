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
				
				// ȸ�������� �ִٸ� ����ó���� ���ش�
				HttpSession session =  req.getSession();
				session.setAttribute("member", mv);
				
				return "redirect:/jcinema/";
				
			} else {
				
				// ȸ�������� ���� ���
				return "redirect:/jcinema/member/login";
			}

		} else {
			
			// ȸ���� �ƴ� ��� - �α��� ��ư�� ������ ���� ��� ��Ȳ
			return "/member/login.jsp";

		}
	}
}