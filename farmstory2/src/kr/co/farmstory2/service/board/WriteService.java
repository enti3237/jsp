package kr.co.farmstory2.service.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.BoardDAO;
import kr.co.farmstory2.vo.UserVO;

public class WriteService implements CommonService {


	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			
			String path = req.getServletContext().getRealPath("/data");	

			int maxSize = 1024 * 1024 * 10; // 10MB

			// multipart 폼데이터(첨부파일)을 전송받는 mr객체를 생성하면서 파일저장 및 폼데이터 수신
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			String group = mr.getParameter("group");
			String cate  = mr.getParameter("cate");
			String title = getCategoryTitle(cate);			
			String subject  = mr.getParameter("subject");
			String content  = mr.getParameter("content");
			String fileName = mr.getFilesystemName("file");
			String regip    = req.getRemoteAddr();
			
			HttpSession session = req.getSession();
			UserVO uv = (UserVO)session.getAttribute("user");
			String uid = uv.getUid();
			
			if(fileName != null){
				// 1) 코드화된 파일명 생성(UUID)
				int idx = fileName.lastIndexOf(".");
				String ext = fileName.substring(idx); // 파일 확장자
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
				String now = sdf.format(new Date());
				
				String newFileName = now+uid+ext; // 191126111912_chhak.hwp
				
				// 2) 저장된 첨부 파일명 수정
				File oldFile = new File(path+"/"+fileName);
				File newFile = new File(path+"/"+newFileName);
				
				oldFile.renameTo(newFile);
			
				// 3) 원본 파일명과 코드화된 파일명을 테이블 저장 및 글 등록
				BoardDAO dao = BoardDAO.getInstance();
				
				dao.insertArticle(cate, subject, content, 1, uid, regip);
				int parent = dao.selectMaxSeq();
				dao.insertFile(parent, fileName, newFileName);
				
				
			}else {
				
				// 파일첨부 안했을 경우
				BoardDAO dao = BoardDAO.getInstance();
				dao.insertArticle(cate, subject, content, 0, uid, regip);				
			}
			
			return "redirect:/farmstory2/board/list.do?group="+group+"&cate="+cate;
			
		}else {
			
			// GET 요청일때
			String group = req.getParameter("group");
			String cate  = req.getParameter("cate");
			String title = getCategoryTitle(cate);
			
			
			req.setAttribute("boardGroup", group);
			req.setAttribute("category", cate);
			req.setAttribute("title", title);
			
			return "/board/write.jsp";
		}
	}
	
	public String getCategoryTitle(String cate) {
		
		String title = "";
		
		switch (cate) {
			case "market":title="장보기";break;
			case "story":title="농작물이야기";break;
			case "grow":title="텃밭가꾸기";break;
			case "school":title="귀농학교";break;
			case "event":title="이벤트";break;
			case "notice":title="공지사항";break;
			case "menu":title="오늘의 식단";break;
			case "chef":title="나도 요리사";break;
			case "qna":title="고객문의";break;
			case "faq":title="자주 묻는 질문";break;
		}
		return title;
	}
}