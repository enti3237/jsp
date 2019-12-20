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
		
		// Ʈ����� ���� (�ߺ������� �Է� �� ���� ����)
		conn.setAutoCommit(false);

		// 3�ܰ�
		
		PreparedStatement psmtHit = conn.prepareStatement(SQL.UPDATE_ARTICLE_HIT);
		psmtHit.setString(1, seq);
		
		PreparedStatement psmtComment = conn.prepareStatement(SQL.SELECT_COMMENT_LIST);
		psmtComment.setString(1, seq);
		
		// 4�ܰ�
		ResultSet rsComment = psmtComment.executeQuery();
		psmtHit.executeUpdate();
		
		// Ʈ����� �� (����)
		conn.commit();
		
		// 5�ܰ�

		
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

		
		// 6�ܰ�
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
