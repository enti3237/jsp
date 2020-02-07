package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.vo.BoardArticleVO;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private BoardDAO() {
	}

	// ListService (1/2) - 각 SQL을 분리해서 적용함
	public List<BoardArticleVO> selectArticles(int limitBegin) throws Exception {
		// 1,2단계
		Connection conn = DBConfig.getConnection();

		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_LIST);
		psmt.setInt(1, limitBegin); // 매핑 - LIMIT ?, 10; 의 ?

		// 4단계
		ResultSet rs = psmt.executeQuery();

		// 5단계
		List<BoardArticleVO> articleList = new ArrayList<>();

		while (rs.next()) {
			BoardArticleVO bav = new BoardArticleVO();

			bav.setSeq(rs.getInt(1));
			bav.setParent(rs.getInt(2));
			bav.setComment(rs.getInt(3));
			bav.setCate(rs.getString(4));
			bav.setTitle(rs.getString(5));
			bav.setContent(rs.getString(6));
			bav.setFile(rs.getInt(7));
			bav.setHit(rs.getInt(8));
			bav.setUid(rs.getString(9));
			bav.setRegip(rs.getString(10));
			bav.setRdate(rs.getString(11));
			bav.setNick(rs.getString(12));

			articleList.add(bav);
		}

		// 6단계
		rs.close();
		psmt.close();
		conn.close();

		return articleList;
	}

	public void selectAtricle() throws Exception {
	}

	public void insertArticle() throws Exception {
	}

	public void updateArticle() throws Exception {
	}

	public void deleteArticle() throws Exception {
	}

	public void selectComments() throws Exception {
	}

	// ListService (2/2) - 각 SQL을 분리해서 적용함
	public int selectArticleTotal() throws Exception {

		// 1,2단계
		Connection conn = DBConfig.getConnection();

		// 3단계
		Statement stmt = conn.createStatement();

		// 4단계
		ResultSet rsTotal = stmt.executeQuery(SQL.SELECT_ARTICLE_TOTAL);

		// 5단계
		int total = 0;

		if (total % 10 != 0) {
			total = rsTotal.getInt(1);
		}

		// 6단계
		rsTotal.close();
		stmt.close();
		conn.close();

		return total;

	}

	public void selectMaxSeq() throws Exception {
	}

	public void insertFile() throws Exception {
	}

}
