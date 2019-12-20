package kr.co.farmstory2.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.SQL;
import kr.co.farmstory2.vo.BoardVO;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {return instance;}

	private BoardDAO() {}

	public List<BoardVO> selectArticleList(int limitBegin, String cate) throws Exception {
		
		Connection conn = DBConfig.getConnection();

		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_LIST);
		psmt.setString(1, cate);
		psmt.setInt(2, limitBegin); // 매핑 - LIMIT ?, 10; 의 ?

		ResultSet rs = psmt.executeQuery();

		List<BoardVO> articleList = new ArrayList<>();

		while (rs.next()) {
			BoardVO bv = new BoardVO();

			bv.setSeq(rs.getInt(1));
			bv.setParent(rs.getInt(2));
			bv.setComment(rs.getInt(3));
			bv.setCate(rs.getString(4));
			bv.setTitle(rs.getString(5));
			bv.setContent(rs.getString(6));
			bv.setFile(rs.getInt(7));
			bv.setHit(rs.getInt(8));
			bv.setUid(rs.getString(9));
			bv.setRegip(rs.getString(10));
			bv.setRdate(rs.getString(11));
			bv.setNick(rs.getString(12));

			articleList.add(bv);
		}

		// 6단계
		rs.close();
		psmt.close();
		conn.close();

		return articleList;
	}
	
	public void insertArticle(String cate, String title, String content, int file, String uid, String regip) throws Exception {
		
		Connection conn = DBConfig.getConnection();

		// 트랜잭션 시작 - 잘못되면 다시 시작해야하기 때문에 4단계 위가 아닌 3단계 위에서 시작한다
		conn.setAutoCommit(false);

		// 3단계
		PreparedStatement psmt1 = conn.prepareStatement(SQL.INSERT_ARTICLE);
		psmt1.setInt(1, 0); // parent
		psmt1.setString(2, cate); // cate
		psmt1.setString(3, title); // title
		psmt1.setString(4, content);// content
		psmt1.setInt(5, file); // file 첨부상태
		psmt1.setString(6, uid); // uid
		psmt1.setString(7, regip); // regip

		// 4단계
		psmt1.executeUpdate();
		
		// 5단계 트랜잭션 끝 (혹시 모를 동시업로드 방지)
		conn.commit();

		// 6단계
		psmt1.close();
		conn.close();
	}
		
	public void selectArticle() throws Exception {}
	
	public void selectArticleView() throws Exception {
		
		Connection conn = DBConfig.getConnection();
		conn.setAutoCommit(false);
		
		PreparedStatement psmtView = conn.prepareStatement(SQL.SELECT_ARTICLE_VIEW);
		psmtView.setString(1, seq);
		
		ResultSet rs = psmtView.executeQuery();
		conn.commit();
		
		BoardVO bv = new BoardVO();
		
		if(rs.next()){
			bv.setSeq(rs.getInt(1));
			bv.setParent(rs.getInt(2));
			bv.setComment(rs.getInt(3));
			bv.setCate(rs.getString(4));
			bv.setTitle(rs.getString(5));
			bv.setContent(rs.getString(6));
			bv.setFile(rs.getInt(7));
			bv.setHit(rs.getInt(8));
			bv.setUid(rs.getString(9));
			bv.setRegip(rs.getString(10));
			bv.setRdate(rs.getString(11));
			bv.setOldName(rs.getString(14));
			bv.setDownload(rs.getInt(16));
		}		
		
	}
	
	public void updateArticle() throws Exception {}		
	
	public void updateArticleHit() throws Exception {}		
	
	public void deleteArticle() throws Exception {}
	public void insertComment() throws Exception {}
	public void updateComment() throws Exception {}
	public void deleteComment() throws Exception {}

	public void selectCommentList() throws Exception {}
	
	public void insertFile(int parent, String fileName, String newFileName) throws Exception {
		
		Connection conn = DBConfig.getConnection();

		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_FILE);
		psmt.setInt(1, parent);
		psmt.setString(2, fileName);
		psmt.setString(3, newFileName);

		psmt.executeUpdate();

		psmt.close();
		conn.close();
	}
	
	public int selectMaxSeq() throws Exception {

		Connection conn = DBConfig.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(SQL.SELECT_MAX_SEQ);
		int parent = 0;
		if (rs.next()) {parent = rs.getInt(1);}
		rs.close();
		stmt.close();
		conn.close();
		
		return parent;
	}
	
	public int selectArticleTotal(String cate) throws Exception {

		Connection conn = DBConfig.getConnection();

		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_TOTAL);
		psmt.setString(1, cate);

		ResultSet rs = psmt.executeQuery();

		int total = 0;

		if (rs.next()) {
			total = rs.getInt(1);
		}

		rs.close();
		psmt.close();
		conn.close();

		return total;
	}
	
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

		rs.close();
		psmt.close();
		conn.close();

		return latests;
	}

}