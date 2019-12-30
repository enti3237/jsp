package kr.co.jcinema.service.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;

public class RemainSeatWithTotalService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String ticketMovieDate = req.getParameter("ticket_movie_date");
		String ticketTheaterNo = req.getParameter("ticket_theater_no");
		String ticketMovieNo   = req.getParameter("ticket_movie_no");
		String ticketScreenNo  = req.getParameter("ticket_screen_no");
		
		MovieDAO dao = MovieDAO.getInstance();
		List<List<Integer>> seats = dao.selectRemainSeatWithTotal(  ticketMovieDate,
																	ticketTheaterNo,
																	ticketMovieNo, 
																	ticketScreenNo);
		
		String json = new Gson().toJson(seats);
		
		return json;
	}

}
