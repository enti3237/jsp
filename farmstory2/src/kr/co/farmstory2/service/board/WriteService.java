package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;

public class WriteService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String boardGroup = req.getParameter("group");
		String category  = req.getParameter("cate");
		
		req.setAttribute("boardGroup", boardGroup);
		req.setAttribute("category", category);
		
		return "/board/write.jsp";
	}

}
