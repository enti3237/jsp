package kr.co.board2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.BoardDAO;
import kr.co.board2.vo.BoardArticleVO;
import kr.co.board2.vo.BoardMemberVO;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// 세션에 저장된 데이터를 bmv로 도로 빼낸다 - 다운캐스팅 시켜야함
		HttpSession session = req.getSession();
		BoardMemberVO bmv = (BoardMemberVO) session.getAttribute("member");

		/*
		 * if(bmv == null){ // 로그인을 안했으면
		 * response.sendRedirect("/Board1/user/login.jsp"); // 로그인 페이지로 이동하고 return; //
		 * 여기까지만 프로그램 실행 }
		 */

		String pg = req.getParameter("pg");

		// 로그인해서 리스트로 바로 들어왔을 경우 = pg 값이 리퀘스트 되지 않는 경우의 대비
		if (pg == null) {
			pg = "1";
		}

		BoardDAO dao = BoardDAO.getInstance();

		// 페이지 관련 변수 선언
		int total = dao.selectArticleTotal();
		int lastPage = 0;
		int listCount = 0;

		// BoardDAO에서 계산식만 빼냄

		if (total % 10 != 0) {
			lastPage = total / 10 + 1;
		} else {
			lastPage = total / 10;
		}

		int currentPg = Integer.parseInt(pg);
		int limitBegin = (currentPg - 1) * 10;
		int groupCurrent = (int) Math.ceil(currentPg / 10.0); // 1/10=0.0123이 될 값을 올림해서 1로 만들고 그루핑한다
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupStart + 9;

		// 10으로 딱 나누어 떨어질 경우 마지막 페이지가 하나 더 생기는 걸 방지

		if (groupEnd > lastPage) {
			groupEnd = lastPage;
		}

		// groupEnd가 딱 떨어지지 않을 경우

		listCount = total - limitBegin;

		List<BoardArticleVO> articleList = dao.selectArticles(limitBegin);

		// articleList를 requestScope에 저장해서 list에서 표현언어로 불러올 수 있도록 한다
		req.setAttribute("articleList", articleList);
		// 문서번호 정렬
		req.setAttribute("listCount", listCount + 1);
		// 페이지번호용
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("currentPg", currentPg);

		return "/list.jsp";
	}

	public void getCurrentPage() {

	}
}
