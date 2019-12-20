package kr.co.jcinema.admin.service.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.admin.dao.AdminApiDAO;
import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.controller.CommonService;

public class MovieScheduleService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String theater_no = req.getParameter("theater_no");
		String screen_no = req.getParameter("screen_no");
		String schedule_date = req.getParameter("schedule_date");
		String round_view = req.getParameter("round_view");
		
		AdminApiDAO dao = AdminApiDAO.getInstance();
		MovieScheduleVO movie = dao.selectMovieSchedule(theater_no, screen_no, schedule_date, round_view);
		
		String json = new Gson().toJson(movie);
		
		return json;
		
	}

}
