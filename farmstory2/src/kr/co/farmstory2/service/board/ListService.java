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
		

		// 페이지 관련 변수 선언
		int total = dao.selectArticleTotal(cate);
		int lastPage = 0;
		int listCount = 0;
		int currentPg = Integer.parseInt(pg);
		int limitBegin = (currentPg - 1) * 10;
		int groupCurrent = (int) Math.ceil(currentPg / 10.0); // 1/10=0.0123이 될 값을 올림해서 1로 만들고 그루핑한다
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupStart * 10;
		
		
		if (total % 10 != 0) {
			lastPage = total / 10 + 1;
		} else {
			lastPage = total / 10;
		}
		
		// 10으로 딱 나누어 떨어질 경우 마지막 페이지가 하나 더 생기는 걸 방지
		if (groupEnd > lastPage) {
			groupEnd = lastPage;
		}

		// groupEnd가 딱 떨어지지 않을 경우
		listCount = total - limitBegin;
		

		List<BoardVO> articleList = dao.selectArticleList(limitBegin, cate);
		
		

		
		req.setAttribute("boardGroup", group);
		req.setAttribute("category", cate);
		req.setAttribute("title", title);
		
		// articleList를 requestScope에 저장해서 list에서 표현언어로 불러올 수 있도록 한다
		req.setAttribute("articleList", articleList);

		// 문서번호 정렬
		req.setAttribute("listCount", listCount+1);
		
		// 페이지번호용
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("currentPg", currentPg);

		
		return "/board/list.jsp";
	}
	
	public String getCategoryTitle(String cate) {
		
		String title = "";
		
		switch (cate) {
			case "market": title="장보기"; break;
			case "story": title="농작물이야기"; break;
			case "grow": title="텃밭가꾸기"; break;
			case "school": title="귀농학교"; break;
			case "event": title="이벤트"; break;
			case "notice": title="공지사항"; break;
			case "menu": title="오늘의식단"; break;
			case "chef": title="나도요리사"; break;
			case "qna": title="고객문의"; break;
			case "faq": title="자주묻는질문"; break;
			}
		return title;
	}
	
}
