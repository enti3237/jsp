package kr.co.jcinema.admin.service.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.admin.dao.AdminApiDAO;
import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.vo.MovieVo;

public class MoviesService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String title = req.getParameter("title");
		
		AdminApiDAO dao = AdminApiDAO.getInstance();
		List<MovieVo> movies = dao.selectMovies(title);
		
		String json = new Gson().toJson(movies);
		
		return json;
		
	}

}
