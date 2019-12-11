package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.SQL;
import kr.co.farmstory2.vo.BoardVO;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private BoardDAO() {}
	
	public void selectArticleList() throws Exception {}
	public void insertArticle() throws Exception {}
	public void selectArticle() throws Exception {}
	public void updateArticle() throws Exception {}
	public void deleteArticle() throws Exception {}
	public void insertComment() throws Exception {}
	public void updateComment() throws Exception {}
	public void deleteComment() throws Exception {}
	public void selectMaxSeq() throws Exception {}

	public List<BoardVO> selectLatest(String cate) throws Exception {
		Connection conn = DBConfig.getConnection();

		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LATEST_BOARD);
		psmt.setString(1, cate); 

		ResultSet rs = psmt.executeQuery();

		List<BoardVO> latests = new ArrayList<>();

		while (rs.next()) {
			BoardVO bv = new BoardVO();

			bv.setTitle(rs.getString(1));
			bv.setRdate(rs.getString(2));

			latests.add(bv);
		}

		// 6´Ü°è
		rs.close();
		psmt.close();
		conn.close();

		return latests;
	}
}