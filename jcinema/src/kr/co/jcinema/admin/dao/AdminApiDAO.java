package kr.co.jcinema.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.Statement;
import com.sun.swing.internal.plaf.metal.resources.metal;

import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.admin.vo.ScreenVO;
import kr.co.jcinema.admin.vo.TheaterVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL_ADMIN;
import kr.co.jcinema.vo.MovieVO;

public class AdminApiDAO {
	
	private static AdminApiDAO instance = new AdminApiDAO();
	
	public static AdminApiDAO getInstance() {
		return instance;
	}
	
	private AdminApiDAO () {}
	
	public Map<String, List<TheaterVO>> selectTheaters() throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_THEATERS);
		
		ResultSet rs = psmt.executeQuery();
		
		// �ε��� String �� ���� �̸�, List �� �����迭
		Map<String, List<TheaterVO>> map = new HashMap<>();
		List<TheaterVO> list = null;
		
		boolean isStart = true;
		int totalListCount = 0;
		
		while(rs.next()) {
			
			// �ű� ����Ʈ��ü�� �ѹ� ����� �� ���� while �� �ݺ������� ������ �ʴ´�.
			if(isStart) {
				list = new ArrayList<>();
				isStart = false;
			}
			
			TheaterVO tv = new TheaterVO();

			String city = rs.getString(4);
			// �� ���������� �߰��� JC_THEATER ���̺��� 8��° Į��-theater_cityĮ���� ī��Ʈ��
			int count = rs.getInt(8);
			
			tv.setTheater_no(rs.getInt(1));
			tv.setTheater_local_code(rs.getInt(2));
			tv.setTheater_name(rs.getString(3));
			tv.setTheater_city(city);
			tv.setTheater_addr(rs.getString(5));
			tv.setTheater_tel(rs.getString(6));
			tv.setTheater_screen_count(rs.getInt(7));
			
			list.add(tv);
			totalListCount++;
			
			// while���� �ѹ��� �� ������ �߰��Ǵ� totalListCount ���� theater_city�� count ���� ��ġ�ϸ� �迭�� map�� ����
			// �� �� isStart�� �ٽ� true�� ����� �ű� ����Ʈ��ü�� ���� �غ� �Ѵ�.
			if(totalListCount == count) {
				map.put(city, list);
				totalListCount = 0;
				isStart = true;
			}
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return map;
	}
	
	public List<TheaterVO> selectTheater(String city) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_THEATER);
		psmt.setString(1, city);
		
		ResultSet rs = psmt.executeQuery();
		
		List<TheaterVO> theaters = new ArrayList<TheaterVO>();
		
		while(rs.next()) {
			
			TheaterVO tv = new TheaterVO();
			tv.setTheater_no(rs.getInt(1));
			tv.setTheater_local_code(rs.getInt(2));
			tv.setTheater_name(rs.getString(3));

			theaters.add(tv);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return theaters;
		
	}
	
	public List<ScreenVO> selectScreen(String theater_no) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_SCREEN);
		psmt.setString(1, theater_no);
		
		ResultSet rs = psmt.executeQuery();
		
		List<ScreenVO> screens = new ArrayList<>();
		
		while(rs.next()) {
			
			ScreenVO sv = new ScreenVO();
			sv.setScreen_no(rs.getInt(1));
			sv.setScreen_name(rs.getString(2));
			sv.setScreen_total_seat(rs.getInt(3));
			sv.setScreen_theater_no(rs.getInt(4));
			
			screens.add(sv);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return screens;
		
	}

	public List<MovieVO> selectMovies(String title) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_MOVIES);
		psmt.setString(1, "%"+title+"%");
		
		ResultSet rs = psmt.executeQuery();
		
		List<MovieVO> movies = new ArrayList<>();
		
		while(rs.next()) {
			
			MovieVO mv = new MovieVO();
			
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
			
			movies.add(mv);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movies;
	}
	
	public MovieScheduleVO selectMovieSchedule(String theater_no,String screen_no, String schedule_date, String round_view) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_MOVIE_SCHEDULE);
		psmt.setString(1, theater_no);
		psmt.setString(2, screen_no);
		psmt.setString(3, schedule_date);
		psmt.setString(4, round_view);
		
		ResultSet rs = psmt.executeQuery();
		
		MovieScheduleVO msv = null;
		
		if(rs.next()) {
			
			msv = new MovieScheduleVO();
			msv.setSchedule_theater_no(rs.getString(1));
			msv.setSchedule_screen_no(rs.getString(2));
			msv.setSchedule_movie_no(rs.getString(3));
			msv.setSchedule_date(rs.getString(4));
			msv.setSchedule_start_time(rs.getString(5));
			msv.setSchedule_end_time(rs.getString(6));
			msv.setSchedule_round_view(rs.getString(7));
			msv.setMovie_title(rs.getString(8));
			
		}

		return msv;
	}
	
	
}
