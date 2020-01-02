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
		
		// �信�� Ȯ���ϱ� ���� ������Ʈ ��ü "seatList"�� ������
		req.setAttribute("seatList", seatList);
		
		// row �� ��¿����� �޾ƿ��� (���� �ε����� ����Ѵ�)
		char row[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', };
		req.setAttribute("seatRow", row);
		
		// ��ȭ������ �޾ƿ���
		req.setAttribute("mInfo", mv);
		req.setAttribute("mSchedule", msv);

		// ���ϴ� row�� column�� ���������ߴ� ����
//		req.setAttribute("seatListTotal", seatListTotal);
//		req.setAttribute("seatListTotalColumn", seatListTotalColumn);

		// json ����׽�Ʈ
//		String json = new Gson().toJson(seatList);
//		return json;
		
		return "/ticketing/choice-seat.jsp";
		
	}

}
