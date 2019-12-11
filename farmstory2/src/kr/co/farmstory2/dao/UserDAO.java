package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.SQL;
import kr.co.farmstory2.vo.UserVO;

public class UserDAO {

	// 싱글톤 객체
	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	private UserDAO() {}

	// LoginService
	public UserVO selectUser(String uid, String pass) throws Exception {

		// 1, 2단계 - 데이터베이스 접속
		Connection conn = DBConfig.getConnection();

		// 3단계 - SQL 실행객체 생성
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LOGIN);
		psmt.setString(1, uid);
		psmt.setString(2, pass);

		// 4단계
		ResultSet rs = psmt.executeQuery();

		UserVO uv = null;

		// 5단계
		if (rs.next()) {

			// 입력한 아이디, 비밀번호를 가진 회원이 있으면 신규 자바빈 객체를 생성하여 얻어온 데이터베이스의 정보를 저장한다
			uv = new UserVO();

			uv.setUid(rs.getString(1));
			uv.setPass(rs.getString(2));
			uv.setName(rs.getString(3));
			uv.setNick(rs.getString(4));
			uv.setEmail(rs.getString(5));
			uv.setHp(rs.getString(6));
			uv.setGrade(rs.getInt(7));
			uv.setZip(rs.getString(8));
			uv.setAddr1(rs.getString(9));
			uv.setAddr2(rs.getString(10));
			uv.setRegip(rs.getString(11));
			uv.setRdate(rs.getString(12));
		}

		// 6단계 - 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();

		return uv;
	}

	public void insertUser() throws Exception {}
	public void checkUserId() throws Exception {}
	public void checkUserEmail() throws Exception {}
	public void checkUserHp() throws Exception {}
	public void checkUserNick() throws Exception {}
	public void selectTerms() throws Exception {}
	
}
