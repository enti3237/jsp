package kr.co.jcinema.service.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;
import kr.co.jcinema.vo.MovieVO;

public class MoviesService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String theater_no    = req.getParameter("theater_no");
		String schedule_date = req.getParameter("schedule_date");

		MovieDAO dao = MovieDAO.getInstance();
		List<MovieVO> movies = dao.selectMovies(theater_no, schedule_date);
		
		String json = new Gson().toJson(movies);
		
		return json;
	}

}
