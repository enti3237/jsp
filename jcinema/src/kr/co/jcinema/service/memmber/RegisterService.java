package kr.co.jcinema.service.memmber;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MemberDAO;
import kr.co.jcinema.vo.MemberVO;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if(req.getMethod().equals("POST")) {
			// POST 요청 (회원가입)
						
			MemberVO mv = new MemberVO();
			mv.setUser_id(req.getParameter("uid"));
			mv.setUser_pass(req.getParameter("pw1"));
			mv.setUser_name(req.getParameter("name"));
			mv.setUser_email(req.getParameter("email"));
			mv.setUser_tel(req.getParameter("tel"));
			mv.setUser_hp(req.getParameter("hp"));
			mv.setUser_addr_type(req.getParameter("addrT"));
			mv.setUser_zip(req.getParameter("zip"));
			mv.setUser_addr_main(req.getParameter("addr1"));
			mv.setUser_addr_detail(req.getParameter("addr2"));
			mv.setUser_regip(req.getRemoteAddr());

			MemberDAO dao = MemberDAO.getInstance();
			dao.insertMember(mv);
			
			JSONObject json = new JSONObject();
			json.put("result", 1);
			
			return json.toString();
//			return "{result:1}";

		} else {
			
			// GET 요청 (로그인)
		}
				
				
		return "/member/register.jsp";

	}
}