package kr.co.jcinema.service.memmber;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jcinema.controller.CommonService;

public class MyCinemaService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return "/member/my-cinema.jsp";
	}

}
