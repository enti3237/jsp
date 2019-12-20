package kr.co.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.BoardDAO;
import kr.co.farmstory2.vo.BoardVO;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		String pg = req.getParameter("pg");
		String title = getCategoryTitle(cate);

		
		if(pg == null){	pg = "1";}

		BoardDAO dao = BoardDAO.getInstance();
		

		// ������ ���� ���� ����
		int total = dao.selectArticleTotal(cate);
		int lastPage = 0;
		int listCount = 0;
		int currentPg = Integer.parseInt(pg);
		int limitBegin = (currentPg - 1) * 10;
		int groupCurrent = (int) Math.ceil(currentPg / 10.0); // 1/10=0.0123�� �� ���� �ø��ؼ� 1�� ����� �׷����Ѵ�
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupStart * 10;
		
		
		if (total % 10 != 0) {
			lastPage = total / 10 + 1;
		} else {
			lastPage = total / 10;
		}
		
		// 10���� �� ������ ������ ��� ������ �������� �ϳ� �� ����� �� ����
		if (groupEnd > lastPage) {
			groupEnd = lastPage;
		}

		// groupEnd�� �� �������� ���� ���
		listCount = total - limitBegin;
		

		List<BoardVO> articleList = dao.selectArticleList(limitBegin, cate);
		
		

		
		req.setAttribute("boardGroup", group);
		req.setAttribute("category", cate);
		req.setAttribute("title", title);
		
		// articleList�� requestScope�� �����ؼ� list���� ǥ������ �ҷ��� �� �ֵ��� �Ѵ�
		req.setAttribute("articleList", articleList);

		// ������ȣ ����
		req.setAttribute("listCount", listCount+1);
		
		// ��������ȣ��
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("currentPg", currentPg);

		
		return "/board/list.jsp";
	}
	
	public String getCategoryTitle(String cate) {
		
		String title = "";
		
		switch (cate) {
			case "market": title="�庸��"; break;
			case "story": title="���۹��̾߱�"; break;
			case "grow": title="�Թ簡�ٱ�"; break;
			case "school": title="�ͳ��б�"; break;
			case "event": title="�̺�Ʈ"; break;
			case "notice": title="��������"; break;
			case "menu": title="�����ǽĴ�"; break;
			case "chef": title="�����丮��"; break;
			case "qna": title="������"; break;
			case "faq": title="���ֹ�������"; break;
			}
		return title;
	}
	
}
