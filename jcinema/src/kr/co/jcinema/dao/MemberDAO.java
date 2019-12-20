package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.vo.MemberVO;

public class MemberDAO {
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {return instance;}
	private MemberDAO() {}
	
	public int selectCheckUid(String uid) throws Exception {

		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_CHECK_UID);
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		
		int result = 0;
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return result;
	}
	
	public void insertMember(MemberVO mv) throws Exception {
				
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_MEMBER);
		psmt.setString(1, mv.getUser_id());
		psmt.setString(2, mv.getUser_pass());
		psmt.setString(3, mv.getUser_name());
		psmt.setString(4, mv.getUser_email());
		psmt.setString(5, mv.getUser_tel());
		psmt.setString(6, mv.getUser_hp());
		psmt.setInt(7, mv.getUser_grade());
		psmt.setString(8, mv.getUser_addr_type());
		psmt.setString(9, mv.getUser_zip());
		psmt.setString(10, mv.getUser_addr_main());
		psmt.setString(11, mv.getUser_addr_detail());
		psmt.setString(12, mv.getUser_regip());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}
	
	public MemberVO selectMember(String uid, String pass) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LOGIN);
		psmt.setString(1, uid);
		psmt.setString(2, pass);
		
		ResultSet rs = psmt.executeQuery();
		
		MemberVO mv = null;
		
		if(rs.next()) {
			mv = new MemberVO();
			
			mv.setUser_id(rs.getString(1));
			mv.setUser_pass(rs.getString(2));
			mv.setUser_name(rs.getString(3));
			mv.setUser_email(rs.getString(4));
			mv.setUser_tel(rs.getString(5));
			mv.setUser_hp(rs.getString(6));
			mv.setUser_grade(rs.getInt(7));
			mv.setUser_point(rs.getInt(8));
			mv.setUser_addr_type(rs.getString(9));
			mv.setUser_zip(rs.getString(10));
			mv.setUser_addr_main(rs.getString(11));
			mv.setUser_addr_detail(rs.getString(12));
			mv.setUser_agree_point(rs.getString(13));
			mv.setUser_agree_site(rs.getString(14));
			mv.setUser_regip(rs.getString(15));
			mv.setUser_rdate(rs.getString(16));
			
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return mv;
			
	}
	
	
	public void updateMember(MemberVO mv) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.UPATE_MEMBER);
		psmt.setString(1, mv.getUser_pass());
		psmt.setString(2, mv.getUser_name());
		psmt.setString(3, mv.getUser_tel());
		psmt.setString(4, mv.getUser_addr_type());
		psmt.setString(5, mv.getUser_zip());
		psmt.setString(6, mv.getUser_addr_main());
		psmt.setString(7, mv.getUser_addr_detail());
		psmt.setString(8, mv.getUser_agree_point());
		psmt.setString(9, mv.getUser_agree_site());
		psmt.setString(10, mv.getUser_id());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}
	
	public void deleteMember() throws Exception {}
	
	
}
