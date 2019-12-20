package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.vo.BoardVO;
import kr.co.farmstory2.vo.UserVO;

public class ViewService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		String title = getCategoryTitle(cate);
		
		String seq = req.getParameter("seq");
		String pg  = req.getParameter("pg");
		String nick = req.getParameter("nick");
		String parent = req.getParameter("parent");
		

		UserVO uv= (UserVO)session.getAttribute("member");

		Connection conn = DBConfig.getConnection();
		
		// 트랜잭션 시작 (중복데이터 입력 시 누락 방지)
		conn.setAutoCommit(false);

		// 3단계
		
		PreparedStatement psmtHit = conn.prepareStatement(SQL.UPDATE_ARTICLE_HIT);
		psmtHit.setString(1, seq);
		
		PreparedStatement psmtComment = conn.prepareStatement(SQL.SELECT_COMMENT_LIST);
		psmtComment.setString(1, seq);
		
		// 4단계
		ResultSet rsComment = psmtComment.executeQuery();
		psmtHit.executeUpdate();
		
		// 트랜잭션 끝 (실행)
		conn.commit();
		
		// 5단계

		
		List<BoardVO> commentList = new ArrayList<>();
		
		while(rsComment.next()){
			
			BoardVO comment = new BoardVO();
			comment.setSeq(rsComment.getInt(1));
			comment.setParent(rsComment.getInt(2));
			comment.setComment(rsComment.getInt(3));
			comment.setCate(rsComment.getString(4));
			comment.setTitle(rsComment.getString(5));
			comment.setContent(rsComment.getString(6));
			comment.setFile(rsComment.getInt(7));
			comment.setHit(rsComment.getInt(8));
			comment.setUid(rsComment.getString(9));
			comment.setRegip(rsComment.getString(10));
			comment.setRdate(rsComment.getString(11));
			
			commentList.add(comment);
		}

		
		// 6단계
		rs.close();
		psmtView.close();
		psmtHit.close();
		conn.close();

		
		
		
		
		
		
		req.setAttribute("boardGroup", group);
		req.setAttribute("category", cate);
		req.setAttribute("title", title);
	
		
		
		
		
		
		
		
		
		return "/board/view.jsp";
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
