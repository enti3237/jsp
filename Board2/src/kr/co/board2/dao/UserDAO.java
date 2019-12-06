package kr.co.board2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.vo.BoardMemberVO;

public class UserDAO {

	// 싱글톤 객체
	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	private UserDAO() {
	}

	// LoginService
	public BoardMemberVO selectUser(String uid, String pass) throws Exception {

		// 1, 2단계 - 데이터베이스 접속
		Connection conn = DBConfig.getConnection();

		// 3단계 - SQL 실행객체 생성
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LOGIN);
		psmt.setString(1, uid);
		psmt.setString(2, pass);

		// 4단계
		ResultSet rs = psmt.executeQuery();

		BoardMemberVO bmv = null;

		// 5단계
		if (rs.next()) {

			// 입력한 아이디, 비밀번호를 가진 회원이 있으면 신규 자바빈 객체를 생성하여 얻어온 데이터베이스의 정보를 저장한다
			bmv = new BoardMemberVO();

			bmv.setUid(rs.getString(1));
			bmv.setPass(rs.getString(2));
			bmv.setName(rs.getString(3));
			bmv.setNick(rs.getString(4));
			bmv.setEmail(rs.getString(5));
			bmv.setHp(rs.getString(6));
			bmv.setGrade(rs.getInt(7));
			bmv.setZip(rs.getString(8));
			bmv.setAddr1(rs.getString(9));
			bmv.setAddr2(rs.getString(10));
			bmv.setRegip(rs.getString(11));
			bmv.setRdate(rs.getString(12));
		}

		// 6단계 - 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();

		return bmv;
	}

	// RegisterService
	// (String uid, String pass1, String name, String nick, String email, String hp, String zip, String addr1, String addr2, String regip) 다 치지 말고
	public void insertUser(BoardMemberVO bmv) throws Exception {

		// 1, 2단계 - 데이터베이스 접속
		Connection conn = DBConfig.getConnection();

		// 3단계 - SQL 실행객체 생성
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_USER);
		psmt.setString(1, bmv.getUid());
		psmt.setString(2, bmv.getPass());
		psmt.setString(3, bmv.getName());
		psmt.setString(4, bmv.getNick());
		psmt.setString(5, bmv.getEmail());
		psmt.setString(6, bmv.getHp());
		psmt.setString(7, bmv.getZip());
		psmt.setString(8, bmv.getAddr1());
		psmt.setString(9, bmv.getAddr2());
		psmt.setString(10, bmv.getRegip());

		// 4단계 - SQL 실행
		psmt.executeUpdate();

		// 5단계 - SELECT 결과셋 처리
		// 6단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
	}

	public void selectTerms() throws Exception {
	}

	public void checkUid() throws Exception {
	}

	public void checkHp() throws Exception {
	}

	public void checkNick() throws Exception {
	}

	public void checkEmail() throws Exception {
	}

}
