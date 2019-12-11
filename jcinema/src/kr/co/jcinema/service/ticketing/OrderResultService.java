package kr.co.jcinema.service.ticketing;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jcinema.controller.CommonService;

public class OrderResultService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return "/ticketing/order-result.jsp";
	}

}
