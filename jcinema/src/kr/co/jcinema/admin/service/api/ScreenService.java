package kr.co.jcinema.admin.service.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.admin.dao.AdminApiDAO;
import kr.co.jcinema.admin.vo.ScreenVO;
import kr.co.jcinema.controller.CommonService;

public class ScreenService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String theater_no = req.getParameter("theater_no");
		
		AdminApiDAO dao = AdminApiDAO.getInstance();
		List<ScreenVO> screens = dao.selectScreen(theater_no);
		
		String json = new Gson().toJson(screens);
		
		return json;
	}
	
	

}
