package kr.co.jcinema.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.admin.vo.ScreenVO;
import kr.co.jcinema.admin.vo.TheaterVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL_ADMIN;
import kr.co.jcinema.vo.MovieVo;

public class AdminMovieDAO {
	
	private static AdminMovieDAO instance = new AdminMovieDAO();
	
	public static AdminMovieDAO getInstance() {
		return instance;
	}
	
	private AdminMovieDAO () {}
	
	public void selectMovies() throws Exception {}
	public void selectMovie() throws Exception {}
	public void insertMovie() throws Exception {}
	public void updateMovie() throws Exception {}
	public void deleteMovie() throws Exception {}

	public void selectMovieSchedules() throws Exception {}
	public void selectMovieSchedule() throws Exception {}
	
	public void insertMovieSchedule(MovieScheduleVO msv) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.INSERT_MOVIE_SCHDULE);
		psmt.setString(1, msv.getSchedule_theater_no());
		psmt.setString(2, msv.getSchedule_screen_no());
		psmt.setString(3, msv.getSchedule_movie_no());
		psmt.setString(4, msv.getSchedule_date());
		psmt.setString(5, msv.getSchedule_start_time());
		psmt.setString(6, msv.getSchedule_end_time());
		psmt.setString(7, msv.getSchedule_round_view());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}
	public void updateMovieSchedule() throws Exception {}
	public void deleteMovieSchedule() throws Exception {}

}
