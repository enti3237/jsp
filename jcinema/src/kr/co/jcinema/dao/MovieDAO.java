package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.vo.MovieVo;

public class MovieDAO {
	
	private static MovieDAO instance = new MovieDAO();
	
	public static MovieDAO getInstance() {
		return instance;
	}
	
	private MovieDAO () {}
	
	public void selectMovies() throws Exception {}

	public List<MovieVo> selectMovies(String theater_no, String schedule_date) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MOVIES_BY_THEATER);
		psmt.setString(1, theater_no);
		psmt.setString(2, schedule_date);
		
		ResultSet rs = psmt.executeQuery();
		
		List<MovieVo> movies = new ArrayList<MovieVo>();
		
		while(rs.next()) {
			
			MovieVo mv = new MovieVo();
			mv.setMovie_no(rs.getInt(3));
			mv.setMovie_title(rs.getString(9));
			mv.setMovie_grade(rs.getInt(10));
			
			movies.add(mv);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movies;
	
	}
	
	public void selectMovie() throws Exception {}
	
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
			
			// ȸ���� 1���� Ȯ���Ѵ�
			if(rs.getInt(7) == 1) {
				
				// �����Ͱ� �����ϴ��� Ȯ���Ѵ� (ó���̸� �����ϰ� msv �����͸� movieSchedule�� �ִ´�)
				if(movieSchedule != null) {
					
					// �����Ͱ� �����ϸ�(=ȸ���� �ѹ��� ���Ҵ�) 1������ movieSchedule�����͸� movieSchedules�� �ִ´�
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
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movieSchedules;
	}
	
	
	public void insertMovie() throws Exception {}
	public void updateMovie() throws Exception {}
	public void deleteMovie() throws Exception {}
	
	public List<MovieVo> selectPosters() throws Exception {
		
		Connection conn = DBConfig.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(SQL.SELECT_POSTERS);
		
		List<MovieVo> movies = new ArrayList<MovieVo>();

		while(rs.next()) {
			
			MovieVo mv = new MovieVo();
			mv.setMovie_no(rs.getInt(1));
			mv.setMovie_title(rs.getString(2));
			mv.setMovie_poster(rs.getString(3));
			
			movies.add(mv);
			
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return movies;
	}

	public List<List<Integer>> selectRemainSeatWithTotal(String ticketMovieDate,
														String ticketTheaterNo,
														String ticketMovieNo, 
														String ticketScreenNo) throws Exception {
	
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_REMAIN_SEAT_WITH_TOTAL);
		psmt.setString(1, ticketMovieDate);
		psmt.setString(2, ticketTheaterNo);
		psmt.setString(3, ticketMovieNo);
		psmt.setString(4, ticketScreenNo);
		
		ResultSet rs = psmt.executeQuery();
		
		List<List<Integer>> seats = new ArrayList<>();
		
		// ���⼭ SQL�� Ȯ���� �� �ִ� Ƽ�ϼ�-�����¼����� ����ȭ�ϴ� ����
		// 1�� ����Ʈ�� seats ���� �迭 seat�� �ݺ��� (...)
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


}
