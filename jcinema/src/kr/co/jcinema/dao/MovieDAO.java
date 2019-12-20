package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
	public void selectMovie() throws Exception {}
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




}
