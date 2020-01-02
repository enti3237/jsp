package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.fabric.xmlrpc.base.Array;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.vo.MovieSchduleVO;
import kr.co.jcinema.vo.MovieVO;
import kr.co.jcinema.vo.SeatVO;

public class MovieDAO {

	private static MovieDAO instance = new MovieDAO();
	
	public static MovieDAO getInstance() {
		return instance;
	}
	
	private MovieDAO() {}
	
	
	public void selectMovies() throws Exception {}
	
	public List<MovieVO> selectMovies(String theater_no, String schedule_date) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIES_BY_THEATER);
		psmt.setString(1, theater_no);
		psmt.setString(2, schedule_date);
		
		ResultSet rs = psmt.executeQuery();
		
		List<MovieVO> movies = new ArrayList<MovieVO>();
		
		
		while(rs.next()) {
			MovieVO vo = new MovieVO();
			vo.setMovie_no(rs.getInt(3));
			vo.setMovie_title(rs.getString(9));
			vo.setMovie_grade(rs.getString(10));
			
			movies.add(vo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movies;
	}
	
	public MovieVO selectMovie(String movie_no) throws Exception {
		Connection conn = DBConfig.getConnection();

		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIE);
		psmt.setString(1, movie_no);
		
		ResultSet rs = psmt.executeQuery();
		
		MovieVO mv = null;
		
		if(rs.next()) {
			
			mv = new MovieVO();
			
			mv.setMovie_no(rs.getInt(1));
			mv.setMovie_title(rs.getString(2));
			mv.setMovie_grade(rs.getString(3));
			mv.setMovie_company(rs.getString(4));
			mv.setMovie_score(rs.getDouble(5));
			mv.setMovie_ticket_rate(rs.getDouble(6));
			mv.setMovie_release_date(rs.getString(7));
			mv.setMovie_genre(rs.getString(8));
			mv.setMovie_country(rs.getString(9));
			mv.setMovie_running_time(rs.getInt(10));
			mv.setMovie_homepage(rs.getString(11));
			mv.setMovie_poster(rs.getString(12));
			mv.setMovie_desc(rs.getString(13));
			mv.setMovie_director(rs.getString(14));
			mv.setMovie_actor(rs.getString(15));
			
		}
		
		return mv;

	}
	
	public List<List<MovieScheduleVO>> selectMovieRoundView(String schedule_date, String theater_no, String movie_no) throws Exception {
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIES_ROUND_VIEW);
		psmt.setString(1, schedule_date);
		psmt.setString(2, theater_no);
		psmt.setString(3, movie_no);
		
		ResultSet rs = psmt.executeQuery();
		
		
		
		List<List<MovieScheduleVO>> movieSchedules = new ArrayList<>();
		List<MovieScheduleVO> movieSchedule = null;
		
		while(rs.next()) {
			
			
			if(rs.getInt(7) == 1) {
				
				if(movieSchedule != null) {
					movieSchedules.add(movieSchedule);
				}
				movieSchedule = new ArrayList<>();
				
			}
			
			MovieScheduleVO msv = new MovieScheduleVO();
			
			msv.setSchedule_theater_no(rs.getString(1));
			msv.setSchedule_screen_no(rs.getString(2));
			msv.setSchedule_movie_no(rs.getString(3));
			msv.setSchedule_date(rs.getString(4));
			msv.setSchedule_start_time(rs.getString(5));
			msv.setSchedule_end_time(rs.getString(6));
			msv.setSchedule_round_view(rs.getString(7));
			
			movieSchedule.add(msv);
			
		}
		
		// 마지막 상영관의 영화 상영표 추가하기
		movieSchedules.add(movieSchedule);
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movieSchedules;
	}
	
	public void insertMovie() throws Exception {}
	public void updateMovie() throws Exception {}
	public void deleteMovie() throws Exception {}
	
	public List<MovieVO> selectPosters() throws Exception {
		
		Connection conn = DBConfig.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs= stmt.executeQuery(SQL.SELECT_POSTERS);
		
		List<MovieVO> movies = new ArrayList<>();
		
		while(rs.next()) {
			
			MovieVO mvo = new MovieVO();
			mvo.setMovie_no(rs.getInt(1));
			mvo.setMovie_title(rs.getString(2));
			mvo.setMovie_poster(rs.getString(3));
						
			movies.add(mvo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return movies;
		
	}

	public List<List<Integer>> selectRemainSeatWithTotal(	String ticketMovieDate,
															String ticketTheaterNo,
															String ticketMovieNo,
															String ticketScreenNo ) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_REMAIN_SEAT_WITH_TOTAL);
		psmt.setString(1, ticketMovieDate);
		psmt.setString(2, ticketTheaterNo);
		psmt.setString(3, ticketMovieNo);
		psmt.setString(4, ticketScreenNo);
		
		ResultSet rs = psmt.executeQuery();
		
		List<List<Integer>> seats = new ArrayList<>();
		
		while(rs.next()) {
			List<Integer> seat = new ArrayList<>();
			
			seat.add(rs.getInt(1));
			seat.add(rs.getInt(2));
			
			seats.add(seat);
		}
		
		
		rs.close();
		psmt.close();
		conn.close();
		
		return seats;
	}
	
	public List<List<SeatVO>> selectSeat( String theaterNo, 
							String screenNo, 
							String movieDate, 
							String movieNo, 
							String roundView) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_SEAT);
		psmt.setString(1, theaterNo);
		psmt.setString(2, screenNo);
		psmt.setString(3, screenNo);
		psmt.setString(4, movieNo);
		psmt.setString(5, movieDate);
		psmt.setString(6, roundView);
		
		ResultSet rs = psmt.executeQuery();
		
		List<List<SeatVO>> list1 = new ArrayList<>();
