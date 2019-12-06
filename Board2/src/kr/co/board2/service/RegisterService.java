package kr.co.board2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDAO;
import kr.co.board2.vo.BoardMemberVO;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if(req.getMethod().equals("POST")) {
	
			// 파라미터 수신
			String uid   = req.getParameter("uid");	
			String pass1 = req.getParameter("pass1");
			String name  = req.getParameter("name");	
			String nick  = req.getParameter("nick");	
			String email = req.getParameter("email");	
			String hp    = req.getParameter("hp");	
			String zip   = req.getParameter("zip");	
			String addr1 = req.getParameter("addr1");	
			String addr2 = req.getParameter("addr2");	
			String regip = req.getRemoteAddr();
	
			BoardMemberVO bmv = new BoardMemberVO();
			bmv.setUid(uid);
			bmv.setPass(pass1);
			bmv.setName(name);
			bmv.setNick(nick);
			bmv.setEmail(email);
			bmv.setHp(hp);
			bmv.setZip(zip);
			bmv.setAddr1(addr1);
			bmv.setAddr2(addr2);
			bmv.setRegip(regip);
			
			UserDAO dao = UserDAO.getInstance();
			dao.insertUser(bmv);
			
			return "redirect:/Board2/user/login.do";
		
		} else {
			
			// 목록 화면으로 이동 (절대주소를 잡으면 안됨)
			return "/user/register.jsp";		
		}
	}
}
