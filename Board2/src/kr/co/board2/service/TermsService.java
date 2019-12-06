package kr.co.board2.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;
import kr.co.board2.vo.BoardTermsVO;

public class TermsService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 1, 2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		Statement stmt = conn.createStatement();
		
		// 4단계
		ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);

		// 5단계
		BoardTermsVO btv = new BoardTermsVO();
		
		if(rs.next()) {
			btv.setTerms(rs.getString(1));
			btv.setPrivacy(rs.getString(2));
		}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();

		// 뷰에서 출력하기위한 데이터 공유
		req.setAttribute("btv", btv);
		
		return "/user/terms.jsp";		
	}
}
