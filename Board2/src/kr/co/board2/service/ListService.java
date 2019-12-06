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

		// ���ǿ� ����� �����͸� bmv�� ���� ������ - �ٿ�ĳ���� ���Ѿ���
		HttpSession session = req.getSession();
		BoardMemberVO bmv = (BoardMemberVO) session.getAttribute("member");

		/*
		 * if(bmv == null){ // �α����� ��������
		 * response.sendRedirect("/Board1/user/login.jsp"); // �α��� �������� �̵��ϰ� return; //
		 * ��������� ���α׷� ���� }
		 */

		String pg = req.getParameter("pg");

		// �α����ؼ� ����Ʈ�� �ٷ� ������ ��� = pg ���� ������Ʈ ���� �ʴ� ����� ���
		if (pg == null) {
			pg = "1";
		}

		BoardDAO dao = BoardDAO.getInstance();

		// ������ ���� ���� ����
		int total = dao.selectArticleTotal();
		int lastPage = 0;
		int listCount = 0;

		// BoardDAO���� ���ĸ� ����

		if (total % 10 != 0) {
			lastPage = total / 10 + 1;
		} else {
			lastPage = total / 10;
		}

		int currentPg = Integer.parseInt(pg);
		int limitBegin = (currentPg - 1) * 10;
		int groupCurrent = (int) Math.ceil(currentPg / 10.0); // 1/10=0.0123�� �� ���� �ø��ؼ� 1�� ����� �׷����Ѵ�
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupStart + 9;

		// 10���� �� ������ ������ ��� ������ �������� �ϳ� �� ����� �� ����

		if (groupEnd > lastPage) {
			groupEnd = lastPage;
		}

		// groupEnd�� �� �������� ���� ���

		listCount = total - limitBegin;

		List<BoardArticleVO> articleList = dao.selectArticles(limitBegin);

		// articleList�� requestScope�� �����ؼ� list���� ǥ������ �ҷ��� �� �ֵ��� �Ѵ�
		req.setAttribute("articleList", articleList);
		// ������ȣ ����
		req.setAttribute("listCount", listCount + 1);
		// ��������ȣ��
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("currentPg", currentPg);

		return "/list.jsp";
	}

	public void getCurrentPage() {

	}
}