//		List<SeatVO> list2 = new ArrayList<>();
		List<SeatVO> list2 = null;
		
		while(rs.next()) {
			
			// 원래라면 seat_row 값이 바뀔 때를 상정하고 만드는 게 좋을듯
			// column 값이 1이 될 때 새 배열 list2을 만들고 그 값(10줄)을 list1에 넣는다.
			// list2가 비어있을 때는 list1에 넣는 행동을 하지 않는다 - 제일 처음 list2을 생성했을 때 한정
			if(rs.getInt(4) == 1) {
			
				if(list2 != null) {

					list1.add(list2);

				}
				
				list2 = new ArrayList<>();
				
			}
			
			SeatVO sv = new SeatVO();
			
			sv.setSeat_theater_no(rs.getString(1));
			sv.setSeat_screen_no(rs.getString(2));
			sv.setSeat_row(rs.getString(3));
			sv.setSeat_column(rs.getString(4));
			sv.setTicket_is_valid(rs.getString(5));
			
			list2.add(sv);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return list1;
	}
	
	public List<SeatVO> selectSeatTotalByRow(String theaterNo, String screenNo) throws Exception {

		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_SEAT_TOTAL_BY_ROW);
		psmt.setString(1, theaterNo);
		psmt.setString(2, screenNo);
		
		ResultSet rs = psmt.executeQuery();
		
		List<SeatVO> list = new ArrayList<>();
		
		while(rs.next()) {
		
		SeatVO sv = new SeatVO();
		
		sv.setSeat_theater_no(rs.getString(1));
		sv.setSeat_screen_no(rs.getString(2));
		sv.setSeat_row(rs.getString(3));
		sv.setSeat_column(rs.getString(4));
		sv.setRow_total(rs.getString(5));
		
		list.add(sv);
		
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return list;
		
	}
	
	public List<SeatVO> selectSeatTotalByColumn(String theaterNo, String screenNo) throws Exception {

		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_SEAT_TOTAL_BY_COLUMN);
		psmt.setString(1, theaterNo);
		psmt.setString(2, screenNo);
		
		ResultSet rs = psmt.executeQuery();
		
		List<SeatVO> list = new ArrayList<>();
		
		while(rs.next()) {
		
		SeatVO sv = new SeatVO();
		
			sv.setSeat_theater_no(rs.getString(1));
			sv.setSeat_screen_no(rs.getString(2));
			sv.setSeat_row(rs.getString(3));
			sv.setSeat_column(rs.getString(4));
			sv.setRow_total(rs.getString(5));
			
			list.add(sv);
		
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return list;
		
	}
	
	public MovieSchduleVO selectMovieScheduleWithTheater(String theaterNo, 
											   String screenNo, 
											   String movieDate, 
											   String movieNo, 
											   String roundView) throws Exception {

		Connection conn = DBConfig.getConnection();

		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIE_SCHEDULE_WITH_THEATER);
		psmt.setString(1, theaterNo);
		psmt.setString(2, movieNo);
		psmt.setString(3, screenNo);
		psmt.setString(4, movieDate);
		psmt.setString(5, roundView);
		
		ResultSet rs = psmt.executeQuery();
		
		MovieSchduleVO msv = null;
		
		if(rs.next()) {
		
			msv = new MovieSchduleVO();
			
			msv.setSchedule_theater_no(rs.getString(1));
			msv.setSchedule_screen_no(rs.getString(2));
			msv.setSchedule_movie_no(rs.getString(3));
			msv.setSchedule_date(rs.getString(4));
			msv.setSchedule_start_time(rs.getString(5));
			msv.setSchedule_end_time(rs.getString(6));
			msv.setSchedule_round_view(rs.getString(7));
			msv.setTheater_name(rs.getString(8));
			msv.setScreen_name(rs.getString(9));
			
		}
		
		return msv;

	}
	
}


