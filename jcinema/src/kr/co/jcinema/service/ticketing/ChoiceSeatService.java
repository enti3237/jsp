package kr.co.jcinema.service.ticketing;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;
import kr.co.jcinema.vo.MovieSchduleVO;
import kr.co.jcinema.vo.MovieVO;
import kr.co.jcinema.vo.SeatVO;

public class ChoiceSeatService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String theaterNo = req.getParameter("theater_no");
		String screenNo  = req.getParameter("screen_no");
		String movieDate = req.getParameter("movie_date");
		String movieNo   = req.getParameter("movie_no");
		String roundView = req.getParameter("round_view");
		
		MovieDAO dao = MovieDAO.getInstance();
		
//		List<SeatVO> seatListTotal = dao.selectSeatTotalByRow(theaterNo, screenNo);
//		List<SeatVO> seatListTotalColumn = dao.selectSeatTotalByColumn(theaterNo, screenNo);

		MovieVO mv = dao.selectMovie(movieNo);
		MovieSchduleVO msv = dao.selectMovieScheduleWithTheater(theaterNo, screenNo, movieDate, movieNo, roundView);
		
		List<List<SeatVO>> seatList = dao.selectSeat(theaterNo, screenNo, movieDate, movieNo, roundView);
		
		// 뷰에서 확인하기 위해 리퀘스트 객체 "seatList"에 지정함
		req.setAttribute("seatList", seatList);
		
		// row 값 출력용으로 받아오기 (차후 인덱스로 출력한다)
		char row[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', };
		req.setAttribute("seatRow", row);
		
		// 영화데이터 받아오기
		req.setAttribute("mInfo", mv);
		req.setAttribute("mSchedule", msv);

		// 이하는 row와 column을 개별지정했던 흔적
//		req.setAttribute("seatListTotal", seatListTotal);
//		req.setAttribute("seatListTotalColumn", seatListTotalColumn);

		// json 출력테스트
//		String json = new Gson().toJson(seatList);
//		return json;
		
		return "/ticketing/choice-seat.jsp";
		
	}

}
